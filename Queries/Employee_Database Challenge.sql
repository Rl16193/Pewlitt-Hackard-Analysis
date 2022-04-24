-- Create table for retiring employees
SELECT e.emp_no, e.first_name, e.last_name, title.title, title.from_date, title.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN title ON e.emp_no = title.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY title.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (re.emp_no) re.emp_no, re.first_name, re.last_name, re.title
INTO unique_titles
FROM retirement_titles AS re
WHERE re.to_date = '9999-01-01'
ORDER BY re.emp_no, re.to_date DESC;

-- Create table showing number of retiring employess per department
SELECT COUNT(emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT DESC;


-- Create table for mentorship eligible employees
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date,
de.from_date, de.to_date, title.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dep_employee AS de ON e.emp_no = de.emp_no
INNER JOIN title ON e.emp_no = title.emp_no
WHERE de.to_date = '9999-01-01'
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;