USE WorldBuilderPlatformDB;
GO

/* USERS */
INSERT INTO Users (username, email, password_hash, role_id)
VALUES
('admin', 'admin@worldbuilder.com', 'admin_hash_123', (SELECT role_id FROM Role WHERE name = 'Admin')),
('luna_writer', 'luna@example.com', 'hash_123', (SELECT role_id FROM Role WHERE name = 'User')),
('orion_creator', 'orion@example.com', 'hash_456', (SELECT role_id FROM Role WHERE name = 'User')),
('mira_artist', 'mira@example.com', 'hash_789', (SELECT role_id FROM Role WHERE name = 'User'));
GO

/* UNIVERSES */
INSERT INTO Universe (name, description, visibility, cover_img_url, owner_id)
VALUES
(
    'Aetheria',
    'A floating fantasy world made of sky islands, ancient dragons and lost kingdoms.',
    'public',
    '/Content/images/aetheria-cover.jpg',
    (SELECT user_id FROM Users WHERE username = 'luna_writer')
),
(
    'Neon District 47',
    'A cyberpunk city controlled by corporations, hackers and underground rebels.',
    'public',
    '/Content/images/neon-district-cover.jpg',
    (SELECT user_id FROM Users WHERE username = 'orion_creator')
),
(
    'Moonlit Empire',
    'A gothic empire where noble families, curses and forbidden magic shape every story.',
    'public',
    '/Content/images/moonlit-empire-cover.jpg',
    (SELECT user_id FROM Users WHERE username = 'mira_artist')
),
(
    'Private Draft World',
    'A private unfinished universe used for testing private visibility.',
    'private',
    '/Content/images/private-world-cover.jpg',
    (SELECT user_id FROM Users WHERE username = 'luna_writer')
);
GO


/* TAGS */
INSERT INTO Tag (name)
VALUES
('Fantasy'),
('Cyberpunk'),
('Gothic'),
('Magic'),
('Dragons'),
('Science Fiction'),
('Royalty'),
('Mystery'),
('Adventure'),
('Dark Academia');
GO


/* UNIVERSE TAGS */
INSERT INTO UniverseTag (universe_id, tag_id)
SELECT u.universe_id, t.tag_id
FROM Universe u, Tag t
WHERE u.name = 'Aetheria'
AND t.name IN ('Fantasy', 'Magic', 'Dragons', 'Adventure');

INSERT INTO UniverseTag (universe_id, tag_id)
SELECT u.universe_id, t.tag_id
FROM Universe u, Tag t
WHERE u.name = 'Neon District 47'
AND t.name IN ('Cyberpunk', 'Science Fiction', 'Mystery');

INSERT INTO UniverseTag (universe_id, tag_id)
SELECT u.universe_id, t.tag_id
FROM Universe u, Tag t
WHERE u.name = 'Moonlit Empire'
AND t.name IN ('Gothic', 'Royalty', 'Magic', 'Dark Academia');
GO


/* SPECIES */
INSERT INTO Species (name, universe_id, description)
VALUES
(
    'Skyborn',
    (SELECT universe_id FROM Universe WHERE name = 'Aetheria'),
    'People born with the ability to survive in high-altitude sky islands.'
),
(
    'Dragonkin',
    (SELECT universe_id FROM Universe WHERE name = 'Aetheria'),
    'Humanoids with ancient dragon ancestry.'
),
(
    'Augmented Human',
    (SELECT universe_id FROM Universe WHERE name = 'Neon District 47'),
    'Humans enhanced with cybernetic implants.'
),
(
    'Nocturne',
    (SELECT universe_id FROM Universe WHERE name = 'Moonlit Empire'),
    'A noble bloodline connected to moon magic and old curses.'
);
GO


/* LOCATIONS */
INSERT INTO Location (name, description, main_img_url, universe_id)
VALUES
(
    'Celestine Harbor',
    'A floating harbor where ships sail through clouds instead of water.',
    '/Content/images/celestine-harbor.jpg',
    (SELECT universe_id FROM Universe WHERE name = 'Aetheria')
),
(
    'The Broken Spire',
    'An ancient tower destroyed during the first dragon war.',
    '/Content/images/broken-spire.jpg',
    (SELECT universe_id FROM Universe WHERE name = 'Aetheria')
),
(
    'Chrome Alley',
    'A dangerous neon alley filled with black market technology.',
    '/Content/images/chrome-alley.jpg',
    (SELECT universe_id FROM Universe WHERE name = 'Neon District 47')
),
(
    'House Veyr Castle',
    'A cold gothic castle where the ruling family hides a terrible secret.',
    '/Content/images/veyr-castle.jpg',
    (SELECT universe_id FROM Universe WHERE name = 'Moonlit Empire')
);
GO


