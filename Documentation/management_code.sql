-- Create a Database
CREATE DATABASE LibraryManagement;

-- Select the datbase
USE LibraryManagement;

-- Create a table for the authors
create table Authors (
	author_id INT auto_increment
PRIMARY KEY,
	first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
		birthday DATE,
		nationality VARCHAR(100)
	);
    -- Create table for the Categories
CREATE TABLE Categories (
	category_id INT auto_increment PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
    );
    -- Create table for the Books
CREATE TABLE Books (
		book_id INT auto_increment PRIMARY KEY,
		title varchar(255) NOT NULL,
        isbn varchar(13) UNIQUE NOT NULL,
        category_id INT,
        publication_year YEAR,
        copies_available INT DEFAULT 0,
        FOREIGN KEY (category_id)
	REFERENCES Categories(category_id)
    );
    -- Create BooksAuthors
    CREATE TABLE BookAuthors (
		book_id INT,
        author_id INT,
        PRIMARY KEY (book_id, author_id),
        FOREIGN KEY (book_id)
	REFERENCES Books(book_id) ON DELETE CASCADE,
		FOREIGN KEY (author_id)
	REFERENCES Authors(author_id) ON DELETE CASCADE
    );
    -- Insert into Categories (fiction, i.e)
    INSERT INTO Categories
    (category_name) VALUES ('Fiction'),
    ('NonFiction'), ('Science'), ('History'),
    ('Mathmatics'), ('Politics'), ('Design'),
    ('Health'), ('Mystery'), ('ComputerScience'), ('InformationTechnology'),
    ('Finance'), ('Adventure'), ('Religion');
    -- Insert into Authors name
    INSERT INTO Authors (first_name, last_name, nationality) VALUES
    ('George', 'Orwell', 'British'),
    ('William', 'Shotts', 'American');
    -- Insert information about book (isbn, i.e)
INSERT INTO Books (title, isbn, category_id, publication_year,
copies_available)
VALUES
('1984', '9780451524935', 1, 1949, 2),
('The Linux Command Line', '9781593279523', 11, 2019, 1);
    -- Connect authors to their book
INSERT INTO BookAuthors (book_id, author_id)
VALUES
(1, 1), (2, 2);
    
    
