CREATE DATABASE moviedb;
USE moviedb;

CREATE TABLE IF NOT EXISTS movies(
		id	VARCHAR(10) PRIMARY KEY NOT NULL,
		title	VARCHAR(100) NOT NULL,
		year	INT NOT NULL,
		director VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS stars(
		id VARCHAR(10) PRIMARY KEY NOT NULL,
		name VARCHAR(100) NOT NULL,
		birthYear INT
);

CREATE TABLE IF NOT EXISTS starts_in_movies(
		sartId VARCHAR(10) NOT NULL,
        movieId VARCHAR(10) NOT NULL,
        FOREIGN KEY (starId) REFERENCES stars(id),
        FOREIGN KEY (movieId) REFERENCES movies(id)
);

CREATE TABLE IF NOT EXISTS genres(
		id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
        name VARCHAR(32) NOT NULL
);

CREATE TABLE IF NOT EXISTS genres_in_movies(
		genreId INT NOT NULL,
        movieId VARCHAR(10),
        FOREIGN KEY (genreId) REFERENCES genres(id),
        FOREIGN KEY (movieId) REFERENCES movies(id)
);

CREATE TABLE IF NOT EXISTS customers(
		id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
        firstName VARCHAR(50) NOT NULL,
        lastName VARCHAR(50) NOT NULL,
        ccId VARCHAR(20) NOT NULL,
        address VARCHAR(200) NOT NULL,
        email VARCHAR(50) NOT NULL,
        password VARCHAR(20),
        FOREIGN KEY (ccId) REFERENCES creditcards(id)
);

CREATE TABLE IF NOT EXISTS sales(
		id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
        customerId INT NOT NULL,
        movieId VARCHAR(10) NOT NULL,
        saleDate DATE NOT NULL,
        FOREIGN KEY (customerId) REFERENCES customers(id),
        FOREIGN KEY (movieId) REFERENCES movies(id)
);

CREATE TABLE IF NOT EXISTS creditcards(
		id VARCHAR(20) PRIMARY KEY NOT NULL, 
        firstName VARCHAR(50) NOT NULL,
        lastName VARCHAR(50) NOT NULL,
        expiration DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS ratings(
		movieId VARCHAR(10) NOT NULL,
        rating FLOAT NOT NULL,
        numVotes INT NOT NULL,
        FOREIGN KEY (movieId) REFERENCES movies(id)
);



        
