# CMSC508: HW7 - Resume Database

# Overview
In this assignment, I create Resume Database, which contains skills, employee information, and roles. The database helps manage not only individual skill sets but also aid in finding employees with specific skills and identifying skill gaps within specific roles.

# Table Schema
- skills(id, name, description, tag, url, time_commitment)
- people(id, first_name, last_name, email, linkedin_url, - headshot_url, discord_handle, brief_bio, date_joined)
- peopleskills(id, skills_id, people_id, date_acquired)
- roles(id, name, sort_priority)
- peopleroles(id, people_id, role_id, date_role_acquired)

# General Approach
- Download the repository and set up the environment using Poetry.
- Render the QMD file to view the HTML and scan the entire document.
- Add appropriate key-value pairs to your .env file.
- Create a new DB connection to the provided database folder.
- Run the DDL file against the new database connection 
- Re-render the QMD file, ensuring errors are resolved.
- Complete the DDL file based on the scaffold, creating, dropping, and recreating all database objects.
- Populate the skills, people, peopleskills, roles, and peopleroles tables with sample data as specified.

# Deliverables
- hw7-ddl.sql:
- The DDL file designed to be run and rerun multiple times, dropping and recreating all objects in the database.
- Contains instructions to drop tables, create tables with specified columns, define primary and foreign keys, and populate tables as per the requirements.

# Quarto-Generated HTML Document:
- Overview of the project and a description of the database.
- Crows-foot diagram depicting the entities.
- Listings of entity tables (people, roles, skills).
- A section with subsections containing queries and - results for various scenarios.
- A paragraph reflecting on your experience with the assignment.