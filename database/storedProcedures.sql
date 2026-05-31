USE WorldBuilderPlatformDB
GO

CREATE OR ALTER PROCEDURE sp_ReorderStorySegment
    @segment_id INT,
    @new_order_index INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @universe_id INT;
    DECLARE @old_order_index INT;

    SELECT 
        @universe_id = universe_id,
        @old_order_index = order_index
    FROM StorySegment
    WHERE segment_id = @segment_id;

    IF @universe_id IS NULL
    BEGIN
        RAISERROR('Story segment does not exist.', 16, 1);
        RETURN;
    END

    IF @new_order_index < 1
    BEGIN
        RAISERROR('Order index must be greater than or equal to 1.', 16, 1);
        RETURN;
    END

    BEGIN TRANSACTION;

    UPDATE StorySegment
    SET order_index = -1
    WHERE segment_id = @segment_id;

    IF @new_order_index < @old_order_index
    BEGIN
        UPDATE StorySegment
        SET order_index = order_index + 1
        WHERE universe_id = @universe_id
          AND order_index >= @new_order_index
          AND order_index < @old_order_index;
    END

    IF @new_order_index > @old_order_index
    BEGIN
        UPDATE StorySegment
        SET order_index = order_index - 1
        WHERE universe_id = @universe_id
          AND order_index > @old_order_index
          AND order_index <= @new_order_index;
    END

    UPDATE StorySegment
    SET order_index = @new_order_index
    WHERE segment_id = @segment_id;

    COMMIT TRANSACTION;
END;
GO



CREATE OR ALTER PROCEDURE sp_AddFavoriteUniverse
    @user_id INT,
    @universe_id INT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM Universe
        WHERE universe_id = @universe_id
          AND owner_id = @user_id
    )
    BEGIN
        RAISERROR('User cannot add their own universe to favorites.', 16, 1);
        RETURN;
    END

    IF EXISTS (
        SELECT 1
        FROM FavoriteUniverse
        WHERE user_id = @user_id
          AND universe_id = @universe_id
    )
    BEGIN
        RAISERROR('Universe is already in favorites.', 16, 1);
        RETURN;
    END

    INSERT INTO FavoriteUniverse (
        user_id,
        universe_id
    )
    VALUES (
        @user_id,
        @universe_id
    );
END;
GO