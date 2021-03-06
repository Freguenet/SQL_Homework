-- List of employee number, last name, first name, gender, and salary.
select employees.emp_no,
employees.last_name,
employees.first_name,
employees.gender,
salaries.salary
from employees
INNER JOIN salaries on
employees.emp_no = salaries.emp_no;

-- List employees who were hired in 1986.
select * from employees
where employees.hire_date between '1986-01-01' and '1986-12-31';

-- List the manager of each department with the following information: department number, 
-- department name, the manager's employee number, last name, first name, 
-- and start and end employment dates.
CREATE VIEW Department_Managers AS
(select dept_manager.dept_no,
dept_manager.emp_no,
dept_manager.from_date,
dept_manager.to_date,
departments.dept_name
from dept_manager INNER JOIN departments
on departments.dept_no = dept_manager.dept_no);

select Department_Managers.dept_no,
Department_Managers.dept_name,
Department_Managers.emp_no,
employees.last_name,
employees.first_name,
Department_Managers.from_date,
Department_Managers.to_date
from Department_Managers
INNER JOIN employees on 
Department_Managers.emp_no = employees.emp_no;

-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
CREATE VIEW Employee_no AS (select employees.emp_no,
employees.first_name,
employees.last_name,
dept_emp.dept_no
from employees inner join dept_emp on
employees.emp_no = dept_emp.emp_no);

CREATE VIEW Employee_by_Dept AS (select Employee_no.emp_no,
Employee_no.first_name,
Employee_no.last_name,
departments.dept_name
from Employee_no left join departments on
Employee_no.dept_no = departments.dept_no);
select * from Employee_by_Dept

-- List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees
WHERE employees.first_name = 'Hercules'
AND employees.last_name LIKE 'B%';
 
--  List all employees in the Sales department, including their employee number,
--  last name, first name, and department name.
select * from Employee_by_Dept where 
Employee_by_Dept.dept_name = 'Sales'

-- List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
select * from Employee_by_Dept where 
Employee_by_Dept.dept_name = 'Sales' or Employee_by_Dept.dept_name = 'Development';

-- In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
SELECT employees.last_name, COUNT(employees.last_name) AS "# of Emp with same last name"
FROM employees
GROUP BY employees.last_name
ORDER BY "# of Emp with same last name" DESC;





