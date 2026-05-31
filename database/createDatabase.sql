CREATE DATABASE WorldBuilderPlatformDB
GO

USE WorldBuilderPlatformDB
GO

CREATE TABLE Role (
    role_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(50) NOT NULL UNIQUE
);
GO

CREATE TABLE Users (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    username NVARCHAR(100) NOT NULL UNIQUE,
    email NVARCHAR(150) NOT NULL UNIQUE,
    password_hash NVARCHAR(255) NOT NULL,
    created_at DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    role_id INT NOT NULL,

    FOREIGN KEY (role_id) REFERENCES Role(role_id)
);
GO

CREATE TABLE Universe (
    universe_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(150) NOT NULL,
    description NVARCHAR(MAX),
    visibility NVARCHAR(20)  NOT NULL DEFAULT 'private',
    cover_img_url NVARCHAR(500),
    created_at DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    owner_id INT NOT NULL,

    CHECK (visibility IN ('private', 'public')),

    FOREIGN KEY (owner_id) REFERENCES Users(user_id)
);
GO

CREATE TABLE Tag (
    tag_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100) NOT NULL UNIQUE
);
GO

CREATE TABLE UniverseTag (
    universe_id INT NOT NULL,
    tag_id INT NOT NULL,

    PRIMARY KEY (universe_id, tag_id),

    FOREIGN KEY (universe_id) REFERENCES Universe(universe_id),
    FOREIGN KEY (tag_id) REFERENCES Tag(tag_id)
);
GO

CREATE TABLE Species (
    species_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    universe_id INT NOT NULL,
    description NVARCHAR(MAX),

    FOREIGN KEY (universe_id) REFERENCES Universe(universe_id)
);
GO

CREATE TABLE Location (
    location_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(150) NOT NULL,
    description NVARCHAR(MAX),
    main_img_url NVARCHAR(500),
    created_at DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    universe_id INT NOT NULL,

    FOREIGN KEY (universe_id) REFERENCES Universe(universe_id)
);
GO

CREATE TABLE Characters (
    character_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(150) NOT NULL,
    gender NVARCHAR(30),
    description NVARCHAR(MAX),
    main_img_url NVARCHAR(500),
    created_at DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    universe_id INT NOT NULL,
    species_id INT,

    FOREIGN KEY (universe_id) REFERENCES Universe(universe_id),
    FOREIGN KEY (species_id)  REFERENCES Species(species_id)
);
GO

CREATE TABLE CharacterRelationship (
    relationship_id INT IDENTITY(1,1) PRIMARY KEY,
    character_id_1  INT NOT NULL,
    character_id_2  INT NOT NULL,
    relation_type   NVARCHAR(100) NOT NULL,

    CHECK (character_id_1 <> character_id_2),

    FOREIGN KEY (character_id_1) REFERENCES Characters(character_id),
    FOREIGN KEY (character_id_2) REFERENCES Characters(character_id)
);
GO

CREATE TABLE StorySegment (
    segment_id INT IDENTITY(1,1) PRIMARY KEY,
    title NVARCHAR(200) NOT NULL,
    content NVARCHAR(MAX),
    created_at DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    order_index INT NOT NULL,
    universe_id INT NOT NULL,

    UNIQUE (universe_id, order_index),

    FOREIGN KEY (universe_id) REFERENCES Universe(universe_id)
);
GO

CREATE TABLE CharacterStorySegment (
    character_id INT NOT NULL,
    segment_id INT NOT NULL,

    PRIMARY KEY (character_id, segment_id),

    FOREIGN KEY (character_id) REFERENCES Characters(character_id),
    FOREIGN KEY (segment_id)   REFERENCES StorySegment(segment_id)
);
GO

CREATE TABLE StorySegmentLocation (
    segment_id INT NOT NULL,
    location_id INT NOT NULL,

    PRIMARY KEY (segment_id, location_id),

    FOREIGN KEY (segment_id)  REFERENCES StorySegment(segment_id),
    FOREIGN KEY (location_id) REFERENCES Location(location_id)
);
GO

CREATE TABLE Review (
    review_id INT IDENTITY(1,1) PRIMARY KEY,
    text NVARCHAR(MAX),
    rating TINYINT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    created_at DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    user_id INT NOT NULL,
    universe_id INT NOT NULL,

    UNIQUE (user_id, universe_id),

    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (universe_id) REFERENCES Universe(universe_id)
);
GO

CREATE TABLE Album (
    album_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(150) NOT NULL,
    description NVARCHAR(MAX),
    created_at DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    universe_id INT NOT NULL,

    FOREIGN KEY (universe_id) REFERENCES Universe(universe_id)
);
GO

CREATE TABLE WorldImage (
    image_id INT IDENTITY(1,1) PRIMARY KEY,
    img_url NVARCHAR(500) NOT NULL,
    description NVARCHAR(MAX),
    created_at DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    album_id INT NOT NULL,

    FOREIGN KEY (album_id) REFERENCES Album(album_id)
);
GO

CREATE TABLE StorySegmentWorldImage (
    segment_id INT NOT NULL,
    image_id INT NOT NULL,

    PRIMARY KEY (segment_id, image_id),

    FOREIGN KEY (segment_id) REFERENCES StorySegment(segment_id),
    FOREIGN KEY (image_id) REFERENCES WorldImage(image_id)
);
GO

CREATE TABLE FavoriteUniverse (
    user_id INT NOT NULL,
    universe_id INT NOT NULL,
    created_at DATETIME2 NOT NULL DEFAULT SYSDATETIME(),

    PRIMARY KEY (user_id, universe_id),

    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (universe_id) REFERENCES Universe(universe_id)
);
GO

INSERT INTO Role (name)
VALUES
('Admin'),
('User');
GO