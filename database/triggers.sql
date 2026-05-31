USE WorldBuilderPlatformDB
GO

CREATE OR ALTER TRIGGER trg_PreventOwnerReview
ON Review
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN Universe u
            ON i.universe_id = u.universe_id
        WHERE i.user_id = u.owner_id
    )
    BEGIN
        RAISERROR('Owner cannot review their own universe.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO

CREATE OR ALTER TRIGGER trg_ValidateStorySegmentWorldImageUniverse
ON StorySegmentWorldImage
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN StorySegment ss
            ON i.segment_id = ss.segment_id
        JOIN WorldImage wi
            ON i.image_id = wi.image_id
        JOIN Album a
            ON wi.album_id = a.album_id
        WHERE ss.universe_id <> a.universe_id
    )
    BEGIN
        RAISERROR('Story segment and image must belong to the same universe.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO