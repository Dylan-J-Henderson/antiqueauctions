/*
	Document    : antique_auctions
    Created on  : 21 Mar 2022, 10:37:04 PM
    Author      : Dylan Henderson

    Description :
    The purpose of this script is to create a database for an online auction website.
	The database contains information about the users who register with the website,
	product details, and bid information.
*/

USE master
GO

CREATE DATABASE antique_auctions
GO

USE antique_auctions
GO

--This table contains information about the users who register with the website.
CREATE TABLE user_ (
	id INT NOT NULL PRIMARY KEY IDENTITY,
	first_name NCHAR(50) NOT NULL,
	last_name NCHAR(50) NOT NULL,
	email NCHAR(50) NOT NULL UNIQUE,
	username NCHAR(20) NOT NULL UNIQUE,
	password_ NCHAR(20) NOT NULL UNIQUE,
	security_question_1 TINYINT NOT NULL,
	answer_1 NCHAR(300) NOT NULL,
	security_question_2 TINYINT NOT NULL,
	answer_2 NCHAR(300) NOT NULL,
	security_question_3 TINYINT NOT NULL,
	answer_3 NCHAR(300) NOT NULL,
	country NCHAR(20) NOT NULL DEFAULT 'US',
	street_address NCHAR(50) NOT NULL,
	city NCHAR(50) NOT NULL,
	state_ NCHAR(50) NOT NULL,
	zip NCHAR(10) NOT NULL
)
GO

--This table contains information about the products listed on the website.
CREATE TABLE product (
	id INT NOT NULL PRIMARY KEY IDENTITY,
	title NCHAR(100) NOT NULL,
	description_ NCHAR(1000) NOT NULL,
	--The relative url to the photo of the product.
	photo_url NCHAR(20) NULL,					
	starting_bid MONEY NOT NULL DEFAULT 1,
	closing_date SMALLDATETIME NOT NULL,
	lister_id INT NOT NULL REFERENCES user_ (id)
)
GO

--This table contains information about each user's bid.
CREATE TABLE bid (
	bidder_id INT NOT NULL REFERENCES user_ (id) ON DELETE CASCADE,
	product_id INT NOT NULL REFERENCES product (id) ON DELETE CASCADE,
	bid MONEY NOT NULL,
	PRIMARY KEY (bidder_id, product_id)
)
GO