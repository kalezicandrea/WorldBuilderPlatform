USE WorldBuilderPlatformDB
GO

CREATE OR ALTER FUNCTION fn_GetAverageUniverseRating
(
    @universe_id INT
)
RETURNS DECIMAL(3,2)
AS
BEGIN
    DECLARE @average_rating DECIMAL(3,2);

    SELECT @average_rating = AVG(CAST(rating AS DECIMAL(3,2)))
    FROM Review
    WHERE universe_id = @universe_id;

    RETURN ISNULL(@average_rating, 0);
END;
GO

CREATE OR ALTER FUNCTION fn_GetUniverseFavoriteCount
(
    @universe_id INT
)
RETURNS INT
AS
BEGIN
    DECLARE @favorite_count INT;

    SELECT @favorite_count = COUNT(*)
    FROM FavoriteUniverse
    WHERE universe_id = @universe_id;

    RETURN @favorite_count;
END;
GO