/* CHARACTERS */
INSERT INTO Characters (name, gender, description, main_img_url, universe_id, species_id)
VALUES
(
    'Elara Windvale',
    'Female',
    'A young cartographer who maps forbidden sky islands.',
    '/Content/images/elara.jpg',
    (SELECT universe_id FROM Universe WHERE name = 'Aetheria'),
    (SELECT species_id FROM Species WHERE name = 'Skyborn')
),
(
    'Kael Draven',
    'Male',
    'A dragonkin warrior searching for the last living ancient dragon.',
    '/Content/images/kael.jpg',
    (SELECT universe_id FROM Universe WHERE name = 'Aetheria'),
    (SELECT species_id FROM Species WHERE name = 'Dragonkin')
),
(
    'Nix Vale',
    'Non-binary',
    'A hacker who steals secrets from the biggest corporation in District 47.',
    '/Content/images/nix.jpg',
    (SELECT universe_id FROM Universe WHERE name = 'Neon District 47'),
    (SELECT species_id FROM Species WHERE name = 'Augmented Human')
),
(
    'Seraphine Veyr',
    'Female',
    'The heir of House Veyr, cursed to hear the voices of her ancestors.',
    '/Content/images/seraphine.jpg',
    (SELECT universe_id FROM Universe WHERE name = 'Moonlit Empire'),
    (SELECT species_id FROM Species WHERE name = 'Nocturne')
);
GO


/* CHARACTER RELATIONSHIPS */
INSERT INTO CharacterRelationship (character_id_1, character_id_2, relation_type)
VALUES
(
    (SELECT character_id FROM Characters WHERE name = 'Elara Windvale'),
    (SELECT character_id FROM Characters WHERE name = 'Kael Draven'),
    'allies'
);
GO


/* STORY SEGMENTS */
INSERT INTO StorySegment (title, content, order_index, universe_id)
VALUES
(
    'Arrival at Celestine Harbor',
    'Elara arrives at the floating harbor and discovers that one of the islands has disappeared from every map.',
    1,
    (SELECT universe_id FROM Universe WHERE name = 'Aetheria')
),
(
    'The Broken Spire',
    'Kael leads Elara to the ruins of the Broken Spire, where dragon symbols begin to glow.',
    2,
    (SELECT universe_id FROM Universe WHERE name = 'Aetheria')
),
(
    'Signal in the Rain',
    'Nix intercepts a forbidden signal during a storm in Chrome Alley.',
    1,
    (SELECT universe_id FROM Universe WHERE name = 'Neon District 47')
),
(
    'The Moonlit Ball',
    'Seraphine attends a royal ball where every guest hides a secret.',
    1,
    (SELECT universe_id FROM Universe WHERE name = 'Moonlit Empire')
);
GO


/* CHARACTER - STORY SEGMENT */
INSERT INTO CharacterStorySegment (character_id, segment_id)
VALUES
(
    (SELECT character_id FROM Characters WHERE name = 'Elara Windvale'),
    (SELECT segment_id FROM StorySegment WHERE title = 'Arrival at Celestine Harbor')
),
(
    (SELECT character_id FROM Characters WHERE name = 'Elara Windvale'),
    (SELECT segment_id FROM StorySegment WHERE title = 'The Broken Spire')
),
(
    (SELECT character_id FROM Characters WHERE name = 'Kael Draven'),
    (SELECT segment_id FROM StorySegment WHERE title = 'The Broken Spire')
),
(
    (SELECT character_id FROM Characters WHERE name = 'Nix Vale'),
    (SELECT segment_id FROM StorySegment WHERE title = 'Signal in the Rain')
),
(
    (SELECT character_id FROM Characters WHERE name = 'Seraphine Veyr'),
    (SELECT segment_id FROM StorySegment WHERE title = 'The Moonlit Ball')
);
GO


/* STORY SEGMENT - LOCATION */
INSERT INTO StorySegmentLocation (segment_id, location_id)
VALUES
(
    (SELECT segment_id FROM StorySegment WHERE title = 'Arrival at Celestine Harbor'),
    (SELECT location_id FROM Location WHERE name = 'Celestine Harbor')
),
(
    (SELECT segment_id FROM StorySegment WHERE title = 'The Broken Spire'),
    (SELECT location_id FROM Location WHERE name = 'The Broken Spire')
),
(
    (SELECT segment_id FROM StorySegment WHERE title = 'Signal in the Rain'),
    (SELECT location_id FROM Location WHERE name = 'Chrome Alley')
),
(
    (SELECT segment_id FROM StorySegment WHERE title = 'The Moonlit Ball'),
    (SELECT location_id FROM Location WHERE name = 'House Veyr Castle')
);
GO


