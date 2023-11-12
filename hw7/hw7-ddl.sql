# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS peopleroles;
# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills (
    skills_id int NOT NULL,
    skills_name varchar(256) NOT NULL,
    skills_description varchar(4096) NOT NULL,
    skills_tag varchar(4096) NOT NULL,
    skills_url varchar(256),
    skills_time_commitment varchar(4096),
    PRIMARY KEY (skills_id)
);

# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills (skills_id, skills_name, skills_description, skills_tag) values
    (1, 'Karate', 'Capable of Recreating the Skills of Bruce Lee', 'Skill 1'),
    (2, 'Cooking', 'Able to not Burn Food', 'Skill 2'),
    (3, 'Sleeping', 'Able to Sleep in any Situation', 'Skill 3'),
    (4, 'Coding', 'Able to Code in Every Language', 'Skill 4'),
    (5, 'Tight-Rope Walking', 'Able to Keep Balance on a Thin Line of Wire', 'Skill 5'),
    (6, 'Biking', 'Biking Faster than Usain Bolts', 'Skill 6'),
    (7, 'Sewing', 'Can fix any Ripped Jeans', 'Skill 7'),
    (8, 'Public Speaking', 'Amazing Voice', 'Skill 8');

# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    people_id int NOT NULL,
    people_first_name varchar(256),
    people_last_name varchar(256) NOT NULL,
    people_email varchar(256),
    people_linkedin_url varchar(256),
    people_headshot_url varchar(256),
    people_discord_handle  varchar(256),
    people_brief_bio varchar(4096),
    people_date_joined varchar(256) NOT NULL,
    PRIMARY KEY (people_id)
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

insert into people (people_id, people_first_name,people_last_name, people_email,people_linkedin_url, 
people_headshot_url, people_discord_handle, people_brief_bio, people_date_joined ) 
values (1,'John', 'Person 1', 'John@gmail.com', 'https://www.linkedin.com/in/John', 
'headshot.com/John', 'discordapp.com/users/John', 'Bio of John', '1/1/23' ),
(2,'Bob', 'Person 2', 'Bob@gmail.com', 'https://www.linkedin.com/in/Bob', 
'headshot.com/Bob', 'discordapp.com/users/Bob', 'Bio of Bob', '2/1/23' ),
(3,'Mary', 'Person 3', 'Mary@gmail.com', 'https://www.linkedin.com/in/Mary', 
'headshot.com/Mary', 'discordapp.com/users/Mary', 'Bio of Mary', '3/1/23' ),
(4,'Susan', 'Person 4', 'Susan@gmail.com', 'https://www.linkedin.com/in/Susan', 
'headshot.com/Susan', 'discordapp.com/users/Susan', 'Bio of Susan', '4/1/23' ),
(5,'Joe', 'Person 5', 'Joe@gmail.com', 'https://www.linkedin.com/in/Joe', 
'headshot.com/Joe', 'discordapp.com/users/Joe', 'Bio of Joe', '5/1/23' ),
(6,'Alan', 'Person 6', 'Alan@gmail.com', 'https://www.linkedin.com/in/Alan', 
'headshot.com/Alan', 'discordapp.com/users/Alan', 'Bio of Alan', '6/1/23' ),
(7,'Alex', 'Person 7', 'Alex@gmail.com', 'https://www.linkedin.com/in/Alex', 
'headshot.com/Alex', 'discordapp.com/users/Alex', 'Bio of Alex', '7/1/23' ),
(8,'Henry', 'Person 8', 'Henry@gmail.com', 'https://www.linkedin.com/in/Henry', 
'headshot.com/Henry', 'discordapp.com/users/Henry', 'Bio of Henry', '8/1/23' ),
(9,'Peter', 'Person 9', 'Peter@gmail.com', 'https://www.linkedin.com/in/Peter', 
'headshot.com/Peter', 'discordapp.com/users/Peter', 'Bio of Peter', '9/1/23' ),
(10,'Chase', 'Person 10', 'Chase@gmail.com', 'https://www.linkedin.com/in/Chase', 
'headshot.com/Chase', 'discordapp.com/users/Chase', 'Bio of Chase', '10/1/23' );


# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE peopleskills (
    id int AUTO_INCREMENT,
    skills_id int,
    people_id int,
    date_acquired date default (current_date),
    PRIMARY KEY (id),
    foreign key (skills_id) references skills (skills_id) on delete cascade,
    foreign key (people_id) references people (people_id),
    unique (skills_id, people_id)
);

# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.
 
insert into peopleskills(people_id, skills_id) values
    (1,1),
    (1,3),
    (1,6),
    (2,3),
    (2,4),
    (2,5),
    (3,1),
    (3,5),
    (5,3),
    (5,6),
    (6,2),
    (6,3),
    (6,4),
    (7,3),
    (7,5),
    (7,6),
    (8,1),
    (8,3),
    (8,5),
    (8,6),
    (9,2),
    (9,5),
    (9,6),
    (10,1),
    (10,4),
    (10,5);

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles (
    id int auto_increment,
    name varchar(255),
    sort_priority int,
    PRIMARY KEY (id)
);

# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

insert into roles(name, sort_priority) values
    ('Designer', 10),
    ("Developer", 20),
    ('Recruit', 30),
    ('Team Lead', 40),
    ('Boss', 50),
    ('Mentor', 60);


# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles (
    id int AUTO_INCREMENT,
    people_id int,
    role_id int,
    date_assigned date default (current_date),
    PRIMARY KEY (id),
    foreign key (people_id) references people (people_id),
    foreign key (role_id) references roles (id)

);


# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

insert into peopleroles(people_id, role_id) values
    (1,2),
    (2,5),
    (2,6),
    (3,2),
    (3,4),
    (4,3),
    (5,3),
    (6,2),
    (6,1),
    (7,1),
    (8,1),
    (8,4),
    (9,2),
    (10,2),
    (10,1);