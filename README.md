# Employee Management System

## Overview
The Employee Management System is a relational database project designed to manage employee information within an organization. This system utilizes PostgreSQL to create and maintain tables for departments, employee titles, employee details, department assignments, salaries, and department managers. The provided SQL scripts demonstrate the creation of tables, database constraints, and various queries to retrieve employee data based on specific criteria.

## Database Schema

### Tables
1.	departments
** deptno: Department number (Primary Key)
** deptname: Department name
2.	titles
** titleid: Title ID (Primary Key)
** title: Employee title
3.	employees
** empno: Employee number (Primary Key)
** emptitleid: Employee title ID (Foreign Key)
** birthdate: Employee birth date
** firstname: Employee first name
** lastname: Employee last name
** sex: Employee gender
** hiredate: Employee hire date
4.	deptemp
** empno: Employee number (Foreign Key)
** deptno: Department number (Foreign Key)
** Primary Key: (empno, deptno)
5.	deptmanager
** deptno: Department number (Foreign Key)
** empno: Employee number (Foreign Key)
** Primary Key: (empno, deptno)
6.	salaries
** empno: Employee number (Foreign Key)
** salary: Employee salary
  	
## Setup and Configuration
1.	Database Initialization - Execute the provided SQL scripts to create the necessary tables and set up the database schema. Ensure that the PostgreSQL server is running and accessible before executing the scripts.
2.	Date Format Configuration - The date format for the database is set to "ISO, MDY" to maintain consistency in date representations across queries.

## Sample Queries
### Retrieve Employee Details
**List all employees with their last name, first name, and salary: Use this query to list all employees along with their last name, first name, and salary.
**List employees hired in 1986 with their first name, last name, and hire date
This query retrieves employees hired in the year 1986, displaying their first name, last name, and hire date.
**List the manager of each department with their department number, department name, employee number, last name, and first name
Use this query to identify the manager of each department, displaying their department number, department name, employee number, last name, and first name.
**List the frequency counts of all employee last names in descending order
This query provides the frequency counts of all employee last names, sorted in descending order.

# Conclusion
The Employee Management System provides a structured approach to manage employee data effectively. With its well-defined schema and comprehensive queries, organizations can efficiently retrieve and analyze employee information based on specific requirements. Whether it's tracking department assignments, managing salaries, or identifying employee demographics, this system offers the flexibility and scalability to adapt to diverse organizational needs.

 # Employee Management System Repo Structure
*EmployeeSQL: contains code and data
** ERD: Entity relational diagram for this dataset
** Query.sql: contains query data for this code 
** Schema.sql: code used to create schema and relate the various datasets
**Data folder: Contains all the data used for this project in the form of a csv

