USE WorldBuilderPlatformDB;
GO
SET XACT_ABORT ON;
BEGIN TRANSACTION;
GO
-- Generated seed data. Existing admin user with username 'admin' is not changed.

DECLARE @UserRoleId INT = (SELECT role_id FROM Role WHERE name = 'User');
IF @UserRoleId IS NULL
BEGIN
    INSERT INTO Role (name) VALUES ('User');
END
GO

-- USERS
IF NOT EXISTS (SELECT 1 FROM Users WHERE username = N'luna_writer')
BEGIN
    INSERT INTO Users (username, email, password_hash, role_id)
    VALUES (N'luna_writer', N'luna.writer@example.com', N'$2a$11$6KJ6912jUV/vHaSM3MZPMuUWnLZd./q2DXDCZVI8E.dmgwp6mwUz2', (SELECT role_id FROM Role WHERE name = 'User'));
END
GO
IF NOT EXISTS (SELECT 1 FROM Users WHERE username = N'orion_creator')
BEGIN
    INSERT INTO Users (username, email, password_hash, role_id)
    VALUES (N'orion_creator', N'orion.creator@example.com', N'$2a$11$6KJ6912jUV/vHaSM3MZPMuUWnLZd./q2DXDCZVI8E.dmgwp6mwUz2', (SELECT role_id FROM Role WHERE name = 'User'));
END
GO
IF NOT EXISTS (SELECT 1 FROM Users WHERE username = N'mira_artist')
BEGIN
    INSERT INTO Users (username, email, password_hash, role_id)
    VALUES (N'mira_artist', N'mira.artist@example.com', N'$2a$11$6KJ6912jUV/vHaSM3MZPMuUWnLZd./q2DXDCZVI8E.dmgwp6mwUz2', (SELECT role_id FROM Role WHERE name = 'User'));
END
GO
IF NOT EXISTS (SELECT 1 FROM Users WHERE username = N'atlas_maker')
BEGIN
    INSERT INTO Users (username, email, password_hash, role_id)
    VALUES (N'atlas_maker', N'atlas.maker@example.com', N'$2a$11$6KJ6912jUV/vHaSM3MZPMuUWnLZd./q2DXDCZVI8E.dmgwp6mwUz2', (SELECT role_id FROM Role WHERE name = 'User'));
END
GO
IF NOT EXISTS (SELECT 1 FROM Users WHERE username = N'nova_dreamer')
BEGIN
    INSERT INTO Users (username, email, password_hash, role_id)
    VALUES (N'nova_dreamer', N'nova.dreamer@example.com', N'$2a$11$6KJ6912jUV/vHaSM3MZPMuUWnLZd./q2DXDCZVI8E.dmgwp6mwUz2', (SELECT role_id FROM Role WHERE name = 'User'));
END
GO
IF NOT EXISTS (SELECT 1 FROM Users WHERE username = N'kael_archivist')
BEGIN
    INSERT INTO Users (username, email, password_hash, role_id)
    VALUES (N'kael_archivist', N'kael.archivist@example.com', N'$2a$11$6KJ6912jUV/vHaSM3MZPMuUWnLZd./q2DXDCZVI8E.dmgwp6mwUz2', (SELECT role_id FROM Role WHERE name = 'User'));
END
GO
IF NOT EXISTS (SELECT 1 FROM Users WHERE username = N'ivy_myth')
BEGIN
    INSERT INTO Users (username, email, password_hash, role_id)
    VALUES (N'ivy_myth', N'ivy.myth@example.com', N'$2a$11$6KJ6912jUV/vHaSM3MZPMuUWnLZd./q2DXDCZVI8E.dmgwp6mwUz2', (SELECT role_id FROM Role WHERE name = 'User'));
END
GO
IF NOT EXISTS (SELECT 1 FROM Users WHERE username = N'rune_scribe')
BEGIN
    INSERT INTO Users (username, email, password_hash, role_id)
    VALUES (N'rune_scribe', N'rune.scribe@example.com', N'$2a$11$6KJ6912jUV/vHaSM3MZPMuUWnLZd./q2DXDCZVI8E.dmgwp6mwUz2', (SELECT role_id FROM Role WHERE name = 'User'));
END
GO
-- TAGS
IF NOT EXISTS (SELECT 1 FROM Tag WHERE name = N'Fantasy') INSERT INTO Tag (name) VALUES (N'Fantasy');
GO
IF NOT EXISTS (SELECT 1 FROM Tag WHERE name = N'Sci-Fi') INSERT INTO Tag (name) VALUES (N'Sci-Fi');
GO
IF NOT EXISTS (SELECT 1 FROM Tag WHERE name = N'Gothic') INSERT INTO Tag (name) VALUES (N'Gothic');
GO
IF NOT EXISTS (SELECT 1 FROM Tag WHERE name = N'Magic') INSERT INTO Tag (name) VALUES (N'Magic');
GO
IF NOT EXISTS (SELECT 1 FROM Tag WHERE name = N'Adventure') INSERT INTO Tag (name) VALUES (N'Adventure');
GO
IF NOT EXISTS (SELECT 1 FROM Tag WHERE name = N'Mystery') INSERT INTO Tag (name) VALUES (N'Mystery');
GO
IF NOT EXISTS (SELECT 1 FROM Tag WHERE name = N'Royalty') INSERT INTO Tag (name) VALUES (N'Royalty');
GO
IF NOT EXISTS (SELECT 1 FROM Tag WHERE name = N'Cyberpunk') INSERT INTO Tag (name) VALUES (N'Cyberpunk');
GO
IF NOT EXISTS (SELECT 1 FROM Tag WHERE name = N'Mythology') INSERT INTO Tag (name) VALUES (N'Mythology');
GO
IF NOT EXISTS (SELECT 1 FROM Tag WHERE name = N'Post-Apocalyptic') INSERT INTO Tag (name) VALUES (N'Post-Apocalyptic');
GO
IF NOT EXISTS (SELECT 1 FROM Tag WHERE name = N'Steampunk') INSERT INTO Tag (name) VALUES (N'Steampunk');
GO
IF NOT EXISTS (SELECT 1 FROM Tag WHERE name = N'Dark Academia') INSERT INTO Tag (name) VALUES (N'Dark Academia');
GO
IF NOT EXISTS (SELECT 1 FROM Tag WHERE name = N'Dragons') INSERT INTO Tag (name) VALUES (N'Dragons');
GO
IF NOT EXISTS (SELECT 1 FROM Tag WHERE name = N'Space Opera') INSERT INTO Tag (name) VALUES (N'Space Opera');
GO
IF NOT EXISTS (SELECT 1 FROM Tag WHERE name = N'Urban Fantasy') INSERT INTO Tag (name) VALUES (N'Urban Fantasy');
GO

