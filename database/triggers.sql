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

CREATE OR ALTER TRIGGER trg_ValidateCharacterRelationship
ON CharacterRelationship
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE i.character_id_1 = i.character_id_2
    )
    BEGIN
        RAISERROR('A character cannot have a relationship with itself.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    IF EXISTS (
        SELECT 1
        FROM inserted i
        INNER JOIN Characters c1
            ON i.character_id_1 = c1.character_id
        INNER JOIN Characters c2
            ON i.character_id_2 = c2.character_id
        WHERE c1.universe_id <> c2.universe_id
    )
    BEGIN
        RAISERROR('Characters in a relationship must belong to the same universe.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;
END;
GO