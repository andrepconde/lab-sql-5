# LAB SQL Queries 5
USE sakila;

#1 Drop column picture
SELECT *
FROM staff;

ALTER TABLE staff
DROP COLUMN picture;

# 2. add tammy sanders to staff and she is a customer
SELECT * 
FROM customer
WHERE first_name = "TAMMY" and last_name = "SANDERS" ;

INSERT INTO staff VALUES (3, "TAMMY", "SANDERS",79,"TAMMY.SANDERS@sakilacustomer.org", 2,1,"Tammy", "anything3554", "2006-03-15 06:57:20");

# 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. 
# You can use current date for the rental_date column in the rental table.
SELECT *
FROM customer
WHERE first_name = 'CHARLOTTE' AND last_name = 'HUNTER'; #customer id 130

SELECT *
FROM rental
ORDER BY rental_id DESC
LIMIT 1;

SELECT * 
FROM film
WHERE title = "ACADEMY DINOSAUR"; # FILM ID 1 

SELECT * 
FROM inventory
WHERE film_id = 1;

# rental id 16050, rental date 2006,02,14, inventory id 1 , customer id 130, return date 16,02,2006, staff id 1, last update 16-02

INSERT INTO rental VALUES (16050, "2006-02-16 01:01:12", 1, 130 , "2006-02-17 01:01:10", 1, "2006-02-17 01:30:30");

SELECT * 
FROM rental
WHERE rental_id = 16050;

# 4.Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, 
# and the date for the users that would be deleted. 

SELECT * # 15 non active
FROM customer
WHERE active = 0;

# create table
CREATE TABLE back_up (
  customer_id int(11) default null,
  store_id int(11) default null,
  first_name text,
  last_name text,
  email text,
  address_id int(11) default null,
  active int(11) default null,
  create_date text,
  last_uptdate text
);

# insert values into the new table
INSERT INTO back_up (customer_id, store_id, first_name, last_name, email, address_id, active, create_date)
SELECT customer_id, first_name,  email
FROM customer
WHERE active = 0;

#check if its right
SELECT * 
FROM back_up;

#remove the non active from the main one
SELECT *
FROM customer
WHERE active = 0;

SET FOREIGN_KEY_CHECKS=0;

DELETE from customer
WHERE active = 0;

SELECT * 
FROM customer
WHERE active = 0;

SELECT *
FROM customer
WHERE active = 0;

SELECT * 
FROM back_up;

# REMOVED! DONE! 
# always keep in mind to be careful in removing data from relational databases