-- Universe: Aetheria
IF NOT EXISTS (SELECT 1 FROM Universe WHERE name = N'Aetheria')
BEGIN
    INSERT INTO Universe (name, description, visibility, cover_img_url, owner_id)
    VALUES (N'Aetheria', N'A floating kingdom of sky islands, ancient dragons and wind temples.', N'public', NULL, (SELECT user_id FROM Users WHERE username = N'luna_writer'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Fantasy')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Aetheria'),
            (SELECT tag_id FROM Tag WHERE name = N'Fantasy'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Magic')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Aetheria'),
            (SELECT tag_id FROM Tag WHERE name = N'Magic'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Dragons')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Aetheria'),
            (SELECT tag_id FROM Tag WHERE name = N'Dragons'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Adventure')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Aetheria'),
            (SELECT tag_id FROM Tag WHERE name = N'Adventure'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Human', (SELECT universe_id FROM Universe WHERE name = N'Aetheria'), N'Ordinary humans adapted to the customs of this world.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Mystic' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Mystic', (SELECT universe_id FROM Universe WHERE name = N'Aetheria'), N'People touched by old magic.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Outlander' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Outlander', (SELECT universe_id FROM Universe WHERE name = N'Aetheria'), N'Travelers or descendants from distant regions.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Aetheria Tower' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Aetheria Tower', N'A notable place in Aetheria, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Aetheria'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Aetheria Ruins' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Aetheria Ruins', N'A notable place in Aetheria, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Aetheria'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Aetheria Academy' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Aetheria Academy', N'A notable place in Aetheria, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Aetheria'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Sera of Aetheria' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Sera of Aetheria', N'Female', N'A brave figure who searches for hidden truths.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Aetheria'),
            (SELECT species_id FROM Species WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Cassian of Aetheria' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Cassian of Aetheria', N'Male', N'A conflicted character with a dangerous secret.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Aetheria'),
            (SELECT species_id FROM Species WHERE name = N'Mystic' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Selene of Aetheria' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Selene of Aetheria', N'Other', N'A clever outsider who changes the course of the story.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Aetheria'),
            (SELECT species_id FROM Species WHERE name = N'Outlander' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Kael of Aetheria' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Kael of Aetheria', N'Female', N'A loyal companion whose choices affect the whole universe.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Aetheria'),
            (SELECT species_id FROM Species WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria') AND order_index = 1
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'The Hidden Place', N'In Aetheria, the characters discover a new problem and choose their next move.', 1, (SELECT universe_id FROM Universe WHERE name = N'Aetheria'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria') AND order_index = 2
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'A Broken Promise', N'In Aetheria, the characters discover a new problem and choose their next move.', 2, (SELECT universe_id FROM Universe WHERE name = N'Aetheria'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria') AND order_index = 3
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'Storm at the Gate', N'In Aetheria, the characters discover a new problem and choose their next move.', 3, (SELECT universe_id FROM Universe WHERE name = N'Aetheria'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Sera of Aetheria' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Sera of Aetheria' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Cassian of Aetheria' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Cassian of Aetheria' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Cassian of Aetheria' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Cassian of Aetheria' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Selene of Aetheria' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Selene of Aetheria' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Selene of Aetheria' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Selene of Aetheria' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Kael of Aetheria' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Kael of Aetheria' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria') AND order_index = 1)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Aetheria Tower' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria') AND order_index = 1),
            (SELECT location_id FROM Location WHERE name = N'Aetheria Tower' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria') AND order_index = 2)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Aetheria Ruins' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria') AND order_index = 2),
            (SELECT location_id FROM Location WHERE name = N'Aetheria Ruins' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria') AND order_index = 3)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Aetheria Academy' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria') AND order_index = 3),
            (SELECT location_id FROM Location WHERE name = N'Aetheria Academy' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Sera of Aetheria' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Cassian of Aetheria' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Sera of Aetheria' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria')),
            (SELECT character_id FROM Characters WHERE name = N'Cassian of Aetheria' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria')),
            N'rivals');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Cassian of Aetheria' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Selene of Aetheria' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Cassian of Aetheria' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria')),
            (SELECT character_id FROM Characters WHERE name = N'Selene of Aetheria' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria')),
            N'mentor');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Selene of Aetheria' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Kael of Aetheria' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Selene of Aetheria' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria')),
            (SELECT character_id FROM Characters WHERE name = N'Kael of Aetheria' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria')),
            N'childhood friends');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Album
    WHERE name = N'Aetheria Gallery' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria')
)
BEGIN
    INSERT INTO Album (name, description, universe_id)
    VALUES (N'Aetheria Gallery', N'Album prepared for future images.',
            (SELECT universe_id FROM Universe WHERE name = N'Aetheria'));
END
GO

-- Universe: Velvet Academy
IF NOT EXISTS (SELECT 1 FROM Universe WHERE name = N'Velvet Academy')
BEGIN
    INSERT INTO Universe (name, description, visibility, cover_img_url, owner_id)
    VALUES (N'Velvet Academy', N'A secret academy where students learn forbidden dream magic.', N'public', NULL, (SELECT user_id FROM Users WHERE username = N'luna_writer'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Dark Academia')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Velvet Academy'),
            (SELECT tag_id FROM Tag WHERE name = N'Dark Academia'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Magic')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Velvet Academy'),
            (SELECT tag_id FROM Tag WHERE name = N'Magic'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Mystery')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Velvet Academy'),
            (SELECT tag_id FROM Tag WHERE name = N'Mystery'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Nocturne' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Nocturne', (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy'), N'A bloodline tied to moonlight and old curses.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Human', (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy'), N'Citizens of old cities and noble houses.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Wraithborn' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Wraithborn', (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy'), N'People marked by ghostly inheritance.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Velvet Academy' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Velvet Academy', N'A notable place in Velvet Academy, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Velvet Wastes' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Velvet Wastes', N'A notable place in Velvet Academy, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Velvet Capital' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Velvet Capital', N'A notable place in Velvet Academy, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Selene of Velvet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Selene of Velvet', N'Female', N'A brave figure who searches for hidden truths.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy'),
            (SELECT species_id FROM Species WHERE name = N'Nocturne' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Kael of Velvet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Kael of Velvet', N'Male', N'A conflicted character with a dangerous secret.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy'),
            (SELECT species_id FROM Species WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Nira of Velvet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Nira of Velvet', N'Other', N'A clever outsider who changes the course of the story.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy'),
            (SELECT species_id FROM Species WHERE name = N'Wraithborn' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Riven of Velvet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Riven of Velvet', N'Female', N'A loyal companion whose choices affect the whole universe.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy'),
            (SELECT species_id FROM Species WHERE name = N'Nocturne' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy') AND order_index = 1
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'The Hidden Place', N'In Velvet Academy, the characters discover a new problem and choose their next move.', 1, (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy') AND order_index = 2
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'A Broken Promise', N'In Velvet Academy, the characters discover a new problem and choose their next move.', 2, (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy') AND order_index = 3
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'Storm at the Gate', N'In Velvet Academy, the characters discover a new problem and choose their next move.', 3, (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Selene of Velvet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Selene of Velvet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Kael of Velvet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Kael of Velvet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Kael of Velvet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Kael of Velvet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Nira of Velvet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Nira of Velvet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Nira of Velvet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Nira of Velvet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Riven of Velvet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Riven of Velvet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy') AND order_index = 1)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Velvet Academy' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy') AND order_index = 1),
            (SELECT location_id FROM Location WHERE name = N'Velvet Academy' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy') AND order_index = 2)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Velvet Wastes' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy') AND order_index = 2),
            (SELECT location_id FROM Location WHERE name = N'Velvet Wastes' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy') AND order_index = 3)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Velvet Capital' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy') AND order_index = 3),
            (SELECT location_id FROM Location WHERE name = N'Velvet Capital' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Selene of Velvet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Kael of Velvet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Selene of Velvet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy')),
            (SELECT character_id FROM Characters WHERE name = N'Kael of Velvet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy')),
            N'allies');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Kael of Velvet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Nira of Velvet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Kael of Velvet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy')),
            (SELECT character_id FROM Characters WHERE name = N'Nira of Velvet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy')),
            N'siblings');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Nira of Velvet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Riven of Velvet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Nira of Velvet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy')),
            (SELECT character_id FROM Characters WHERE name = N'Riven of Velvet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy')),
            N'enemies');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Album
    WHERE name = N'Velvet Academy Gallery' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy')
)
BEGIN
    INSERT INTO Album (name, description, universe_id)
    VALUES (N'Velvet Academy Gallery', N'Album prepared for future images.',
            (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy'));
END
GO

-- Universe: The Glass Orchard
IF NOT EXISTS (SELECT 1 FROM Universe WHERE name = N'The Glass Orchard')
BEGIN
    INSERT INTO Universe (name, description, visibility, cover_img_url, owner_id)
    VALUES (N'The Glass Orchard', N'A private world of crystal forests and silent spirits.', N'private', NULL, (SELECT user_id FROM Users WHERE username = N'luna_writer'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Fantasy')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard'),
            (SELECT tag_id FROM Tag WHERE name = N'Fantasy'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Mystery')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard'),
            (SELECT tag_id FROM Tag WHERE name = N'Mystery'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Human', (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard'), N'Ordinary humans adapted to the customs of this world.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Mystic' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Mystic', (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard'), N'People touched by old magic.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Outlander' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Outlander', (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard'), N'Travelers or descendants from distant regions.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'The Wastes' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'The Wastes', N'A notable place in The Glass Orchard, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'The Capital' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'The Capital', N'A notable place in The Glass Orchard, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'The Harbor' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'The Harbor', N'A notable place in The Glass Orchard, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Kael of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Kael of The', N'Female', N'A brave figure who searches for hidden truths.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard'),
            (SELECT species_id FROM Species WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Nira of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Nira of The', N'Male', N'A conflicted character with a dangerous secret.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard'),
            (SELECT species_id FROM Species WHERE name = N'Mystic' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Riven of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Riven of The', N'Other', N'A clever outsider who changes the course of the story.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard'),
            (SELECT species_id FROM Species WHERE name = N'Outlander' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Lyra of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Lyra of The', N'Female', N'A loyal companion whose choices affect the whole universe.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard'),
            (SELECT species_id FROM Species WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard') AND order_index = 1
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'The Secret Map', N'In The Glass Orchard, the characters discover a new problem and choose their next move.', 1, (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard') AND order_index = 2
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'Opening Signs', N'In The Glass Orchard, the characters discover a new problem and choose their next move.', 2, (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard') AND order_index = 3
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'A Dangerous Meeting', N'In The Glass Orchard, the characters discover a new problem and choose their next move.', 3, (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Kael of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Kael of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Nira of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Nira of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Nira of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Nira of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Riven of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Riven of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Riven of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Riven of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Lyra of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Lyra of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard') AND order_index = 1)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'The Wastes' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard') AND order_index = 1),
            (SELECT location_id FROM Location WHERE name = N'The Wastes' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard') AND order_index = 2)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'The Capital' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard') AND order_index = 2),
            (SELECT location_id FROM Location WHERE name = N'The Capital' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard') AND order_index = 3)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'The Harbor' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard') AND order_index = 3),
            (SELECT location_id FROM Location WHERE name = N'The Harbor' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Kael of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Nira of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Kael of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard')),
            (SELECT character_id FROM Characters WHERE name = N'Nira of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard')),
            N'mentor');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Nira of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Riven of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Nira of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard')),
            (SELECT character_id FROM Characters WHERE name = N'Riven of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard')),
            N'childhood friends');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Riven of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Lyra of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Riven of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard')),
            (SELECT character_id FROM Characters WHERE name = N'Lyra of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard')),
            N'allies');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Album
    WHERE name = N'The Glass Orchard Gallery' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard')
)
BEGIN
    INSERT INTO Album (name, description, universe_id)
    VALUES (N'The Glass Orchard Gallery', N'Album prepared for future images.',
            (SELECT universe_id FROM Universe WHERE name = N'The Glass Orchard'));
END
GO

-- Universe: Neon District 47
IF NOT EXISTS (SELECT 1 FROM Universe WHERE name = N'Neon District 47')
BEGIN
    INSERT INTO Universe (name, description, visibility, cover_img_url, owner_id)
    VALUES (N'Neon District 47', N'A cyberpunk megacity ruled by corporations, hackers and neon cults.', N'public', NULL, (SELECT user_id FROM Users WHERE username = N'orion_creator'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Cyberpunk')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Neon District 47'),
            (SELECT tag_id FROM Tag WHERE name = N'Cyberpunk'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Sci-Fi')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Neon District 47'),
            (SELECT tag_id FROM Tag WHERE name = N'Sci-Fi'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Mystery')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Neon District 47'),
            (SELECT tag_id FROM Tag WHERE name = N'Mystery'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Human', (SELECT universe_id FROM Universe WHERE name = N'Neon District 47'), N'Humans living under advanced technology.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Augmented Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Augmented Human', (SELECT universe_id FROM Universe WHERE name = N'Neon District 47'), N'People enhanced with cybernetic or biological upgrades.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Synthetic' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Synthetic', (SELECT universe_id FROM Universe WHERE name = N'Neon District 47'), N'Artificial beings with independent thoughts.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Neon Citadel' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Neon Citadel', N'A notable place in Neon District 47, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Neon District 47'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Neon District' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Neon District', N'A notable place in Neon District 47, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Neon District 47'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Neon Market' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Neon Market', N'A notable place in Neon District 47, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Neon District 47'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Aria of Neon' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Aria of Neon', N'Female', N'A brave figure who searches for hidden truths.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Neon District 47'),
            (SELECT species_id FROM Species WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Orin of Neon' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Orin of Neon', N'Male', N'A conflicted character with a dangerous secret.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Neon District 47'),
            (SELECT species_id FROM Species WHERE name = N'Augmented Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Vera of Neon' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Vera of Neon', N'Other', N'A clever outsider who changes the course of the story.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Neon District 47'),
            (SELECT species_id FROM Species WHERE name = N'Synthetic' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Dorian of Neon' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Dorian of Neon', N'Female', N'A loyal companion whose choices affect the whole universe.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Neon District 47'),
            (SELECT species_id FROM Species WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47') AND order_index = 1
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'Storm at the Gate', N'In Neon District 47, the characters discover a new problem and choose their next move.', 1, (SELECT universe_id FROM Universe WHERE name = N'Neon District 47'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47') AND order_index = 2
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'The Secret Map', N'In Neon District 47, the characters discover a new problem and choose their next move.', 2, (SELECT universe_id FROM Universe WHERE name = N'Neon District 47'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47') AND order_index = 3
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'Opening Signs', N'In Neon District 47, the characters discover a new problem and choose their next move.', 3, (SELECT universe_id FROM Universe WHERE name = N'Neon District 47'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Aria of Neon' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Aria of Neon' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Orin of Neon' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Orin of Neon' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Orin of Neon' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Orin of Neon' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Vera of Neon' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Vera of Neon' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Vera of Neon' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Vera of Neon' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Dorian of Neon' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Dorian of Neon' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47') AND order_index = 1)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Neon Citadel' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47') AND order_index = 1),
            (SELECT location_id FROM Location WHERE name = N'Neon Citadel' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47') AND order_index = 2)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Neon District' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47') AND order_index = 2),
            (SELECT location_id FROM Location WHERE name = N'Neon District' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47') AND order_index = 3)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Neon Market' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47') AND order_index = 3),
            (SELECT location_id FROM Location WHERE name = N'Neon Market' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Aria of Neon' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Orin of Neon' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Aria of Neon' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47')),
            (SELECT character_id FROM Characters WHERE name = N'Orin of Neon' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47')),
            N'siblings');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Orin of Neon' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Vera of Neon' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Orin of Neon' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47')),
            (SELECT character_id FROM Characters WHERE name = N'Vera of Neon' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47')),
            N'enemies');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Vera of Neon' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Dorian of Neon' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Vera of Neon' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47')),
            (SELECT character_id FROM Characters WHERE name = N'Dorian of Neon' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47')),
            N'sworn protectors');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Album
    WHERE name = N'Neon District 47 Gallery' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47')
)
BEGIN
    INSERT INTO Album (name, description, universe_id)
    VALUES (N'Neon District 47 Gallery', N'Album prepared for future images.',
            (SELECT universe_id FROM Universe WHERE name = N'Neon District 47'));
END
GO

-- Universe: The Last Terraformers
IF NOT EXISTS (SELECT 1 FROM Universe WHERE name = N'The Last Terraformers')
BEGIN
    INSERT INTO Universe (name, description, visibility, cover_img_url, owner_id)
    VALUES (N'The Last Terraformers', N'A science fiction universe about rebuilding dying planets.', N'public', NULL, (SELECT user_id FROM Users WHERE username = N'orion_creator'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Sci-Fi')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers'),
            (SELECT tag_id FROM Tag WHERE name = N'Sci-Fi'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Space Opera')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers'),
            (SELECT tag_id FROM Tag WHERE name = N'Space Opera'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Adventure')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers'),
            (SELECT tag_id FROM Tag WHERE name = N'Adventure'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Human', (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers'), N'Humans living under advanced technology.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Augmented Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Augmented Human', (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers'), N'People enhanced with cybernetic or biological upgrades.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Synthetic' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Synthetic', (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers'), N'Artificial beings with independent thoughts.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'The Ruins' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'The Ruins', N'A notable place in The Last Terraformers, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'The Academy' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'The Academy', N'A notable place in The Last Terraformers, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'The Wastes' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'The Wastes', N'A notable place in The Last Terraformers, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Elias of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Elias of The', N'Female', N'A brave figure who searches for hidden truths.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers'),
            (SELECT species_id FROM Species WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Sera of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Sera of The', N'Male', N'A conflicted character with a dangerous secret.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers'),
            (SELECT species_id FROM Species WHERE name = N'Augmented Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Cassian of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Cassian of The', N'Other', N'A clever outsider who changes the course of the story.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers'),
            (SELECT species_id FROM Species WHERE name = N'Synthetic' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Selene of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Selene of The', N'Female', N'A loyal companion whose choices affect the whole universe.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers'),
            (SELECT species_id FROM Species WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers') AND order_index = 1
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'A Broken Promise', N'In The Last Terraformers, the characters discover a new problem and choose their next move.', 1, (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers') AND order_index = 2
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'Storm at the Gate', N'In The Last Terraformers, the characters discover a new problem and choose their next move.', 2, (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers') AND order_index = 3
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'The Secret Map', N'In The Last Terraformers, the characters discover a new problem and choose their next move.', 3, (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Elias of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Elias of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Sera of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Sera of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Sera of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Sera of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Cassian of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Cassian of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Cassian of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Cassian of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Selene of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Selene of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers') AND order_index = 1)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'The Ruins' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers') AND order_index = 1),
            (SELECT location_id FROM Location WHERE name = N'The Ruins' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers') AND order_index = 2)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'The Academy' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers') AND order_index = 2),
            (SELECT location_id FROM Location WHERE name = N'The Academy' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers') AND order_index = 3)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'The Wastes' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers') AND order_index = 3),
            (SELECT location_id FROM Location WHERE name = N'The Wastes' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Elias of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Sera of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Elias of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers')),
            (SELECT character_id FROM Characters WHERE name = N'Sera of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers')),
            N'allies');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Sera of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Cassian of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Sera of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers')),
            (SELECT character_id FROM Characters WHERE name = N'Cassian of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers')),
            N'siblings');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Cassian of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Selene of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Cassian of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers')),
            (SELECT character_id FROM Characters WHERE name = N'Selene of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers')),
            N'enemies');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Album
    WHERE name = N'The Last Terraformers Gallery' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers')
)
BEGIN
    INSERT INTO Album (name, description, universe_id)
    VALUES (N'The Last Terraformers Gallery', N'Album prepared for future images.',
            (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers'));
END
GO

-- Universe: Iron Meridian
IF NOT EXISTS (SELECT 1 FROM Universe WHERE name = N'Iron Meridian')
BEGIN
    INSERT INTO Universe (name, description, visibility, cover_img_url, owner_id)
    VALUES (N'Iron Meridian', N'A steampunk frontier crossed by giant rail-cities.', N'public', NULL, (SELECT user_id FROM Users WHERE username = N'orion_creator'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Steampunk')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Iron Meridian'),
            (SELECT tag_id FROM Tag WHERE name = N'Steampunk'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Adventure')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Iron Meridian'),
            (SELECT tag_id FROM Tag WHERE name = N'Adventure'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Human', (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian'), N'Inventors, workers and nobles of the industrial age.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Clockwork Being' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Clockwork Being', (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian'), N'Mechanical beings with strange souls.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Skyfarer' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Skyfarer', (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian'), N'Airship crews and explorers.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Iron Harbor' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Iron Harbor', N'A notable place in Iron Meridian, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Iron Citadel' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Iron Citadel', N'A notable place in Iron Meridian, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Iron District' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Iron District', N'A notable place in Iron Meridian, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Noah of Iron' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Noah of Iron', N'Female', N'A brave figure who searches for hidden truths.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian'),
            (SELECT species_id FROM Species WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Aria of Iron' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Aria of Iron', N'Male', N'A conflicted character with a dangerous secret.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian'),
            (SELECT species_id FROM Species WHERE name = N'Clockwork Being' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Orin of Iron' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Orin of Iron', N'Other', N'A clever outsider who changes the course of the story.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian'),
            (SELECT species_id FROM Species WHERE name = N'Skyfarer' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Vera of Iron' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Vera of Iron', N'Female', N'A loyal companion whose choices affect the whole universe.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian'),
            (SELECT species_id FROM Species WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian') AND order_index = 1
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'A Dangerous Meeting', N'In Iron Meridian, the characters discover a new problem and choose their next move.', 1, (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian') AND order_index = 2
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'The Hidden Place', N'In Iron Meridian, the characters discover a new problem and choose their next move.', 2, (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian') AND order_index = 3
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'A Broken Promise', N'In Iron Meridian, the characters discover a new problem and choose their next move.', 3, (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Noah of Iron' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Noah of Iron' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Aria of Iron' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Aria of Iron' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Aria of Iron' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Aria of Iron' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Orin of Iron' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Orin of Iron' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Orin of Iron' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Orin of Iron' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Vera of Iron' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Vera of Iron' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian') AND order_index = 1)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Iron Harbor' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian') AND order_index = 1),
            (SELECT location_id FROM Location WHERE name = N'Iron Harbor' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian') AND order_index = 2)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Iron Citadel' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian') AND order_index = 2),
            (SELECT location_id FROM Location WHERE name = N'Iron Citadel' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian') AND order_index = 3)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Iron District' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian') AND order_index = 3),
            (SELECT location_id FROM Location WHERE name = N'Iron District' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Noah of Iron' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Aria of Iron' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Noah of Iron' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian')),
            (SELECT character_id FROM Characters WHERE name = N'Aria of Iron' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian')),
            N'sworn protectors');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Aria of Iron' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Orin of Iron' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Aria of Iron' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian')),
            (SELECT character_id FROM Characters WHERE name = N'Orin of Iron' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian')),
            N'rivals');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Orin of Iron' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Vera of Iron' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Orin of Iron' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian')),
            (SELECT character_id FROM Characters WHERE name = N'Vera of Iron' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian')),
            N'mentor');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Album
    WHERE name = N'Iron Meridian Gallery' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian')
)
BEGIN
    INSERT INTO Album (name, description, universe_id)
    VALUES (N'Iron Meridian Gallery', N'Album prepared for future images.',
            (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian'));
END
GO

-- Universe: Moonlit Empire
IF NOT EXISTS (SELECT 1 FROM Universe WHERE name = N'Moonlit Empire')
BEGIN
    INSERT INTO Universe (name, description, visibility, cover_img_url, owner_id)
    VALUES (N'Moonlit Empire', N'A gothic empire of noble houses, curses and moonlit rituals.', N'public', NULL, (SELECT user_id FROM Users WHERE username = N'mira_artist'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Gothic')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire'),
            (SELECT tag_id FROM Tag WHERE name = N'Gothic'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Royalty')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire'),
            (SELECT tag_id FROM Tag WHERE name = N'Royalty'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Magic')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire'),
            (SELECT tag_id FROM Tag WHERE name = N'Magic'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Nocturne' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Nocturne', (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire'), N'A bloodline tied to moonlight and old curses.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Human', (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire'), N'Citizens of old cities and noble houses.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Wraithborn' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Wraithborn', (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire'), N'People marked by ghostly inheritance.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Moonlit Academy' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Moonlit Academy', N'A notable place in Moonlit Empire, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Moonlit Wastes' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Moonlit Wastes', N'A notable place in Moonlit Empire, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Moonlit Capital' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Moonlit Capital', N'A notable place in Moonlit Empire, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Selene of Moonlit' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Selene of Moonlit', N'Female', N'A brave figure who searches for hidden truths.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire'),
            (SELECT species_id FROM Species WHERE name = N'Nocturne' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Kael of Moonlit' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Kael of Moonlit', N'Male', N'A conflicted character with a dangerous secret.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire'),
            (SELECT species_id FROM Species WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Nira of Moonlit' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Nira of Moonlit', N'Other', N'A clever outsider who changes the course of the story.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire'),
            (SELECT species_id FROM Species WHERE name = N'Wraithborn' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Riven of Moonlit' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Riven of Moonlit', N'Female', N'A loyal companion whose choices affect the whole universe.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire'),
            (SELECT species_id FROM Species WHERE name = N'Nocturne' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire') AND order_index = 1
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'The Hidden Place', N'In Moonlit Empire, the characters discover a new problem and choose their next move.', 1, (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire') AND order_index = 2
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'A Broken Promise', N'In Moonlit Empire, the characters discover a new problem and choose their next move.', 2, (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire') AND order_index = 3
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'Storm at the Gate', N'In Moonlit Empire, the characters discover a new problem and choose their next move.', 3, (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Selene of Moonlit' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Selene of Moonlit' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Kael of Moonlit' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Kael of Moonlit' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Kael of Moonlit' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Kael of Moonlit' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Nira of Moonlit' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Nira of Moonlit' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Nira of Moonlit' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Nira of Moonlit' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Riven of Moonlit' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Riven of Moonlit' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire') AND order_index = 1)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Moonlit Academy' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire') AND order_index = 1),
            (SELECT location_id FROM Location WHERE name = N'Moonlit Academy' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire') AND order_index = 2)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Moonlit Wastes' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire') AND order_index = 2),
            (SELECT location_id FROM Location WHERE name = N'Moonlit Wastes' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire') AND order_index = 3)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Moonlit Capital' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire') AND order_index = 3),
            (SELECT location_id FROM Location WHERE name = N'Moonlit Capital' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Selene of Moonlit' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Kael of Moonlit' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Selene of Moonlit' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire')),
            (SELECT character_id FROM Characters WHERE name = N'Kael of Moonlit' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire')),
            N'allies');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Kael of Moonlit' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Nira of Moonlit' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Kael of Moonlit' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire')),
            (SELECT character_id FROM Characters WHERE name = N'Nira of Moonlit' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire')),
            N'siblings');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Nira of Moonlit' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Riven of Moonlit' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Nira of Moonlit' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire')),
            (SELECT character_id FROM Characters WHERE name = N'Riven of Moonlit' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire')),
            N'enemies');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Album
    WHERE name = N'Moonlit Empire Gallery' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire')
)
BEGIN
    INSERT INTO Album (name, description, universe_id)
    VALUES (N'Moonlit Empire Gallery', N'Album prepared for future images.',
            (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire'));
END
GO

-- Universe: Roseglass Court
IF NOT EXISTS (SELECT 1 FROM Universe WHERE name = N'Roseglass Court')
BEGIN
    INSERT INTO Universe (name, description, visibility, cover_img_url, owner_id)
    VALUES (N'Roseglass Court', N'A political fantasy world of masked balls and poisonous alliances.', N'public', NULL, (SELECT user_id FROM Users WHERE username = N'mira_artist'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Royalty')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Roseglass Court'),
            (SELECT tag_id FROM Tag WHERE name = N'Royalty'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Fantasy')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Roseglass Court'),
            (SELECT tag_id FROM Tag WHERE name = N'Fantasy'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Mystery')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Roseglass Court'),
            (SELECT tag_id FROM Tag WHERE name = N'Mystery'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Human', (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court'), N'Ordinary humans adapted to the customs of this world.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Mystic' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Mystic', (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court'), N'People touched by old magic.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Outlander' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Outlander', (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court'), N'Travelers or descendants from distant regions.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Roseglass Forest' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Roseglass Forest', N'A notable place in Roseglass Court, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Roseglass Tower' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Roseglass Tower', N'A notable place in Roseglass Court, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Roseglass Ruins' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Roseglass Ruins', N'A notable place in Roseglass Court, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Talon of Roseglass' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Talon of Roseglass', N'Female', N'A brave figure who searches for hidden truths.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court'),
            (SELECT species_id FROM Species WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Mira of Roseglass' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Mira of Roseglass', N'Male', N'A conflicted character with a dangerous secret.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court'),
            (SELECT species_id FROM Species WHERE name = N'Mystic' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Elias of Roseglass' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Elias of Roseglass', N'Other', N'A clever outsider who changes the course of the story.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court'),
            (SELECT species_id FROM Species WHERE name = N'Outlander' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Sera of Roseglass' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Sera of Roseglass', N'Female', N'A loyal companion whose choices affect the whole universe.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court'),
            (SELECT species_id FROM Species WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court') AND order_index = 1
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'A Broken Promise', N'In Roseglass Court, the characters discover a new problem and choose their next move.', 1, (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court') AND order_index = 2
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'Storm at the Gate', N'In Roseglass Court, the characters discover a new problem and choose their next move.', 2, (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court') AND order_index = 3
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'The Secret Map', N'In Roseglass Court, the characters discover a new problem and choose their next move.', 3, (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Talon of Roseglass' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Talon of Roseglass' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Mira of Roseglass' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Mira of Roseglass' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Mira of Roseglass' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Mira of Roseglass' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Elias of Roseglass' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Elias of Roseglass' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Elias of Roseglass' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Elias of Roseglass' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Sera of Roseglass' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Sera of Roseglass' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court') AND order_index = 1)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Roseglass Forest' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court') AND order_index = 1),
            (SELECT location_id FROM Location WHERE name = N'Roseglass Forest' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court') AND order_index = 2)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Roseglass Tower' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court') AND order_index = 2),
            (SELECT location_id FROM Location WHERE name = N'Roseglass Tower' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court') AND order_index = 3)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Roseglass Ruins' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court') AND order_index = 3),
            (SELECT location_id FROM Location WHERE name = N'Roseglass Ruins' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Talon of Roseglass' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Mira of Roseglass' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Talon of Roseglass' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court')),
            (SELECT character_id FROM Characters WHERE name = N'Mira of Roseglass' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court')),
            N'rivals');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Mira of Roseglass' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Elias of Roseglass' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Mira of Roseglass' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court')),
            (SELECT character_id FROM Characters WHERE name = N'Elias of Roseglass' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court')),
            N'mentor');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Elias of Roseglass' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Sera of Roseglass' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Elias of Roseglass' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court')),
            (SELECT character_id FROM Characters WHERE name = N'Sera of Roseglass' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court')),
            N'childhood friends');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Album
    WHERE name = N'Roseglass Court Gallery' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court')
)
BEGIN
    INSERT INTO Album (name, description, universe_id)
    VALUES (N'Roseglass Court Gallery', N'Album prepared for future images.',
            (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court'));
END
GO

-- Universe: Ashen Saints
IF NOT EXISTS (SELECT 1 FROM Universe WHERE name = N'Ashen Saints')
BEGIN
    INSERT INTO Universe (name, description, visibility, cover_img_url, owner_id)
    VALUES (N'Ashen Saints', N'A private dark fantasy world about fallen holy orders.', N'private', NULL, (SELECT user_id FROM Users WHERE username = N'mira_artist'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Gothic')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Ashen Saints'),
            (SELECT tag_id FROM Tag WHERE name = N'Gothic'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Dark Academia')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Ashen Saints'),
            (SELECT tag_id FROM Tag WHERE name = N'Dark Academia'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Nocturne' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Nocturne', (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints'), N'A bloodline tied to moonlight and old curses.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Human', (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints'), N'Citizens of old cities and noble houses.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Wraithborn' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Wraithborn', (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints'), N'People marked by ghostly inheritance.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Ashen Market' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Ashen Market', N'A notable place in Ashen Saints, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Ashen Forest' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Ashen Forest', N'A notable place in Ashen Saints, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Ashen Tower' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Ashen Tower', N'A notable place in Ashen Saints, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Iris of Ashen' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Iris of Ashen', N'Female', N'A brave figure who searches for hidden truths.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints'),
            (SELECT species_id FROM Species WHERE name = N'Nocturne' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Talon of Ashen' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Talon of Ashen', N'Male', N'A conflicted character with a dangerous secret.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints'),
            (SELECT species_id FROM Species WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Mira of Ashen' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Mira of Ashen', N'Other', N'A clever outsider who changes the course of the story.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints'),
            (SELECT species_id FROM Species WHERE name = N'Wraithborn' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Elias of Ashen' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Elias of Ashen', N'Female', N'A loyal companion whose choices affect the whole universe.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints'),
            (SELECT species_id FROM Species WHERE name = N'Nocturne' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints') AND order_index = 1
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'Opening Signs', N'In Ashen Saints, the characters discover a new problem and choose their next move.', 1, (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints') AND order_index = 2
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'A Dangerous Meeting', N'In Ashen Saints, the characters discover a new problem and choose their next move.', 2, (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints') AND order_index = 3
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'The Hidden Place', N'In Ashen Saints, the characters discover a new problem and choose their next move.', 3, (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Iris of Ashen' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Iris of Ashen' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Talon of Ashen' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Talon of Ashen' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Talon of Ashen' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Talon of Ashen' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Mira of Ashen' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Mira of Ashen' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Mira of Ashen' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Mira of Ashen' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Elias of Ashen' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Elias of Ashen' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints') AND order_index = 1)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Ashen Market' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints') AND order_index = 1),
            (SELECT location_id FROM Location WHERE name = N'Ashen Market' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints') AND order_index = 2)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Ashen Forest' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints') AND order_index = 2),
            (SELECT location_id FROM Location WHERE name = N'Ashen Forest' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints') AND order_index = 3)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Ashen Tower' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints') AND order_index = 3),
            (SELECT location_id FROM Location WHERE name = N'Ashen Tower' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Iris of Ashen' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Talon of Ashen' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Iris of Ashen' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints')),
            (SELECT character_id FROM Characters WHERE name = N'Talon of Ashen' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints')),
            N'childhood friends');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Talon of Ashen' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Mira of Ashen' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Talon of Ashen' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints')),
            (SELECT character_id FROM Characters WHERE name = N'Mira of Ashen' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints')),
            N'allies');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Mira of Ashen' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Elias of Ashen' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Mira of Ashen' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints')),
            (SELECT character_id FROM Characters WHERE name = N'Elias of Ashen' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints')),
            N'siblings');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Album
    WHERE name = N'Ashen Saints Gallery' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints')
)
BEGIN
    INSERT INTO Album (name, description, universe_id)
    VALUES (N'Ashen Saints Gallery', N'Album prepared for future images.',
            (SELECT universe_id FROM Universe WHERE name = N'Ashen Saints'));
END
GO

-- Universe: Thornwild
IF NOT EXISTS (SELECT 1 FROM Universe WHERE name = N'Thornwild')
BEGIN
    INSERT INTO Universe (name, description, visibility, cover_img_url, owner_id)
    VALUES (N'Thornwild', N'A wild continent where living forests remember every war.', N'public', NULL, (SELECT user_id FROM Users WHERE username = N'atlas_maker'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Fantasy')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Thornwild'),
            (SELECT tag_id FROM Tag WHERE name = N'Fantasy'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Mythology')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Thornwild'),
            (SELECT tag_id FROM Tag WHERE name = N'Mythology'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Adventure')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Thornwild'),
            (SELECT tag_id FROM Tag WHERE name = N'Adventure'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Human', (SELECT universe_id FROM Universe WHERE name = N'Thornwild'), N'Ordinary humans adapted to the customs of this world.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Mystic' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Mystic', (SELECT universe_id FROM Universe WHERE name = N'Thornwild'), N'People touched by old magic.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Outlander' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Outlander', (SELECT universe_id FROM Universe WHERE name = N'Thornwild'), N'Travelers or descendants from distant regions.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Thornwild District' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Thornwild District', N'A notable place in Thornwild, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Thornwild'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Thornwild Market' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Thornwild Market', N'A notable place in Thornwild, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Thornwild'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Thornwild Forest' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Thornwild Forest', N'A notable place in Thornwild, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Thornwild'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Dorian of Thornwild' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Dorian of Thornwild', N'Female', N'A brave figure who searches for hidden truths.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Thornwild'),
            (SELECT species_id FROM Species WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Iris of Thornwild' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Iris of Thornwild', N'Male', N'A conflicted character with a dangerous secret.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Thornwild'),
            (SELECT species_id FROM Species WHERE name = N'Mystic' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Talon of Thornwild' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Talon of Thornwild', N'Other', N'A clever outsider who changes the course of the story.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Thornwild'),
            (SELECT species_id FROM Species WHERE name = N'Outlander' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Mira of Thornwild' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Mira of Thornwild', N'Female', N'A loyal companion whose choices affect the whole universe.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Thornwild'),
            (SELECT species_id FROM Species WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild') AND order_index = 1
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'A Broken Promise', N'In Thornwild, the characters discover a new problem and choose their next move.', 1, (SELECT universe_id FROM Universe WHERE name = N'Thornwild'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild') AND order_index = 2
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'Storm at the Gate', N'In Thornwild, the characters discover a new problem and choose their next move.', 2, (SELECT universe_id FROM Universe WHERE name = N'Thornwild'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild') AND order_index = 3
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'The Secret Map', N'In Thornwild, the characters discover a new problem and choose their next move.', 3, (SELECT universe_id FROM Universe WHERE name = N'Thornwild'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Dorian of Thornwild' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Dorian of Thornwild' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Iris of Thornwild' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Iris of Thornwild' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Iris of Thornwild' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Iris of Thornwild' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Talon of Thornwild' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Talon of Thornwild' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Talon of Thornwild' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Talon of Thornwild' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Mira of Thornwild' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Mira of Thornwild' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild') AND order_index = 1)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Thornwild District' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild') AND order_index = 1),
            (SELECT location_id FROM Location WHERE name = N'Thornwild District' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild') AND order_index = 2)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Thornwild Market' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild') AND order_index = 2),
            (SELECT location_id FROM Location WHERE name = N'Thornwild Market' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild') AND order_index = 3)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Thornwild Forest' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild') AND order_index = 3),
            (SELECT location_id FROM Location WHERE name = N'Thornwild Forest' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Dorian of Thornwild' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Iris of Thornwild' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Dorian of Thornwild' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild')),
            (SELECT character_id FROM Characters WHERE name = N'Iris of Thornwild' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild')),
            N'siblings');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Iris of Thornwild' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Talon of Thornwild' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Iris of Thornwild' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild')),
            (SELECT character_id FROM Characters WHERE name = N'Talon of Thornwild' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild')),
            N'enemies');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Talon of Thornwild' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Mira of Thornwild' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Talon of Thornwild' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild')),
            (SELECT character_id FROM Characters WHERE name = N'Mira of Thornwild' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild')),
            N'sworn protectors');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Album
    WHERE name = N'Thornwild Gallery' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild')
)
BEGIN
    INSERT INTO Album (name, description, universe_id)
    VALUES (N'Thornwild Gallery', N'Album prepared for future images.',
            (SELECT universe_id FROM Universe WHERE name = N'Thornwild'));
END
GO

-- Universe: The Sunken Atlas
IF NOT EXISTS (SELECT 1 FROM Universe WHERE name = N'The Sunken Atlas')
BEGIN
    INSERT INTO Universe (name, description, visibility, cover_img_url, owner_id)
    VALUES (N'The Sunken Atlas', N'An ocean world of drowned cities and mapmakers.', N'public', NULL, (SELECT user_id FROM Users WHERE username = N'atlas_maker'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Adventure')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas'),
            (SELECT tag_id FROM Tag WHERE name = N'Adventure'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Mystery')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas'),
            (SELECT tag_id FROM Tag WHERE name = N'Mystery'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Human', (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas'), N'Ordinary humans adapted to the customs of this world.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Mystic' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Mystic', (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas'), N'People touched by old magic.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Outlander' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Outlander', (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas'), N'Travelers or descendants from distant regions.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'The Citadel' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'The Citadel', N'A notable place in The Sunken Atlas, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'The District' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'The District', N'A notable place in The Sunken Atlas, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'The Market' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'The Market', N'A notable place in The Sunken Atlas, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Aria of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Aria of The', N'Female', N'A brave figure who searches for hidden truths.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas'),
            (SELECT species_id FROM Species WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Orin of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Orin of The', N'Male', N'A conflicted character with a dangerous secret.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas'),
            (SELECT species_id FROM Species WHERE name = N'Mystic' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Vera of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Vera of The', N'Other', N'A clever outsider who changes the course of the story.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas'),
            (SELECT species_id FROM Species WHERE name = N'Outlander' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Dorian of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Dorian of The', N'Female', N'A loyal companion whose choices affect the whole universe.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas'),
            (SELECT species_id FROM Species WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas') AND order_index = 1
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'Storm at the Gate', N'In The Sunken Atlas, the characters discover a new problem and choose their next move.', 1, (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas') AND order_index = 2
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'The Secret Map', N'In The Sunken Atlas, the characters discover a new problem and choose their next move.', 2, (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas') AND order_index = 3
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'Opening Signs', N'In The Sunken Atlas, the characters discover a new problem and choose their next move.', 3, (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Aria of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Aria of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Orin of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Orin of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Orin of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Orin of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Vera of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Vera of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Vera of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Vera of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Dorian of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Dorian of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas') AND order_index = 1)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'The Citadel' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas') AND order_index = 1),
            (SELECT location_id FROM Location WHERE name = N'The Citadel' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas') AND order_index = 2)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'The District' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas') AND order_index = 2),
            (SELECT location_id FROM Location WHERE name = N'The District' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas') AND order_index = 3)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'The Market' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas') AND order_index = 3),
            (SELECT location_id FROM Location WHERE name = N'The Market' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Aria of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Orin of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Aria of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas')),
            (SELECT character_id FROM Characters WHERE name = N'Orin of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas')),
            N'siblings');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Orin of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Vera of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Orin of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas')),
            (SELECT character_id FROM Characters WHERE name = N'Vera of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas')),
            N'enemies');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Vera of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Dorian of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Vera of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas')),
            (SELECT character_id FROM Characters WHERE name = N'Dorian of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas')),
            N'sworn protectors');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Album
    WHERE name = N'The Sunken Atlas Gallery' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas')
)
BEGIN
    INSERT INTO Album (name, description, universe_id)
    VALUES (N'The Sunken Atlas Gallery', N'Album prepared for future images.',
            (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas'));
END
GO

-- Universe: Starfall Colony
IF NOT EXISTS (SELECT 1 FROM Universe WHERE name = N'Starfall Colony')
BEGIN
    INSERT INTO Universe (name, description, visibility, cover_img_url, owner_id)
    VALUES (N'Starfall Colony', N'A colony on a broken moon where every meteor brings strange signals.', N'public', NULL, (SELECT user_id FROM Users WHERE username = N'nova_dreamer'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Sci-Fi')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Starfall Colony'),
            (SELECT tag_id FROM Tag WHERE name = N'Sci-Fi'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Space Opera')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Starfall Colony'),
            (SELECT tag_id FROM Tag WHERE name = N'Space Opera'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Mystery')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Starfall Colony'),
            (SELECT tag_id FROM Tag WHERE name = N'Mystery'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Human', (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony'), N'Humans living under advanced technology.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Augmented Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Augmented Human', (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony'), N'People enhanced with cybernetic or biological upgrades.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Synthetic' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Synthetic', (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony'), N'Artificial beings with independent thoughts.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Starfall Forest' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Starfall Forest', N'A notable place in Starfall Colony, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Starfall Tower' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Starfall Tower', N'A notable place in Starfall Colony, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Starfall Ruins' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Starfall Ruins', N'A notable place in Starfall Colony, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Talon of Starfall' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Talon of Starfall', N'Female', N'A brave figure who searches for hidden truths.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony'),
            (SELECT species_id FROM Species WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Mira of Starfall' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Mira of Starfall', N'Male', N'A conflicted character with a dangerous secret.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony'),
            (SELECT species_id FROM Species WHERE name = N'Augmented Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Elias of Starfall' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Elias of Starfall', N'Other', N'A clever outsider who changes the course of the story.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony'),
            (SELECT species_id FROM Species WHERE name = N'Synthetic' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Sera of Starfall' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Sera of Starfall', N'Female', N'A loyal companion whose choices affect the whole universe.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony'),
            (SELECT species_id FROM Species WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony') AND order_index = 1
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'A Broken Promise', N'In Starfall Colony, the characters discover a new problem and choose their next move.', 1, (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony') AND order_index = 2
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'Storm at the Gate', N'In Starfall Colony, the characters discover a new problem and choose their next move.', 2, (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony') AND order_index = 3
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'The Secret Map', N'In Starfall Colony, the characters discover a new problem and choose their next move.', 3, (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Talon of Starfall' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Talon of Starfall' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Mira of Starfall' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Mira of Starfall' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Mira of Starfall' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Mira of Starfall' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Elias of Starfall' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Elias of Starfall' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Elias of Starfall' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Elias of Starfall' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Sera of Starfall' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Sera of Starfall' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony') AND order_index = 1)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Starfall Forest' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony') AND order_index = 1),
            (SELECT location_id FROM Location WHERE name = N'Starfall Forest' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony') AND order_index = 2)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Starfall Tower' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony') AND order_index = 2),
            (SELECT location_id FROM Location WHERE name = N'Starfall Tower' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony') AND order_index = 3)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Starfall Ruins' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony') AND order_index = 3),
            (SELECT location_id FROM Location WHERE name = N'Starfall Ruins' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Talon of Starfall' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Mira of Starfall' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Talon of Starfall' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony')),
            (SELECT character_id FROM Characters WHERE name = N'Mira of Starfall' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony')),
            N'rivals');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Mira of Starfall' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Elias of Starfall' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Mira of Starfall' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony')),
            (SELECT character_id FROM Characters WHERE name = N'Elias of Starfall' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony')),
            N'mentor');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Elias of Starfall' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Sera of Starfall' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Elias of Starfall' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony')),
            (SELECT character_id FROM Characters WHERE name = N'Sera of Starfall' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony')),
            N'childhood friends');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Album
    WHERE name = N'Starfall Colony Gallery' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony')
)
BEGIN
    INSERT INTO Album (name, description, universe_id)
    VALUES (N'Starfall Colony Gallery', N'Album prepared for future images.',
            (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony'));
END
GO

-- Universe: Dreammarket
IF NOT EXISTS (SELECT 1 FROM Universe WHERE name = N'Dreammarket')
BEGIN
    INSERT INTO Universe (name, description, visibility, cover_img_url, owner_id)
    VALUES (N'Dreammarket', N'An urban fantasy city where memories are bought and sold.', N'public', NULL, (SELECT user_id FROM Users WHERE username = N'nova_dreamer'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Urban Fantasy')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Dreammarket'),
            (SELECT tag_id FROM Tag WHERE name = N'Urban Fantasy'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Magic')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Dreammarket'),
            (SELECT tag_id FROM Tag WHERE name = N'Magic'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Mystery')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Dreammarket'),
            (SELECT tag_id FROM Tag WHERE name = N'Mystery'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Human', (SELECT universe_id FROM Universe WHERE name = N'Dreammarket'), N'Ordinary humans adapted to the customs of this world.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Mystic' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Mystic', (SELECT universe_id FROM Universe WHERE name = N'Dreammarket'), N'People touched by old magic.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Outlander' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Outlander', (SELECT universe_id FROM Universe WHERE name = N'Dreammarket'), N'Travelers or descendants from distant regions.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Dreammarket Ruins' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Dreammarket Ruins', N'A notable place in Dreammarket, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Dreammarket'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Dreammarket Academy' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Dreammarket Academy', N'A notable place in Dreammarket, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Dreammarket'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Dreammarket Wastes' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Dreammarket Wastes', N'A notable place in Dreammarket, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Dreammarket'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Cassian of Dreammarket' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Cassian of Dreammarket', N'Female', N'A brave figure who searches for hidden truths.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Dreammarket'),
            (SELECT species_id FROM Species WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Selene of Dreammarket' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Selene of Dreammarket', N'Male', N'A conflicted character with a dangerous secret.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Dreammarket'),
            (SELECT species_id FROM Species WHERE name = N'Mystic' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Kael of Dreammarket' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Kael of Dreammarket', N'Other', N'A clever outsider who changes the course of the story.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Dreammarket'),
            (SELECT species_id FROM Species WHERE name = N'Outlander' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Nira of Dreammarket' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Nira of Dreammarket', N'Female', N'A loyal companion whose choices affect the whole universe.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Dreammarket'),
            (SELECT species_id FROM Species WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket') AND order_index = 1
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'The Secret Map', N'In Dreammarket, the characters discover a new problem and choose their next move.', 1, (SELECT universe_id FROM Universe WHERE name = N'Dreammarket'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket') AND order_index = 2
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'Opening Signs', N'In Dreammarket, the characters discover a new problem and choose their next move.', 2, (SELECT universe_id FROM Universe WHERE name = N'Dreammarket'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket') AND order_index = 3
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'A Dangerous Meeting', N'In Dreammarket, the characters discover a new problem and choose their next move.', 3, (SELECT universe_id FROM Universe WHERE name = N'Dreammarket'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Cassian of Dreammarket' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Cassian of Dreammarket' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Selene of Dreammarket' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Selene of Dreammarket' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Selene of Dreammarket' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Selene of Dreammarket' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Kael of Dreammarket' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Kael of Dreammarket' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Kael of Dreammarket' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Kael of Dreammarket' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Nira of Dreammarket' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Nira of Dreammarket' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket') AND order_index = 1)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Dreammarket Ruins' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket') AND order_index = 1),
            (SELECT location_id FROM Location WHERE name = N'Dreammarket Ruins' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket') AND order_index = 2)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Dreammarket Academy' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket') AND order_index = 2),
            (SELECT location_id FROM Location WHERE name = N'Dreammarket Academy' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket') AND order_index = 3)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Dreammarket Wastes' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket') AND order_index = 3),
            (SELECT location_id FROM Location WHERE name = N'Dreammarket Wastes' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Cassian of Dreammarket' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Selene of Dreammarket' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Cassian of Dreammarket' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket')),
            (SELECT character_id FROM Characters WHERE name = N'Selene of Dreammarket' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket')),
            N'enemies');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Selene of Dreammarket' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Kael of Dreammarket' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Selene of Dreammarket' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket')),
            (SELECT character_id FROM Characters WHERE name = N'Kael of Dreammarket' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket')),
            N'sworn protectors');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Kael of Dreammarket' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Nira of Dreammarket' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Kael of Dreammarket' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket')),
            (SELECT character_id FROM Characters WHERE name = N'Nira of Dreammarket' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket')),
            N'rivals');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Album
    WHERE name = N'Dreammarket Gallery' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket')
)
BEGIN
    INSERT INTO Album (name, description, universe_id)
    VALUES (N'Dreammarket Gallery', N'Album prepared for future images.',
            (SELECT universe_id FROM Universe WHERE name = N'Dreammarket'));
END
GO

-- Universe: Emberline
IF NOT EXISTS (SELECT 1 FROM Universe WHERE name = N'Emberline')
BEGIN
    INSERT INTO Universe (name, description, visibility, cover_img_url, owner_id)
    VALUES (N'Emberline', N'A post-apocalyptic road world powered by old sun engines.', N'public', NULL, (SELECT user_id FROM Users WHERE username = N'nova_dreamer'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Post-Apocalyptic')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Emberline'),
            (SELECT tag_id FROM Tag WHERE name = N'Post-Apocalyptic'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Adventure')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Emberline'),
            (SELECT tag_id FROM Tag WHERE name = N'Adventure'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Survivor' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Survivor', (SELECT universe_id FROM Universe WHERE name = N'Emberline'), N'People adapted to the ruins of the old world.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Scavenger' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Scavenger', (SELECT universe_id FROM Universe WHERE name = N'Emberline'), N'Nomads who live from recovered technology.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Mutated Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Mutated Human', (SELECT universe_id FROM Universe WHERE name = N'Emberline'), N'Humans changed by the disaster.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Emberline District' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Emberline District', N'A notable place in Emberline, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Emberline'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Emberline Market' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Emberline Market', N'A notable place in Emberline, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Emberline'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Emberline Forest' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Emberline Forest', N'A notable place in Emberline, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Emberline'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Dorian of Emberline' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Dorian of Emberline', N'Female', N'A brave figure who searches for hidden truths.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Emberline'),
            (SELECT species_id FROM Species WHERE name = N'Survivor' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Iris of Emberline' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Iris of Emberline', N'Male', N'A conflicted character with a dangerous secret.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Emberline'),
            (SELECT species_id FROM Species WHERE name = N'Scavenger' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Talon of Emberline' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Talon of Emberline', N'Other', N'A clever outsider who changes the course of the story.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Emberline'),
            (SELECT species_id FROM Species WHERE name = N'Mutated Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Mira of Emberline' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Mira of Emberline', N'Female', N'A loyal companion whose choices affect the whole universe.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Emberline'),
            (SELECT species_id FROM Species WHERE name = N'Survivor' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline') AND order_index = 1
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'A Broken Promise', N'In Emberline, the characters discover a new problem and choose their next move.', 1, (SELECT universe_id FROM Universe WHERE name = N'Emberline'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline') AND order_index = 2
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'Storm at the Gate', N'In Emberline, the characters discover a new problem and choose their next move.', 2, (SELECT universe_id FROM Universe WHERE name = N'Emberline'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline') AND order_index = 3
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'The Secret Map', N'In Emberline, the characters discover a new problem and choose their next move.', 3, (SELECT universe_id FROM Universe WHERE name = N'Emberline'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Dorian of Emberline' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Dorian of Emberline' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Iris of Emberline' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Iris of Emberline' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Iris of Emberline' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Iris of Emberline' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Talon of Emberline' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Talon of Emberline' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Talon of Emberline' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Talon of Emberline' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Mira of Emberline' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Mira of Emberline' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline') AND order_index = 1)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Emberline District' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline') AND order_index = 1),
            (SELECT location_id FROM Location WHERE name = N'Emberline District' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline') AND order_index = 2)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Emberline Market' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline') AND order_index = 2),
            (SELECT location_id FROM Location WHERE name = N'Emberline Market' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline') AND order_index = 3)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Emberline Forest' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline') AND order_index = 3),
            (SELECT location_id FROM Location WHERE name = N'Emberline Forest' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Dorian of Emberline' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Iris of Emberline' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Dorian of Emberline' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline')),
            (SELECT character_id FROM Characters WHERE name = N'Iris of Emberline' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline')),
            N'siblings');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Iris of Emberline' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Talon of Emberline' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Iris of Emberline' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline')),
            (SELECT character_id FROM Characters WHERE name = N'Talon of Emberline' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline')),
            N'enemies');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Talon of Emberline' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Mira of Emberline' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Talon of Emberline' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline')),
            (SELECT character_id FROM Characters WHERE name = N'Mira of Emberline' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline')),
            N'sworn protectors');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Album
    WHERE name = N'Emberline Gallery' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline')
)
BEGIN
    INSERT INTO Album (name, description, universe_id)
    VALUES (N'Emberline Gallery', N'Album prepared for future images.',
            (SELECT universe_id FROM Universe WHERE name = N'Emberline'));
END
GO

-- Universe: The Hollow Archive
IF NOT EXISTS (SELECT 1 FROM Universe WHERE name = N'The Hollow Archive')
BEGIN
    INSERT INTO Universe (name, description, visibility, cover_img_url, owner_id)
    VALUES (N'The Hollow Archive', N'A magical archive where books rewrite the past.', N'public', NULL, (SELECT user_id FROM Users WHERE username = N'kael_archivist'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Dark Academia')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive'),
            (SELECT tag_id FROM Tag WHERE name = N'Dark Academia'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Magic')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive'),
            (SELECT tag_id FROM Tag WHERE name = N'Magic'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Mystery')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive'),
            (SELECT tag_id FROM Tag WHERE name = N'Mystery'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Nocturne' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Nocturne', (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive'), N'A bloodline tied to moonlight and old curses.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Human', (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive'), N'Citizens of old cities and noble houses.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Wraithborn' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Wraithborn', (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive'), N'People marked by ghostly inheritance.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'The Tower' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'The Tower', N'A notable place in The Hollow Archive, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'The Ruins' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'The Ruins', N'A notable place in The Hollow Archive, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'The Academy' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'The Academy', N'A notable place in The Hollow Archive, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Mira of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Mira of The', N'Female', N'A brave figure who searches for hidden truths.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive'),
            (SELECT species_id FROM Species WHERE name = N'Nocturne' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Elias of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Elias of The', N'Male', N'A conflicted character with a dangerous secret.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive'),
            (SELECT species_id FROM Species WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Sera of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Sera of The', N'Other', N'A clever outsider who changes the course of the story.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive'),
            (SELECT species_id FROM Species WHERE name = N'Wraithborn' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Cassian of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Cassian of The', N'Female', N'A loyal companion whose choices affect the whole universe.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive'),
            (SELECT species_id FROM Species WHERE name = N'Nocturne' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive') AND order_index = 1
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'Opening Signs', N'In The Hollow Archive, the characters discover a new problem and choose their next move.', 1, (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive') AND order_index = 2
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'A Dangerous Meeting', N'In The Hollow Archive, the characters discover a new problem and choose their next move.', 2, (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive') AND order_index = 3
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'The Hidden Place', N'In The Hollow Archive, the characters discover a new problem and choose their next move.', 3, (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Mira of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Mira of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Elias of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Elias of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Elias of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Elias of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Sera of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Sera of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Sera of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Sera of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Cassian of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Cassian of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive') AND order_index = 1)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'The Tower' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive') AND order_index = 1),
            (SELECT location_id FROM Location WHERE name = N'The Tower' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive') AND order_index = 2)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'The Ruins' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive') AND order_index = 2),
            (SELECT location_id FROM Location WHERE name = N'The Ruins' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive') AND order_index = 3)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'The Academy' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive') AND order_index = 3),
            (SELECT location_id FROM Location WHERE name = N'The Academy' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Mira of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Elias of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Mira of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive')),
            (SELECT character_id FROM Characters WHERE name = N'Elias of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive')),
            N'enemies');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Elias of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Sera of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Elias of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive')),
            (SELECT character_id FROM Characters WHERE name = N'Sera of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive')),
            N'sworn protectors');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Sera of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Cassian of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Sera of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive')),
            (SELECT character_id FROM Characters WHERE name = N'Cassian of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive')),
            N'rivals');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Album
    WHERE name = N'The Hollow Archive Gallery' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive')
)
BEGIN
    INSERT INTO Album (name, description, universe_id)
    VALUES (N'The Hollow Archive Gallery', N'Album prepared for future images.',
            (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive'));
END
GO

-- Universe: Cinder Kingdom
IF NOT EXISTS (SELECT 1 FROM Universe WHERE name = N'Cinder Kingdom')
BEGIN
    INSERT INTO Universe (name, description, visibility, cover_img_url, owner_id)
    VALUES (N'Cinder Kingdom', N'A kingdom built on the bones of an extinct fire dragon.', N'public', NULL, (SELECT user_id FROM Users WHERE username = N'kael_archivist'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Fantasy')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom'),
            (SELECT tag_id FROM Tag WHERE name = N'Fantasy'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Dragons')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom'),
            (SELECT tag_id FROM Tag WHERE name = N'Dragons'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Royalty')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom'),
            (SELECT tag_id FROM Tag WHERE name = N'Royalty'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Human', (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom'), N'Ordinary humans adapted to the customs of this world.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Mystic' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Mystic', (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom'), N'People touched by old magic.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Outlander' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Outlander', (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom'), N'Travelers or descendants from distant regions.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Cinder Academy' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Cinder Academy', N'A notable place in Cinder Kingdom, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Cinder Wastes' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Cinder Wastes', N'A notable place in Cinder Kingdom, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Cinder Capital' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Cinder Capital', N'A notable place in Cinder Kingdom, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Selene of Cinder' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Selene of Cinder', N'Female', N'A brave figure who searches for hidden truths.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom'),
            (SELECT species_id FROM Species WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Kael of Cinder' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Kael of Cinder', N'Male', N'A conflicted character with a dangerous secret.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom'),
            (SELECT species_id FROM Species WHERE name = N'Mystic' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Nira of Cinder' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Nira of Cinder', N'Other', N'A clever outsider who changes the course of the story.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom'),
            (SELECT species_id FROM Species WHERE name = N'Outlander' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Riven of Cinder' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Riven of Cinder', N'Female', N'A loyal companion whose choices affect the whole universe.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom'),
            (SELECT species_id FROM Species WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom') AND order_index = 1
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'The Hidden Place', N'In Cinder Kingdom, the characters discover a new problem and choose their next move.', 1, (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom') AND order_index = 2
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'A Broken Promise', N'In Cinder Kingdom, the characters discover a new problem and choose their next move.', 2, (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom') AND order_index = 3
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'Storm at the Gate', N'In Cinder Kingdom, the characters discover a new problem and choose their next move.', 3, (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Selene of Cinder' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Selene of Cinder' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Kael of Cinder' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Kael of Cinder' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Kael of Cinder' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Kael of Cinder' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Nira of Cinder' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Nira of Cinder' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Nira of Cinder' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Nira of Cinder' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Riven of Cinder' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Riven of Cinder' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom') AND order_index = 1)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Cinder Academy' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom') AND order_index = 1),
            (SELECT location_id FROM Location WHERE name = N'Cinder Academy' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom') AND order_index = 2)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Cinder Wastes' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom') AND order_index = 2),
            (SELECT location_id FROM Location WHERE name = N'Cinder Wastes' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom') AND order_index = 3)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Cinder Capital' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom') AND order_index = 3),
            (SELECT location_id FROM Location WHERE name = N'Cinder Capital' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Selene of Cinder' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Kael of Cinder' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Selene of Cinder' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom')),
            (SELECT character_id FROM Characters WHERE name = N'Kael of Cinder' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom')),
            N'allies');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Kael of Cinder' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Nira of Cinder' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Kael of Cinder' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom')),
            (SELECT character_id FROM Characters WHERE name = N'Nira of Cinder' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom')),
            N'siblings');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Nira of Cinder' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Riven of Cinder' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Nira of Cinder' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom')),
            (SELECT character_id FROM Characters WHERE name = N'Riven of Cinder' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom')),
            N'enemies');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Album
    WHERE name = N'Cinder Kingdom Gallery' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom')
)
BEGIN
    INSERT INTO Album (name, description, universe_id)
    VALUES (N'Cinder Kingdom Gallery', N'Album prepared for future images.',
            (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom'));
END
GO

-- Universe: Nox Harbor
IF NOT EXISTS (SELECT 1 FROM Universe WHERE name = N'Nox Harbor')
BEGIN
    INSERT INTO Universe (name, description, visibility, cover_img_url, owner_id)
    VALUES (N'Nox Harbor', N'A gothic port city where ghosts work as sailors.', N'private', NULL, (SELECT user_id FROM Users WHERE username = N'kael_archivist'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Gothic')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Nox Harbor'),
            (SELECT tag_id FROM Tag WHERE name = N'Gothic'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Mystery')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Nox Harbor'),
            (SELECT tag_id FROM Tag WHERE name = N'Mystery'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Nocturne' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Nocturne', (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor'), N'A bloodline tied to moonlight and old curses.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Human', (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor'), N'Citizens of old cities and noble houses.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Wraithborn' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Wraithborn', (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor'), N'People marked by ghostly inheritance.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Nox Capital' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Nox Capital', N'A notable place in Nox Harbor, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Nox Harbor' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Nox Harbor', N'A notable place in Nox Harbor, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Nox Citadel' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Nox Citadel', N'A notable place in Nox Harbor, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Lyra of Nox' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Lyra of Nox', N'Female', N'A brave figure who searches for hidden truths.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor'),
            (SELECT species_id FROM Species WHERE name = N'Nocturne' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Noah of Nox' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Noah of Nox', N'Male', N'A conflicted character with a dangerous secret.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor'),
            (SELECT species_id FROM Species WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Aria of Nox' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Aria of Nox', N'Other', N'A clever outsider who changes the course of the story.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor'),
            (SELECT species_id FROM Species WHERE name = N'Wraithborn' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Orin of Nox' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Orin of Nox', N'Female', N'A loyal companion whose choices affect the whole universe.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor'),
            (SELECT species_id FROM Species WHERE name = N'Nocturne' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor') AND order_index = 1
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'Storm at the Gate', N'In Nox Harbor, the characters discover a new problem and choose their next move.', 1, (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor') AND order_index = 2
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'The Secret Map', N'In Nox Harbor, the characters discover a new problem and choose their next move.', 2, (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor') AND order_index = 3
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'Opening Signs', N'In Nox Harbor, the characters discover a new problem and choose their next move.', 3, (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Lyra of Nox' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Lyra of Nox' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Noah of Nox' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Noah of Nox' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Noah of Nox' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Noah of Nox' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Aria of Nox' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Aria of Nox' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Aria of Nox' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Aria of Nox' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Orin of Nox' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Orin of Nox' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor') AND order_index = 1)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Nox Capital' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor') AND order_index = 1),
            (SELECT location_id FROM Location WHERE name = N'Nox Capital' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor') AND order_index = 2)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Nox Harbor' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor') AND order_index = 2),
            (SELECT location_id FROM Location WHERE name = N'Nox Harbor' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor') AND order_index = 3)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Nox Citadel' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor') AND order_index = 3),
            (SELECT location_id FROM Location WHERE name = N'Nox Citadel' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Lyra of Nox' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Noah of Nox' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Lyra of Nox' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor')),
            (SELECT character_id FROM Characters WHERE name = N'Noah of Nox' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor')),
            N'mentor');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Noah of Nox' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Aria of Nox' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Noah of Nox' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor')),
            (SELECT character_id FROM Characters WHERE name = N'Aria of Nox' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor')),
            N'childhood friends');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Aria of Nox' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Orin of Nox' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Aria of Nox' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor')),
            (SELECT character_id FROM Characters WHERE name = N'Orin of Nox' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor')),
            N'allies');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Album
    WHERE name = N'Nox Harbor Gallery' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor')
)
BEGIN
    INSERT INTO Album (name, description, universe_id)
    VALUES (N'Nox Harbor Gallery', N'Album prepared for future images.',
            (SELECT universe_id FROM Universe WHERE name = N'Nox Harbor'));
END
GO

-- Universe: Silver Circuit
IF NOT EXISTS (SELECT 1 FROM Universe WHERE name = N'Silver Circuit')
BEGIN
    INSERT INTO Universe (name, description, visibility, cover_img_url, owner_id)
    VALUES (N'Silver Circuit', N'A sleek AI-controlled city with hidden human rebels.', N'public', NULL, (SELECT user_id FROM Users WHERE username = N'kael_archivist'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Sci-Fi')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Silver Circuit'),
            (SELECT tag_id FROM Tag WHERE name = N'Sci-Fi'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Cyberpunk')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Silver Circuit'),
            (SELECT tag_id FROM Tag WHERE name = N'Cyberpunk'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Human', (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit'), N'Humans living under advanced technology.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Augmented Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Augmented Human', (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit'), N'People enhanced with cybernetic or biological upgrades.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Synthetic' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Synthetic', (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit'), N'Artificial beings with independent thoughts.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Silver Academy' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Silver Academy', N'A notable place in Silver Circuit, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Silver Wastes' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Silver Wastes', N'A notable place in Silver Circuit, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Silver Capital' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Silver Capital', N'A notable place in Silver Circuit, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Selene of Silver' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Selene of Silver', N'Female', N'A brave figure who searches for hidden truths.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit'),
            (SELECT species_id FROM Species WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Kael of Silver' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Kael of Silver', N'Male', N'A conflicted character with a dangerous secret.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit'),
            (SELECT species_id FROM Species WHERE name = N'Augmented Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Nira of Silver' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Nira of Silver', N'Other', N'A clever outsider who changes the course of the story.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit'),
            (SELECT species_id FROM Species WHERE name = N'Synthetic' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Riven of Silver' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Riven of Silver', N'Female', N'A loyal companion whose choices affect the whole universe.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit'),
            (SELECT species_id FROM Species WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit') AND order_index = 1
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'The Hidden Place', N'In Silver Circuit, the characters discover a new problem and choose their next move.', 1, (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit') AND order_index = 2
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'A Broken Promise', N'In Silver Circuit, the characters discover a new problem and choose their next move.', 2, (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit') AND order_index = 3
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'Storm at the Gate', N'In Silver Circuit, the characters discover a new problem and choose their next move.', 3, (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Selene of Silver' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Selene of Silver' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Kael of Silver' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Kael of Silver' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Kael of Silver' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Kael of Silver' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Nira of Silver' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Nira of Silver' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Nira of Silver' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Nira of Silver' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Riven of Silver' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Riven of Silver' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit') AND order_index = 1)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Silver Academy' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit') AND order_index = 1),
            (SELECT location_id FROM Location WHERE name = N'Silver Academy' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit') AND order_index = 2)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Silver Wastes' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit') AND order_index = 2),
            (SELECT location_id FROM Location WHERE name = N'Silver Wastes' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit') AND order_index = 3)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Silver Capital' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit') AND order_index = 3),
            (SELECT location_id FROM Location WHERE name = N'Silver Capital' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Selene of Silver' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Kael of Silver' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Selene of Silver' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit')),
            (SELECT character_id FROM Characters WHERE name = N'Kael of Silver' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit')),
            N'allies');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Kael of Silver' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Nira of Silver' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Kael of Silver' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit')),
            (SELECT character_id FROM Characters WHERE name = N'Nira of Silver' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit')),
            N'siblings');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Nira of Silver' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Riven of Silver' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Nira of Silver' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit')),
            (SELECT character_id FROM Characters WHERE name = N'Riven of Silver' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit')),
            N'enemies');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Album
    WHERE name = N'Silver Circuit Gallery' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit')
)
BEGIN
    INSERT INTO Album (name, description, universe_id)
    VALUES (N'Silver Circuit Gallery', N'Album prepared for future images.',
            (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit'));
END
GO

-- Universe: Eldergrove
IF NOT EXISTS (SELECT 1 FROM Universe WHERE name = N'Eldergrove')
BEGIN
    INSERT INTO Universe (name, description, visibility, cover_img_url, owner_id)
    VALUES (N'Eldergrove', N'A mythic forest realm ruled by old gods and animal spirits.', N'public', NULL, (SELECT user_id FROM Users WHERE username = N'ivy_myth'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Mythology')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Eldergrove'),
            (SELECT tag_id FROM Tag WHERE name = N'Mythology'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Fantasy')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Eldergrove'),
            (SELECT tag_id FROM Tag WHERE name = N'Fantasy'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Magic')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Eldergrove'),
            (SELECT tag_id FROM Tag WHERE name = N'Magic'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Human', (SELECT universe_id FROM Universe WHERE name = N'Eldergrove'), N'Ordinary humans adapted to the customs of this world.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Mystic' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Mystic', (SELECT universe_id FROM Universe WHERE name = N'Eldergrove'), N'People touched by old magic.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Outlander' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Outlander', (SELECT universe_id FROM Universe WHERE name = N'Eldergrove'), N'Travelers or descendants from distant regions.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Eldergrove Capital' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Eldergrove Capital', N'A notable place in Eldergrove, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Eldergrove'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Eldergrove Harbor' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Eldergrove Harbor', N'A notable place in Eldergrove, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Eldergrove'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Eldergrove Citadel' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Eldergrove Citadel', N'A notable place in Eldergrove, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Eldergrove'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Lyra of Eldergrove' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Lyra of Eldergrove', N'Female', N'A brave figure who searches for hidden truths.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Eldergrove'),
            (SELECT species_id FROM Species WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Noah of Eldergrove' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Noah of Eldergrove', N'Male', N'A conflicted character with a dangerous secret.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Eldergrove'),
            (SELECT species_id FROM Species WHERE name = N'Mystic' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Aria of Eldergrove' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Aria of Eldergrove', N'Other', N'A clever outsider who changes the course of the story.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Eldergrove'),
            (SELECT species_id FROM Species WHERE name = N'Outlander' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Orin of Eldergrove' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Orin of Eldergrove', N'Female', N'A loyal companion whose choices affect the whole universe.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Eldergrove'),
            (SELECT species_id FROM Species WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove') AND order_index = 1
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'Storm at the Gate', N'In Eldergrove, the characters discover a new problem and choose their next move.', 1, (SELECT universe_id FROM Universe WHERE name = N'Eldergrove'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove') AND order_index = 2
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'The Secret Map', N'In Eldergrove, the characters discover a new problem and choose their next move.', 2, (SELECT universe_id FROM Universe WHERE name = N'Eldergrove'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove') AND order_index = 3
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'Opening Signs', N'In Eldergrove, the characters discover a new problem and choose their next move.', 3, (SELECT universe_id FROM Universe WHERE name = N'Eldergrove'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Lyra of Eldergrove' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Lyra of Eldergrove' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Noah of Eldergrove' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Noah of Eldergrove' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Noah of Eldergrove' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Noah of Eldergrove' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Aria of Eldergrove' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Aria of Eldergrove' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Aria of Eldergrove' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Aria of Eldergrove' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Orin of Eldergrove' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Orin of Eldergrove' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove') AND order_index = 1)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Eldergrove Capital' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove') AND order_index = 1),
            (SELECT location_id FROM Location WHERE name = N'Eldergrove Capital' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove') AND order_index = 2)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Eldergrove Harbor' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove') AND order_index = 2),
            (SELECT location_id FROM Location WHERE name = N'Eldergrove Harbor' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove') AND order_index = 3)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Eldergrove Citadel' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove') AND order_index = 3),
            (SELECT location_id FROM Location WHERE name = N'Eldergrove Citadel' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Lyra of Eldergrove' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Noah of Eldergrove' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Lyra of Eldergrove' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove')),
            (SELECT character_id FROM Characters WHERE name = N'Noah of Eldergrove' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove')),
            N'mentor');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Noah of Eldergrove' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Aria of Eldergrove' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Noah of Eldergrove' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove')),
            (SELECT character_id FROM Characters WHERE name = N'Aria of Eldergrove' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove')),
            N'childhood friends');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Aria of Eldergrove' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Orin of Eldergrove' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Aria of Eldergrove' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove')),
            (SELECT character_id FROM Characters WHERE name = N'Orin of Eldergrove' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove')),
            N'allies');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Album
    WHERE name = N'Eldergrove Gallery' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove')
)
BEGIN
    INSERT INTO Album (name, description, universe_id)
    VALUES (N'Eldergrove Gallery', N'Album prepared for future images.',
            (SELECT universe_id FROM Universe WHERE name = N'Eldergrove'));
END
GO

-- Universe: Clockwork Vale
IF NOT EXISTS (SELECT 1 FROM Universe WHERE name = N'Clockwork Vale')
BEGIN
    INSERT INTO Universe (name, description, visibility, cover_img_url, owner_id)
    VALUES (N'Clockwork Vale', N'A valley of inventors, mechanical birds and royal conspiracies.', N'public', NULL, (SELECT user_id FROM Users WHERE username = N'ivy_myth'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Steampunk')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale'),
            (SELECT tag_id FROM Tag WHERE name = N'Steampunk'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Royalty')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale'),
            (SELECT tag_id FROM Tag WHERE name = N'Royalty'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Adventure')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale'),
            (SELECT tag_id FROM Tag WHERE name = N'Adventure'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Human', (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale'), N'Inventors, workers and nobles of the industrial age.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Clockwork Being' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Clockwork Being', (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale'), N'Mechanical beings with strange souls.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Skyfarer' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Skyfarer', (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale'), N'Airship crews and explorers.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Clockwork Academy' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Clockwork Academy', N'A notable place in Clockwork Vale, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Clockwork Wastes' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Clockwork Wastes', N'A notable place in Clockwork Vale, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Clockwork Capital' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Clockwork Capital', N'A notable place in Clockwork Vale, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Selene of Clockwork' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Selene of Clockwork', N'Female', N'A brave figure who searches for hidden truths.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale'),
            (SELECT species_id FROM Species WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Kael of Clockwork' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Kael of Clockwork', N'Male', N'A conflicted character with a dangerous secret.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale'),
            (SELECT species_id FROM Species WHERE name = N'Clockwork Being' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Nira of Clockwork' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Nira of Clockwork', N'Other', N'A clever outsider who changes the course of the story.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale'),
            (SELECT species_id FROM Species WHERE name = N'Skyfarer' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Riven of Clockwork' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Riven of Clockwork', N'Female', N'A loyal companion whose choices affect the whole universe.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale'),
            (SELECT species_id FROM Species WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale') AND order_index = 1
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'The Hidden Place', N'In Clockwork Vale, the characters discover a new problem and choose their next move.', 1, (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale') AND order_index = 2
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'A Broken Promise', N'In Clockwork Vale, the characters discover a new problem and choose their next move.', 2, (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale') AND order_index = 3
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'Storm at the Gate', N'In Clockwork Vale, the characters discover a new problem and choose their next move.', 3, (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Selene of Clockwork' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Selene of Clockwork' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Kael of Clockwork' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Kael of Clockwork' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Kael of Clockwork' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Kael of Clockwork' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Nira of Clockwork' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Nira of Clockwork' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Nira of Clockwork' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Nira of Clockwork' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Riven of Clockwork' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Riven of Clockwork' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale') AND order_index = 1)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Clockwork Academy' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale') AND order_index = 1),
            (SELECT location_id FROM Location WHERE name = N'Clockwork Academy' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale') AND order_index = 2)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Clockwork Wastes' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale') AND order_index = 2),
            (SELECT location_id FROM Location WHERE name = N'Clockwork Wastes' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale') AND order_index = 3)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Clockwork Capital' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale') AND order_index = 3),
            (SELECT location_id FROM Location WHERE name = N'Clockwork Capital' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Selene of Clockwork' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Kael of Clockwork' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Selene of Clockwork' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale')),
            (SELECT character_id FROM Characters WHERE name = N'Kael of Clockwork' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale')),
            N'allies');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Kael of Clockwork' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Nira of Clockwork' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Kael of Clockwork' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale')),
            (SELECT character_id FROM Characters WHERE name = N'Nira of Clockwork' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale')),
            N'siblings');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Nira of Clockwork' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Riven of Clockwork' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Nira of Clockwork' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale')),
            (SELECT character_id FROM Characters WHERE name = N'Riven of Clockwork' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale')),
            N'enemies');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Album
    WHERE name = N'Clockwork Vale Gallery' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale')
)
BEGIN
    INSERT INTO Album (name, description, universe_id)
    VALUES (N'Clockwork Vale Gallery', N'Album prepared for future images.',
            (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale'));
END
GO

-- Universe: Obsidian Crown
IF NOT EXISTS (SELECT 1 FROM Universe WHERE name = N'Obsidian Crown')
BEGIN
    INSERT INTO Universe (name, description, visibility, cover_img_url, owner_id)
    VALUES (N'Obsidian Crown', N'A dark royal fantasy about a crown that chooses its victims.', N'public', NULL, (SELECT user_id FROM Users WHERE username = N'rune_scribe'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Gothic')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown'),
            (SELECT tag_id FROM Tag WHERE name = N'Gothic'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Royalty')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown'),
            (SELECT tag_id FROM Tag WHERE name = N'Royalty'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Fantasy')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown'),
            (SELECT tag_id FROM Tag WHERE name = N'Fantasy'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Nocturne' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Nocturne', (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown'), N'A bloodline tied to moonlight and old curses.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Human', (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown'), N'Citizens of old cities and noble houses.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Wraithborn' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Wraithborn', (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown'), N'People marked by ghostly inheritance.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Obsidian Academy' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Obsidian Academy', N'A notable place in Obsidian Crown, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Obsidian Wastes' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Obsidian Wastes', N'A notable place in Obsidian Crown, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Obsidian Capital' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Obsidian Capital', N'A notable place in Obsidian Crown, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Selene of Obsidian' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Selene of Obsidian', N'Female', N'A brave figure who searches for hidden truths.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown'),
            (SELECT species_id FROM Species WHERE name = N'Nocturne' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Kael of Obsidian' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Kael of Obsidian', N'Male', N'A conflicted character with a dangerous secret.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown'),
            (SELECT species_id FROM Species WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Nira of Obsidian' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Nira of Obsidian', N'Other', N'A clever outsider who changes the course of the story.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown'),
            (SELECT species_id FROM Species WHERE name = N'Wraithborn' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Riven of Obsidian' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Riven of Obsidian', N'Female', N'A loyal companion whose choices affect the whole universe.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown'),
            (SELECT species_id FROM Species WHERE name = N'Nocturne' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown') AND order_index = 1
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'The Hidden Place', N'In Obsidian Crown, the characters discover a new problem and choose their next move.', 1, (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown') AND order_index = 2
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'A Broken Promise', N'In Obsidian Crown, the characters discover a new problem and choose their next move.', 2, (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown') AND order_index = 3
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'Storm at the Gate', N'In Obsidian Crown, the characters discover a new problem and choose their next move.', 3, (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Selene of Obsidian' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Selene of Obsidian' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Kael of Obsidian' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Kael of Obsidian' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Kael of Obsidian' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Kael of Obsidian' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Nira of Obsidian' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Nira of Obsidian' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Nira of Obsidian' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Nira of Obsidian' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Riven of Obsidian' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Riven of Obsidian' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown') AND order_index = 1)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Obsidian Academy' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown') AND order_index = 1),
            (SELECT location_id FROM Location WHERE name = N'Obsidian Academy' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown') AND order_index = 2)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Obsidian Wastes' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown') AND order_index = 2),
            (SELECT location_id FROM Location WHERE name = N'Obsidian Wastes' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown') AND order_index = 3)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Obsidian Capital' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown') AND order_index = 3),
            (SELECT location_id FROM Location WHERE name = N'Obsidian Capital' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Selene of Obsidian' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Kael of Obsidian' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Selene of Obsidian' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown')),
            (SELECT character_id FROM Characters WHERE name = N'Kael of Obsidian' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown')),
            N'allies');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Kael of Obsidian' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Nira of Obsidian' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Kael of Obsidian' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown')),
            (SELECT character_id FROM Characters WHERE name = N'Nira of Obsidian' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown')),
            N'siblings');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Nira of Obsidian' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Riven of Obsidian' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Nira of Obsidian' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown')),
            (SELECT character_id FROM Characters WHERE name = N'Riven of Obsidian' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown')),
            N'enemies');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Album
    WHERE name = N'Obsidian Crown Gallery' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown')
)
BEGIN
    INSERT INTO Album (name, description, universe_id)
    VALUES (N'Obsidian Crown Gallery', N'Album prepared for future images.',
            (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown'));
END
GO

-- Universe: Aurora Wastes
IF NOT EXISTS (SELECT 1 FROM Universe WHERE name = N'Aurora Wastes')
BEGIN
    INSERT INTO Universe (name, description, visibility, cover_img_url, owner_id)
    VALUES (N'Aurora Wastes', N'A frozen post-apocalyptic land lit by magical auroras.', N'public', NULL, (SELECT user_id FROM Users WHERE username = N'rune_scribe'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Post-Apocalyptic')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes'),
            (SELECT tag_id FROM Tag WHERE name = N'Post-Apocalyptic'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Magic')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes'),
            (SELECT tag_id FROM Tag WHERE name = N'Magic'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Adventure')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes'),
            (SELECT tag_id FROM Tag WHERE name = N'Adventure'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Survivor' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Survivor', (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes'), N'People adapted to the ruins of the old world.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Scavenger' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Scavenger', (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes'), N'Nomads who live from recovered technology.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Mutated Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Mutated Human', (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes'), N'Humans changed by the disaster.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Aurora Harbor' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Aurora Harbor', N'A notable place in Aurora Wastes, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Aurora Citadel' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Aurora Citadel', N'A notable place in Aurora Wastes, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Aurora District' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Aurora District', N'A notable place in Aurora Wastes, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Noah of Aurora' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Noah of Aurora', N'Female', N'A brave figure who searches for hidden truths.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes'),
            (SELECT species_id FROM Species WHERE name = N'Survivor' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Aria of Aurora' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Aria of Aurora', N'Male', N'A conflicted character with a dangerous secret.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes'),
            (SELECT species_id FROM Species WHERE name = N'Scavenger' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Orin of Aurora' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Orin of Aurora', N'Other', N'A clever outsider who changes the course of the story.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes'),
            (SELECT species_id FROM Species WHERE name = N'Mutated Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Vera of Aurora' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Vera of Aurora', N'Female', N'A loyal companion whose choices affect the whole universe.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes'),
            (SELECT species_id FROM Species WHERE name = N'Survivor' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes') AND order_index = 1
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'A Dangerous Meeting', N'In Aurora Wastes, the characters discover a new problem and choose their next move.', 1, (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes') AND order_index = 2
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'The Hidden Place', N'In Aurora Wastes, the characters discover a new problem and choose their next move.', 2, (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes') AND order_index = 3
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'A Broken Promise', N'In Aurora Wastes, the characters discover a new problem and choose their next move.', 3, (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Noah of Aurora' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Noah of Aurora' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Aria of Aurora' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Aria of Aurora' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Aria of Aurora' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Aria of Aurora' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Orin of Aurora' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Orin of Aurora' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Orin of Aurora' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Orin of Aurora' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Vera of Aurora' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Vera of Aurora' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes') AND order_index = 1)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Aurora Harbor' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes') AND order_index = 1),
            (SELECT location_id FROM Location WHERE name = N'Aurora Harbor' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes') AND order_index = 2)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Aurora Citadel' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes') AND order_index = 2),
            (SELECT location_id FROM Location WHERE name = N'Aurora Citadel' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes') AND order_index = 3)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Aurora District' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes') AND order_index = 3),
            (SELECT location_id FROM Location WHERE name = N'Aurora District' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Noah of Aurora' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Aria of Aurora' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Noah of Aurora' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes')),
            (SELECT character_id FROM Characters WHERE name = N'Aria of Aurora' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes')),
            N'sworn protectors');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Aria of Aurora' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Orin of Aurora' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Aria of Aurora' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes')),
            (SELECT character_id FROM Characters WHERE name = N'Orin of Aurora' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes')),
            N'rivals');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Orin of Aurora' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Vera of Aurora' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Orin of Aurora' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes')),
            (SELECT character_id FROM Characters WHERE name = N'Vera of Aurora' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes')),
            N'mentor');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Album
    WHERE name = N'Aurora Wastes Gallery' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes')
)
BEGIN
    INSERT INTO Album (name, description, universe_id)
    VALUES (N'Aurora Wastes Gallery', N'Album prepared for future images.',
            (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes'));
END
GO

-- Universe: The Inkbound Sea
IF NOT EXISTS (SELECT 1 FROM Universe WHERE name = N'The Inkbound Sea')
BEGIN
    INSERT INTO Universe (name, description, visibility, cover_img_url, owner_id)
    VALUES (N'The Inkbound Sea', N'A world where written stories become islands.', N'public', NULL, (SELECT user_id FROM Users WHERE username = N'rune_scribe'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Fantasy')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea'),
            (SELECT tag_id FROM Tag WHERE name = N'Fantasy'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Magic')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea'),
            (SELECT tag_id FROM Tag WHERE name = N'Magic'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Adventure')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea'),
            (SELECT tag_id FROM Tag WHERE name = N'Adventure'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Human', (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea'), N'Ordinary humans adapted to the customs of this world.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Mystic' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Mystic', (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea'), N'People touched by old magic.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Outlander' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Outlander', (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea'), N'Travelers or descendants from distant regions.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'The Citadel' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'The Citadel', N'A notable place in The Inkbound Sea, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'The District' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'The District', N'A notable place in The Inkbound Sea, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'The Market' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'The Market', N'A notable place in The Inkbound Sea, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Aria of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Aria of The', N'Female', N'A brave figure who searches for hidden truths.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea'),
            (SELECT species_id FROM Species WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Orin of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Orin of The', N'Male', N'A conflicted character with a dangerous secret.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea'),
            (SELECT species_id FROM Species WHERE name = N'Mystic' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Vera of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Vera of The', N'Other', N'A clever outsider who changes the course of the story.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea'),
            (SELECT species_id FROM Species WHERE name = N'Outlander' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Dorian of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Dorian of The', N'Female', N'A loyal companion whose choices affect the whole universe.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea'),
            (SELECT species_id FROM Species WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea') AND order_index = 1
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'Storm at the Gate', N'In The Inkbound Sea, the characters discover a new problem and choose their next move.', 1, (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea') AND order_index = 2
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'The Secret Map', N'In The Inkbound Sea, the characters discover a new problem and choose their next move.', 2, (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea') AND order_index = 3
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'Opening Signs', N'In The Inkbound Sea, the characters discover a new problem and choose their next move.', 3, (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Aria of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Aria of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Orin of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Orin of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Orin of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Orin of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Vera of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Vera of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Vera of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Vera of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Dorian of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Dorian of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea') AND order_index = 1)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'The Citadel' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea') AND order_index = 1),
            (SELECT location_id FROM Location WHERE name = N'The Citadel' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea') AND order_index = 2)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'The District' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea') AND order_index = 2),
            (SELECT location_id FROM Location WHERE name = N'The District' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea') AND order_index = 3)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'The Market' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea') AND order_index = 3),
            (SELECT location_id FROM Location WHERE name = N'The Market' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Aria of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Orin of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Aria of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea')),
            (SELECT character_id FROM Characters WHERE name = N'Orin of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea')),
            N'siblings');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Orin of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Vera of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Orin of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea')),
            (SELECT character_id FROM Characters WHERE name = N'Vera of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea')),
            N'enemies');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Vera of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Dorian of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Vera of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea')),
            (SELECT character_id FROM Characters WHERE name = N'Dorian of The' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea')),
            N'sworn protectors');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Album
    WHERE name = N'The Inkbound Sea Gallery' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea')
)
BEGIN
    INSERT INTO Album (name, description, universe_id)
    VALUES (N'The Inkbound Sea Gallery', N'Album prepared for future images.',
            (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea'));
END
GO

-- Universe: Violet Signal
IF NOT EXISTS (SELECT 1 FROM Universe WHERE name = N'Violet Signal')
BEGIN
    INSERT INTO Universe (name, description, visibility, cover_img_url, owner_id)
    VALUES (N'Violet Signal', N'A private sci-fi mystery about a signal from another timeline.', N'private', NULL, (SELECT user_id FROM Users WHERE username = N'rune_scribe'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Sci-Fi')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Violet Signal'),
            (SELECT tag_id FROM Tag WHERE name = N'Sci-Fi'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM UniverseTag
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal')
      AND tag_id = (SELECT tag_id FROM Tag WHERE name = N'Mystery')
)
BEGIN
    INSERT INTO UniverseTag (universe_id, tag_id)
    VALUES ((SELECT universe_id FROM Universe WHERE name = N'Violet Signal'),
            (SELECT tag_id FROM Tag WHERE name = N'Mystery'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Human', (SELECT universe_id FROM Universe WHERE name = N'Violet Signal'), N'Humans living under advanced technology.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Augmented Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Augmented Human', (SELECT universe_id FROM Universe WHERE name = N'Violet Signal'), N'People enhanced with cybernetic or biological upgrades.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Species
    WHERE name = N'Synthetic' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal')
)
BEGIN
    INSERT INTO Species (name, universe_id, description)
    VALUES (N'Synthetic', (SELECT universe_id FROM Universe WHERE name = N'Violet Signal'), N'Artificial beings with independent thoughts.');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Violet Harbor' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Violet Harbor', N'A notable place in Violet Signal, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Violet Signal'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Violet Citadel' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Violet Citadel', N'A notable place in Violet Signal, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Violet Signal'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Location
    WHERE name = N'Violet District' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal')
)
BEGIN
    INSERT INTO Location (name, description, main_img_url, universe_id)
    VALUES (N'Violet District', N'A notable place in Violet Signal, connected to conflicts, secrets and important scenes.', NULL, (SELECT universe_id FROM Universe WHERE name = N'Violet Signal'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Noah of Violet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Noah of Violet', N'Female', N'A brave figure who searches for hidden truths.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Violet Signal'),
            (SELECT species_id FROM Species WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Aria of Violet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Aria of Violet', N'Male', N'A conflicted character with a dangerous secret.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Violet Signal'),
            (SELECT species_id FROM Species WHERE name = N'Augmented Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Orin of Violet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Orin of Violet', N'Other', N'A clever outsider who changes the course of the story.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Violet Signal'),
            (SELECT species_id FROM Species WHERE name = N'Synthetic' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Characters
    WHERE name = N'Vera of Violet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal')
)
BEGIN
    INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
    VALUES (N'Vera of Violet', N'Female', N'A loyal companion whose choices affect the whole universe.', NULL,
            (SELECT universe_id FROM Universe WHERE name = N'Violet Signal'),
            (SELECT species_id FROM Species WHERE name = N'Human' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal') AND order_index = 1
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'A Dangerous Meeting', N'In Violet Signal, the characters discover a new problem and choose their next move.', 1, (SELECT universe_id FROM Universe WHERE name = N'Violet Signal'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal') AND order_index = 2
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'The Hidden Place', N'In Violet Signal, the characters discover a new problem and choose their next move.', 2, (SELECT universe_id FROM Universe WHERE name = N'Violet Signal'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegment
    WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal') AND order_index = 3
)
BEGIN
    INSERT INTO StorySegment (title, content, order_index, universe_id)
    VALUES (N'A Broken Promise', N'In Violet Signal, the characters discover a new problem and choose their next move.', 3, (SELECT universe_id FROM Universe WHERE name = N'Violet Signal'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Noah of Violet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Noah of Violet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Aria of Violet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal') AND order_index = 1)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Aria of Violet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal') AND order_index = 1));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Aria of Violet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Aria of Violet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Orin of Violet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal') AND order_index = 2)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Orin of Violet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal') AND order_index = 2));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Orin of Violet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Orin of Violet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterStorySegment
    WHERE character_id = (SELECT character_id FROM Characters WHERE name = N'Vera of Violet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal'))
      AND segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal') AND order_index = 3)
)
BEGIN
    INSERT INTO CharacterStorySegment (character_id, segment_id)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Vera of Violet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal')),
            (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal') AND order_index = 3));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal') AND order_index = 1)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Violet Harbor' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal') AND order_index = 1),
            (SELECT location_id FROM Location WHERE name = N'Violet Harbor' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal') AND order_index = 2)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Violet Citadel' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal') AND order_index = 2),
            (SELECT location_id FROM Location WHERE name = N'Violet Citadel' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM StorySegmentLocation
    WHERE segment_id = (SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal') AND order_index = 3)
      AND location_id = (SELECT location_id FROM Location WHERE name = N'Violet District' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal'))
)
BEGIN
    INSERT INTO StorySegmentLocation (segment_id, location_id)
    VALUES ((SELECT segment_id FROM StorySegment WHERE universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal') AND order_index = 3),
            (SELECT location_id FROM Location WHERE name = N'Violet District' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal')));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Noah of Violet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Aria of Violet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Noah of Violet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal')),
            (SELECT character_id FROM Characters WHERE name = N'Aria of Violet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal')),
            N'sworn protectors');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Aria of Violet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Orin of Violet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Aria of Violet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal')),
            (SELECT character_id FROM Characters WHERE name = N'Orin of Violet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal')),
            N'rivals');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM CharacterRelationship
    WHERE character_id_1 = (SELECT character_id FROM Characters WHERE name = N'Orin of Violet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal'))
      AND character_id_2 = (SELECT character_id FROM Characters WHERE name = N'Vera of Violet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal'))
)
BEGIN
    INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
    VALUES ((SELECT character_id FROM Characters WHERE name = N'Orin of Violet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal')),
            (SELECT character_id FROM Characters WHERE name = N'Vera of Violet' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal')),
            N'mentor');
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Album
    WHERE name = N'Violet Signal Gallery' AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Violet Signal')
)
BEGIN
    INSERT INTO Album (name, description, universe_id)
    VALUES (N'Violet Signal Gallery', N'Album prepared for future images.',
            (SELECT universe_id FROM Universe WHERE name = N'Violet Signal'));
END
GO
-- REVIEWS AND FAVORITES
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'orion_creator')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'The concept is very clear and easy to imagine.', 5,
            (SELECT user_id FROM Users WHERE username = N'orion_creator'),
            (SELECT universe_id FROM Universe WHERE name = N'Aetheria'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'mira_artist')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'I like the atmosphere and the main conflict.', 4,
            (SELECT user_id FROM Users WHERE username = N'mira_artist'),
            (SELECT universe_id FROM Universe WHERE name = N'Aetheria'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'atlas_maker')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'The world feels ready for more stories.', 5,
            (SELECT user_id FROM Users WHERE username = N'atlas_maker'),
            (SELECT universe_id FROM Universe WHERE name = N'Aetheria'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'atlas_maker')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'atlas_maker'),
            (SELECT universe_id FROM Universe WHERE name = N'Aetheria'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'nova_dreamer')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'nova_dreamer'),
            (SELECT universe_id FROM Universe WHERE name = N'Aetheria'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'kael_archivist')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aetheria')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'kael_archivist'),
            (SELECT universe_id FROM Universe WHERE name = N'Aetheria'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'mira_artist')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'I like the atmosphere and the main conflict.', 4,
            (SELECT user_id FROM Users WHERE username = N'mira_artist'),
            (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'atlas_maker')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'The world feels ready for more stories.', 5,
            (SELECT user_id FROM Users WHERE username = N'atlas_maker'),
            (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'nova_dreamer')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'Interesting characters and strong setting.', 3,
            (SELECT user_id FROM Users WHERE username = N'nova_dreamer'),
            (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'nova_dreamer')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'nova_dreamer'),
            (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'kael_archivist')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'kael_archivist'),
            (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'ivy_myth')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'ivy_myth'),
            (SELECT universe_id FROM Universe WHERE name = N'Velvet Academy'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'nova_dreamer')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'Interesting characters and strong setting.', 3,
            (SELECT user_id FROM Users WHERE username = N'nova_dreamer'),
            (SELECT universe_id FROM Universe WHERE name = N'Neon District 47'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'kael_archivist')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'This universe has a lot of potential.', 4,
            (SELECT user_id FROM Users WHERE username = N'kael_archivist'),
            (SELECT universe_id FROM Universe WHERE name = N'Neon District 47'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'ivy_myth')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'The concept is very clear and easy to imagine.', 5,
            (SELECT user_id FROM Users WHERE username = N'ivy_myth'),
            (SELECT universe_id FROM Universe WHERE name = N'Neon District 47'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'ivy_myth')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'ivy_myth'),
            (SELECT universe_id FROM Universe WHERE name = N'Neon District 47'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'rune_scribe')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'rune_scribe'),
            (SELECT universe_id FROM Universe WHERE name = N'Neon District 47'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'luna_writer')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Neon District 47')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'luna_writer'),
            (SELECT universe_id FROM Universe WHERE name = N'Neon District 47'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'kael_archivist')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'This universe has a lot of potential.', 4,
            (SELECT user_id FROM Users WHERE username = N'kael_archivist'),
            (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'ivy_myth')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'The concept is very clear and easy to imagine.', 5,
            (SELECT user_id FROM Users WHERE username = N'ivy_myth'),
            (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'rune_scribe')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'I like the atmosphere and the main conflict.', 4,
            (SELECT user_id FROM Users WHERE username = N'rune_scribe'),
            (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'rune_scribe')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'rune_scribe'),
            (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'luna_writer')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'luna_writer'),
            (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'mira_artist')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'mira_artist'),
            (SELECT universe_id FROM Universe WHERE name = N'The Last Terraformers'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'ivy_myth')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'The concept is very clear and easy to imagine.', 5,
            (SELECT user_id FROM Users WHERE username = N'ivy_myth'),
            (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'rune_scribe')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'I like the atmosphere and the main conflict.', 4,
            (SELECT user_id FROM Users WHERE username = N'rune_scribe'),
            (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'luna_writer')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'The world feels ready for more stories.', 5,
            (SELECT user_id FROM Users WHERE username = N'luna_writer'),
            (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'luna_writer')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'luna_writer'),
            (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'mira_artist')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'mira_artist'),
            (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'atlas_maker')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'atlas_maker'),
            (SELECT universe_id FROM Universe WHERE name = N'Iron Meridian'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'rune_scribe')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'I like the atmosphere and the main conflict.', 4,
            (SELECT user_id FROM Users WHERE username = N'rune_scribe'),
            (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'luna_writer')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'The world feels ready for more stories.', 5,
            (SELECT user_id FROM Users WHERE username = N'luna_writer'),
            (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'orion_creator')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'Interesting characters and strong setting.', 3,
            (SELECT user_id FROM Users WHERE username = N'orion_creator'),
            (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'orion_creator')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'orion_creator'),
            (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'atlas_maker')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'atlas_maker'),
            (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'nova_dreamer')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'nova_dreamer'),
            (SELECT universe_id FROM Universe WHERE name = N'Moonlit Empire'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'luna_writer')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'The world feels ready for more stories.', 5,
            (SELECT user_id FROM Users WHERE username = N'luna_writer'),
            (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'orion_creator')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'Interesting characters and strong setting.', 3,
            (SELECT user_id FROM Users WHERE username = N'orion_creator'),
            (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'atlas_maker')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'This universe has a lot of potential.', 4,
            (SELECT user_id FROM Users WHERE username = N'atlas_maker'),
            (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'atlas_maker')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'atlas_maker'),
            (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'nova_dreamer')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'nova_dreamer'),
            (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'kael_archivist')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'kael_archivist'),
            (SELECT universe_id FROM Universe WHERE name = N'Roseglass Court'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'mira_artist')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'This universe has a lot of potential.', 4,
            (SELECT user_id FROM Users WHERE username = N'mira_artist'),
            (SELECT universe_id FROM Universe WHERE name = N'Thornwild'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'nova_dreamer')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'The concept is very clear and easy to imagine.', 5,
            (SELECT user_id FROM Users WHERE username = N'nova_dreamer'),
            (SELECT universe_id FROM Universe WHERE name = N'Thornwild'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'kael_archivist')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'I like the atmosphere and the main conflict.', 4,
            (SELECT user_id FROM Users WHERE username = N'kael_archivist'),
            (SELECT universe_id FROM Universe WHERE name = N'Thornwild'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'kael_archivist')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'kael_archivist'),
            (SELECT universe_id FROM Universe WHERE name = N'Thornwild'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'ivy_myth')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'ivy_myth'),
            (SELECT universe_id FROM Universe WHERE name = N'Thornwild'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'rune_scribe')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Thornwild')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'rune_scribe'),
            (SELECT universe_id FROM Universe WHERE name = N'Thornwild'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'nova_dreamer')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'The concept is very clear and easy to imagine.', 5,
            (SELECT user_id FROM Users WHERE username = N'nova_dreamer'),
            (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'kael_archivist')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'I like the atmosphere and the main conflict.', 4,
            (SELECT user_id FROM Users WHERE username = N'kael_archivist'),
            (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'ivy_myth')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'The world feels ready for more stories.', 5,
            (SELECT user_id FROM Users WHERE username = N'ivy_myth'),
            (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'ivy_myth')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'ivy_myth'),
            (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'rune_scribe')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'rune_scribe'),
            (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'luna_writer')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'luna_writer'),
            (SELECT universe_id FROM Universe WHERE name = N'The Sunken Atlas'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'kael_archivist')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'I like the atmosphere and the main conflict.', 4,
            (SELECT user_id FROM Users WHERE username = N'kael_archivist'),
            (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'ivy_myth')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'The world feels ready for more stories.', 5,
            (SELECT user_id FROM Users WHERE username = N'ivy_myth'),
            (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'rune_scribe')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'Interesting characters and strong setting.', 3,
            (SELECT user_id FROM Users WHERE username = N'rune_scribe'),
            (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'rune_scribe')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'rune_scribe'),
            (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'luna_writer')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'luna_writer'),
            (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'orion_creator')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'orion_creator'),
            (SELECT universe_id FROM Universe WHERE name = N'Starfall Colony'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'ivy_myth')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'The world feels ready for more stories.', 5,
            (SELECT user_id FROM Users WHERE username = N'ivy_myth'),
            (SELECT universe_id FROM Universe WHERE name = N'Dreammarket'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'rune_scribe')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'Interesting characters and strong setting.', 3,
            (SELECT user_id FROM Users WHERE username = N'rune_scribe'),
            (SELECT universe_id FROM Universe WHERE name = N'Dreammarket'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'luna_writer')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'This universe has a lot of potential.', 4,
            (SELECT user_id FROM Users WHERE username = N'luna_writer'),
            (SELECT universe_id FROM Universe WHERE name = N'Dreammarket'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'luna_writer')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'luna_writer'),
            (SELECT universe_id FROM Universe WHERE name = N'Dreammarket'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'orion_creator')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'orion_creator'),
            (SELECT universe_id FROM Universe WHERE name = N'Dreammarket'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'mira_artist')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Dreammarket')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'mira_artist'),
            (SELECT universe_id FROM Universe WHERE name = N'Dreammarket'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'rune_scribe')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'Interesting characters and strong setting.', 3,
            (SELECT user_id FROM Users WHERE username = N'rune_scribe'),
            (SELECT universe_id FROM Universe WHERE name = N'Emberline'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'luna_writer')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'This universe has a lot of potential.', 4,
            (SELECT user_id FROM Users WHERE username = N'luna_writer'),
            (SELECT universe_id FROM Universe WHERE name = N'Emberline'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'orion_creator')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'The concept is very clear and easy to imagine.', 5,
            (SELECT user_id FROM Users WHERE username = N'orion_creator'),
            (SELECT universe_id FROM Universe WHERE name = N'Emberline'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'orion_creator')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'orion_creator'),
            (SELECT universe_id FROM Universe WHERE name = N'Emberline'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'mira_artist')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'mira_artist'),
            (SELECT universe_id FROM Universe WHERE name = N'Emberline'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'atlas_maker')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Emberline')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'atlas_maker'),
            (SELECT universe_id FROM Universe WHERE name = N'Emberline'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'luna_writer')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'This universe has a lot of potential.', 4,
            (SELECT user_id FROM Users WHERE username = N'luna_writer'),
            (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'orion_creator')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'The concept is very clear and easy to imagine.', 5,
            (SELECT user_id FROM Users WHERE username = N'orion_creator'),
            (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'mira_artist')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'I like the atmosphere and the main conflict.', 4,
            (SELECT user_id FROM Users WHERE username = N'mira_artist'),
            (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'mira_artist')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'mira_artist'),
            (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'atlas_maker')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'atlas_maker'),
            (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'nova_dreamer')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'nova_dreamer'),
            (SELECT universe_id FROM Universe WHERE name = N'The Hollow Archive'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'orion_creator')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'The concept is very clear and easy to imagine.', 5,
            (SELECT user_id FROM Users WHERE username = N'orion_creator'),
            (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'mira_artist')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'I like the atmosphere and the main conflict.', 4,
            (SELECT user_id FROM Users WHERE username = N'mira_artist'),
            (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'atlas_maker')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'The world feels ready for more stories.', 5,
            (SELECT user_id FROM Users WHERE username = N'atlas_maker'),
            (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'atlas_maker')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'atlas_maker'),
            (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'nova_dreamer')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'nova_dreamer'),
            (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'ivy_myth')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'ivy_myth'),
            (SELECT universe_id FROM Universe WHERE name = N'Cinder Kingdom'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'atlas_maker')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'The world feels ready for more stories.', 5,
            (SELECT user_id FROM Users WHERE username = N'atlas_maker'),
            (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'nova_dreamer')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'Interesting characters and strong setting.', 3,
            (SELECT user_id FROM Users WHERE username = N'nova_dreamer'),
            (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'ivy_myth')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'This universe has a lot of potential.', 4,
            (SELECT user_id FROM Users WHERE username = N'ivy_myth'),
            (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'ivy_myth')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'ivy_myth'),
            (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'rune_scribe')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'rune_scribe'),
            (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'luna_writer')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'luna_writer'),
            (SELECT universe_id FROM Universe WHERE name = N'Silver Circuit'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'nova_dreamer')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'Interesting characters and strong setting.', 3,
            (SELECT user_id FROM Users WHERE username = N'nova_dreamer'),
            (SELECT universe_id FROM Universe WHERE name = N'Eldergrove'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'kael_archivist')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'This universe has a lot of potential.', 4,
            (SELECT user_id FROM Users WHERE username = N'kael_archivist'),
            (SELECT universe_id FROM Universe WHERE name = N'Eldergrove'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'rune_scribe')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'The concept is very clear and easy to imagine.', 5,
            (SELECT user_id FROM Users WHERE username = N'rune_scribe'),
            (SELECT universe_id FROM Universe WHERE name = N'Eldergrove'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'rune_scribe')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'rune_scribe'),
            (SELECT universe_id FROM Universe WHERE name = N'Eldergrove'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'luna_writer')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'luna_writer'),
            (SELECT universe_id FROM Universe WHERE name = N'Eldergrove'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'orion_creator')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Eldergrove')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'orion_creator'),
            (SELECT universe_id FROM Universe WHERE name = N'Eldergrove'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'kael_archivist')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'This universe has a lot of potential.', 4,
            (SELECT user_id FROM Users WHERE username = N'kael_archivist'),
            (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'rune_scribe')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'The concept is very clear and easy to imagine.', 5,
            (SELECT user_id FROM Users WHERE username = N'rune_scribe'),
            (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'luna_writer')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'I like the atmosphere and the main conflict.', 4,
            (SELECT user_id FROM Users WHERE username = N'luna_writer'),
            (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'luna_writer')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'luna_writer'),
            (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'orion_creator')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'orion_creator'),
            (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'mira_artist')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'mira_artist'),
            (SELECT universe_id FROM Universe WHERE name = N'Clockwork Vale'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'ivy_myth')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'The concept is very clear and easy to imagine.', 5,
            (SELECT user_id FROM Users WHERE username = N'ivy_myth'),
            (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'luna_writer')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'I like the atmosphere and the main conflict.', 4,
            (SELECT user_id FROM Users WHERE username = N'luna_writer'),
            (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'orion_creator')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'The world feels ready for more stories.', 5,
            (SELECT user_id FROM Users WHERE username = N'orion_creator'),
            (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'orion_creator')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'orion_creator'),
            (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'mira_artist')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'mira_artist'),
            (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'atlas_maker')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'atlas_maker'),
            (SELECT universe_id FROM Universe WHERE name = N'Obsidian Crown'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'luna_writer')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'I like the atmosphere and the main conflict.', 4,
            (SELECT user_id FROM Users WHERE username = N'luna_writer'),
            (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'orion_creator')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'The world feels ready for more stories.', 5,
            (SELECT user_id FROM Users WHERE username = N'orion_creator'),
            (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'mira_artist')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'Interesting characters and strong setting.', 3,
            (SELECT user_id FROM Users WHERE username = N'mira_artist'),
            (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'mira_artist')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'mira_artist'),
            (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'atlas_maker')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'atlas_maker'),
            (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'nova_dreamer')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'nova_dreamer'),
            (SELECT universe_id FROM Universe WHERE name = N'Aurora Wastes'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'orion_creator')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'The world feels ready for more stories.', 5,
            (SELECT user_id FROM Users WHERE username = N'orion_creator'),
            (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'mira_artist')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'Interesting characters and strong setting.', 3,
            (SELECT user_id FROM Users WHERE username = N'mira_artist'),
            (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM Review
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'atlas_maker')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea')
)
BEGIN
    INSERT INTO Review (text, rating, user_id, universe_id)
    VALUES (N'This universe has a lot of potential.', 4,
            (SELECT user_id FROM Users WHERE username = N'atlas_maker'),
            (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'atlas_maker')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'atlas_maker'),
            (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'nova_dreamer')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'nova_dreamer'),
            (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea'));
END
GO
IF NOT EXISTS (
    SELECT 1 FROM FavoriteUniverse
    WHERE user_id = (SELECT user_id FROM Users WHERE username = N'kael_archivist')
      AND universe_id = (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea')
)
BEGIN
    INSERT INTO FavoriteUniverse (user_id, universe_id)
    VALUES ((SELECT user_id FROM Users WHERE username = N'kael_archivist'),
            (SELECT universe_id FROM Universe WHERE name = N'The Inkbound Sea'));
END
GO
COMMIT TRANSACTION;
GO