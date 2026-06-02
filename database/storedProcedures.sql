USE WorldBuilderPlatformDB
GO

CREATE OR ALTER PROCEDURE sp_CreateCharacterWithSpecies
    @universe_id INT,
    @name NVARCHAR(150),
    @gender NVARCHAR(30) = NULL,
    @species_name NVARCHAR(100) = NULL,
    @species_description NVARCHAR(MAX) = NULL,
    @description NVARCHAR(MAX) = NULL,
    @main_img_url NVARCHAR(500) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @species_id INT = NULL;

    IF @species_name IS NOT NULL AND LTRIM(RTRIM(@species_name)) <> ''
    BEGIN
        SELECT @species_id = species_id
        FROM Species
        WHERE universe_id = @universe_id
          AND name = @species_name;

        IF @species_id IS NULL
        BEGIN
            INSERT INTO Species (
                name,
                universe_id,
                description
            )
            VALUES (
                @species_name,
                @universe_id,
                @species_description
            );

            SET @species_id = SCOPE_IDENTITY();
        END
    END

    INSERT INTO Characters (
        name,
        gender,
        description,
        main_img_url,
        created_at,
        universe_id,
        species_id
    )
    VALUES (
        @name,
        @gender,
        @description,
        @main_img_url,
        SYSDATETIME(),
        @universe_id,
        @species_id
    );
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