# Database optimization

## Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Status](#status)
* [Contact](#contact)

## General info
Project created for purpose of "Databases optimization" subject at Gdansk University of Technology

### Report 1: Database project
Please prepare a database design according to your wishes.The project should take into account the future tasks (for Reports 2 and 3). Your database should contain at least two (1:n)-relationships  and at least one (n:m)-relationship.

**Your report should contain:**

* Schema of the database (ER diagram) (and optionally a description).
* Description how the structure is generated.
* Description how the data is generated (minimum points for download from the internet, maximum points for writing code). If you write your own code, please include some part of the program code.
* Description of the statistics of the data.

### Report 2: Tests associated with multithreaded access (20 points)
Please write a program which simulates real traffic in the database. You should test the access to your database with many threads (at least 50). The threads should simulate various aspects of different users
(usual users, administrators, moderators, cashiers ... or other names depending on your project).

Some of the threads should do some breaks to simulate real user behaviour. For example the user enters the cell and during editing the cell is going for a coffee, comes back and finishes with the editing. Of course, you can shorten the time or increase the number topics. Users in a random manner should do tasks like adding, deleting or do some editing to the database.

**Your report should contain:**

* Description of testing plan (for example: different types of users, different numbers of  admins, etc.)
* Description of problem (for example: too many connections, timeout, concurrency, etc.)

### Report 3: Performance tests (25 points)
You should choose 5-10 queries (depending on complexity). Please explain the plan for your queries. You should have big queries (not 5 queries which look like SELECT * FROM TABLE WHERE ID=1). Your queries should have some subqueries, joins, etc.

Please test the performance of the database using the mechanisms available in the database (no manual timing by example). The results should be described. On the basis of the measurements you should propose several ways to solve the problem and present measurements for each of them choosing the best. Make a comparison of the performance before and after optimization.

For each query you should create as much optimization as possible.
You can do this in the following steps.

* Choose a query from your list.
* Create alternatives for this query (e.g. join could be presented as subquery in some cases) and explain your plan.
* Write one or two sentences why this query is not the best one and why the new query is better (or if the first query is best one, then explain why).
* Provide the execution plan for your query. (This is not difficult - see the links in the previous sections: use EXPLAIN or do some clicking in Visual Studio.)
* This you should do for 5 bad queries. So in total you will have 10 queries (5 bad queries and 5 good queries, that are doing the same as the bad queries). 

## Technologies
* **ApexSQL Model** - version 2019.02
* **Microsoft SQL Server 2019** - version 15.0.2000.5
* **SQL Server Management Studio** - version 15.0.18338.0
* **Microsoft Visual Studio Community 2019** - version 16.7.0
* **Microsoft.Data.SqlClient** - version 2.0.0
* **C#** - version 8.0
* **ConsoleTables** - version 2.4.2

## Status
Project is: **in progress**

## Contact
Created by Maciej Niklas

kontakt@mniklas.pl - feel free to contact me!

Check out my blog where I'm posting details about my current projects.

https://www.mniklas.pl/