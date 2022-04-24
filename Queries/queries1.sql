select * from employees;

select first_name,last_name from employees
where birth_date between '1952-01-01'and '1955-12-31';


select first_name,last_name from employees
where birth_date between '1952-01-01'and '1952-12-31';


select first_name,last_name from employees
where birth_date between '1953-01-01'and '1953-12-31';


select first_name,last_name from employees
where birth_date between '1954-01-01'and '1954-12-31';


select first_name,last_name from employees
where birth_date between '1955-01-01'and '1955-12-31';

-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');


SELECT count(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT first_name, last_name, emp_no
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');


SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
de.to_date
INTO current_emp
FROM  retirement_info as ri
LEFT JOIN dep_employee as de ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

select * from employees;

SELECT man.emp_no,man.to_date, dept.dept_name
FROM managers as man
JOIN departments as dept ON man.dept_no = dept.dept_no
WHERE man.to_date = ('9999-01-01');

SELECT COUNT(ce.emp_no),de.dept_no
INTO retiring_emp_department
FROM current_emp as ce
RIGHT JOIN dep_employee as de on ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

SELECT e.emp_no, e.first_name, e.last_name, e.gender, s.salary,e.hire_date, ce.to_date
INTO retirement_info1
from employees as e
left join salaries as s on e.emp_no = s.emp_no
left join current_emp as ce on e.emp_no = ce.emp_no 
where (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
and (ce.to_date = '9999-01-01')
and (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT man.emp_no, man.from_date, man.to_date, dept.dept_name, dept.dept_no, em.first_name, em.last_name
from managers as man
left join departments as dept on dept.dept_no = man.dept_no
left join employees as em on em.emp_no = man.emp_no
where man.to_date = '9999-01-01';

select * from current_emp_departments;

SELECT de.dept_name, ce.emp_no, ce.first_name, ce.last_name, ce.to_date
INTO current_emp_departments
FROM dep_employee AS demp
JOIN current_emp AS ce ON demp.emp_no = ce.emp_no
JOIN departments AS DE ON demp.dept_no = de.dept_no;

SELECT COUNT('emp_no'), dept_name
FROM current_emp_departments
GROUP BY dept_name
ORDER BY dept_name;

select ced.emp_no, ced.first_name, ced.last_name , ced.dept_name
from current_emp_departments as ced
where dept_name in ('Sales','Development')
ORDER BY first_name;


