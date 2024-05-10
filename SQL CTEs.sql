/* CTE in SQL */

---syntax

/* WITH cte_name (column1, column2, ...) AS (
    -- CTE query definition
    SELECT column1, column2, ...
    FROM table_name
    WHERE condition
)
-- Main query using the CTE
SELECT *
FROM cte_name;
*/

SELECT * FROM employees;

---1st use case caculate avg_salary of each department using CTE.
---Solution

WITH Departmentavgsalary AS (
	SELECT
		department_id,
		AVG(salary) AS avg_salary
	FROM
		employees
	GROUP BY
		department_id
)
SELECT
	e.employee_id,
	e.first_name +' '+ e.last_name AS Emp_Name,
	e.salary,
	dsa.avg_salary AS department_avg_salary
FROM
	employees e
INNER JOIN
	Departmentavgsalary dsa ON e.department_id = dsa.department_id
ORDER BY
	Emp_Name;


SELECT * FROM employees;
	
---2nd use case: find employees who is reporting to another employees.

WITH RecursiveEmployeeHierachy AS (
	SELECT
		employee_id,
		first_name,
		last_name,
		manager_id,
		0 AS depth
	FROM
		employees
	WHERE	
		manager_id IS NULL
	UNION ALL

	SELECT
	e.employee_id,
	e.first_name,
	e.last_name,
	e.manager_id,
	reh.depth + 1 AS depth
	FROM
	employees e 
	INNER JOIN	
	RecursiveEmployeeHierachy reh ON e.manager_id = reh.employee_id
)
SELECT
	employee_id,
	first_name,
	last_name,
	manager_id,
	depth
FROM
	RecursiveEmployeeHierachy
ORDER BY
	depth,
	last_name,
	first_name;

---3rd use case;
---Ranking Employees by Salary within Departments
---Solution

WITH RankedEmployees AS (
	SELECT
		employee_id,
		first_name,
		last_name,
		department_id,
		salary,
		ROW_NUMBER()
		OVER(PARTITION BY 
			department_id 
		ORDER BY 
			salary DESC) AS salary_rank
		FROM
			employees
		)
SELECT
	employee_id,
	first_name,
	last_name,
	department_id,
	salary,
	salary_rank
FROM
	RankedEmployees
ORDER BY
	department_id,
	salary_rank;