/* ALBUMS */
INSERT INTO Album (name, description, universe_id)
VALUES
(
    'Aetheria Maps',
    'Maps and landscapes of the floating islands.',
    (SELECT universe_id FROM Universe WHERE name = 'Aetheria')
),
(
    'Aetheria Characters',
    'Character concept art for Aetheria.',
    (SELECT universe_id FROM Universe WHERE name = 'Aetheria')
),
(
    'Neon District Scenes',
    'City streets, alleys and cyberpunk locations.',
    (SELECT universe_id FROM Universe WHERE name = 'Neon District 47')
),
(
    'Moonlit Empire Gallery',
    'Castles, portraits and gothic architecture.',
    (SELECT universe_id FROM Universe WHERE name = 'Moonlit Empire')
);
GO


/* IMAGES */
INSERT INTO WorldImage (img_url, description, album_id)
VALUES
(
    '/Content/images/aetheria-map.jpg',
    'Map of the central sky islands.',
    (SELECT album_id FROM Album WHERE name = 'Aetheria Maps')
),
(
    '/Content/images/elara-concept.jpg',
    'Concept art of Elara Windvale.',
    (SELECT album_id FROM Album WHERE name = 'Aetheria Characters')
),
(
    '/Content/images/chrome-alley-night.jpg',
    'Chrome Alley during a neon storm.',
    (SELECT album_id FROM Album WHERE name = 'Neon District Scenes')
),
(
    '/Content/images/veyr-ballroom.jpg',
    'The ballroom of House Veyr Castle.',
    (SELECT album_id FROM Album WHERE name = 'Moonlit Empire Gallery')
);
GO


/* STORY SEGMENT - IMAGE */
INSERT INTO StorySegmentWorldImage (segment_id, image_id)
VALUES
(
    (SELECT segment_id FROM StorySegment WHERE title = 'Arrival at Celestine Harbor'),
    (SELECT image_id FROM WorldImage WHERE description = 'Map of the central sky islands.')
),
(
    (SELECT segment_id FROM StorySegment WHERE title = 'Arrival at Celestine Harbor'),
    (SELECT image_id FROM WorldImage WHERE description = 'Concept art of Elara Windvale.')
),
(
    (SELECT segment_id FROM StorySegment WHERE title = 'Signal in the Rain'),
    (SELECT image_id FROM WorldImage WHERE description = 'Chrome Alley during a neon storm.')
),
(
    (SELECT segment_id FROM StorySegment WHERE title = 'The Moonlit Ball'),
    (SELECT image_id FROM WorldImage WHERE description = 'The ballroom of House Veyr Castle.')
);
GO


/* REVIEWS */
/* Pazimo da user ne ocjenjuje sopstveni universe. */
INSERT INTO Review (text, rating, user_id, universe_id)
VALUES
(
    'Beautiful fantasy setting. I really like the sky island concept.',
    5,
    (SELECT user_id FROM Users WHERE username = 'orion_creator'),
    (SELECT universe_id FROM Universe WHERE name = 'Aetheria')
),
(
    'The world feels very cinematic and mysterious.',
    4,
    (SELECT user_id FROM Users WHERE username = 'mira_artist'),
    (SELECT universe_id FROM Universe WHERE name = 'Aetheria')
),
(
    'Great cyberpunk atmosphere. Chrome Alley is my favorite part.',
    5,
    (SELECT user_id FROM Users WHERE username = 'luna_writer'),
    (SELECT universe_id FROM Universe WHERE name = 'Neon District 47')
),
(
    'Very elegant gothic setting, perfect for dark fantasy stories.',
    5,
    (SELECT user_id FROM Users WHERE username = 'luna_writer'),
    (SELECT universe_id FROM Universe WHERE name = 'Moonlit Empire')
);
GO


/* FAVORITES */
INSERT INTO FavoriteUniverse (user_id, universe_id)
VALUES
(
    (SELECT user_id FROM Users WHERE username = 'orion_creator'),
    (SELECT universe_id FROM Universe WHERE name = 'Aetheria')
),
(
    (SELECT user_id FROM Users WHERE username = 'mira_artist'),
    (SELECT universe_id FROM Universe WHERE name = 'Aetheria')
),
(
    (SELECT user_id FROM Users WHERE username = 'luna_writer'),
    (SELECT universe_id FROM Universe WHERE name = 'Neon District 47')
),
(
    (SELECT user_id FROM Users WHERE username = 'luna_writer'),
    (SELECT universe_id FROM Universe WHERE name = 'Moonlit Empire')
),
(
    (SELECT user_id FROM Users WHERE username = 'orion_creator'),
    (SELECT universe_id FROM Universe WHERE name = 'Moonlit Empire')
);
GO