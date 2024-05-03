---SQL FULL OUTER JOIN
/* In theory, a full outer join is the combination of a LEFT JOIN and a RIGHT JOIN. The full outer join includes
all rows from the joined tables whether or not the other table has the matching row.

If the rows in the joined tables do not match, the result set of the full outer join contains NULL values for every 
column of the table that lacks a matching row. For the matching rows, a single row that has the columns populated from the joined
table is included in the result set.
*/

/* SELECT column_list
	FROM A
	FULL OUTER JOIN B ON B.n = A.n;
Note: the OUTER keyword is optional
*/

--Example: Let create two new tables: baskets and fruits

CREATE TABLE fruits (
	fruit_id INTEGER PRIMARY KEY,
	fruit_name VARCHAR (255) NOT NULL,
	basket_id INTEGER
);

CREATE TABLE baskets (
	basket_id INTEGER PRIMARY KEY,
	basket_name VARCHAR (255) NOT NULL
);

---Populate

INSERT INTO baskets (basket_id, basket_name)
VALUES (1, 'A'),
		(2, 'B'),
		(3, 'C');

INSERT INTO fruits (
		fruit_id, 
		fruit_name,
		basket_id
)

VALUES
	(1, 'Apple', 1),
	(2, 'Banana', 1),
	(3, 'Strawberry', 2),
	(4, 'Cherry', NULL);

SELECT * FROM fruits
select * from baskets

---RETURN each fruit that is in a basket and each basket that has a fruit,
--but also return each fruit that is not in a basket and each basket that doesn't have any fruit.

SELECT 
	basket_name,
	fruit_name
FROM
	fruits
FULL OUTER JOIN baskets ON baskets.basket_id = fruits.fruit_id;

---To get a specfic information, you can add a WHERE clause to the statement that uses the
--FULL OUTER JOIN claus.

---Find any basket, which does not store any fruit.

SELECT
	basket_name,
	fruit_name
FROM
	fruits
FULL OUTER JOIN baskets ON baskets.basket_id = fruits.basket_id
WHERE 
	fruit_name IS NULL;

---SIMILARLY, let check which fruit is not in any basket

SELECT 
	basket_name,
	fruit_name
FROM
	fruits
FULL OUTER JOIN baskets ON baskets.basket_id = fruits.basket_id
WHERE
	basket_name IS NULL;