CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    name TEXT,
    role TEXT,
    active INTEGER
);


CREATE TABLE servers (
    id INTEGER PRIMARY KEY,
    hostname TEXT,
    ip_address TEXT,
    os TEXT,
    status TEXT
);

SELECT * FROM users WHERE active = 1
SELECT name, role FROM users
SELECT * FROM users WHERE role LIKE "%manager%" # % on either side queries if "manager" is in any part of the word


# 1. Select only the `name` and `role` columns from `users: 
SELECT name, role FROM users`
2. Select all active users: 
SELECT * FROM users where active = 1
3. Select all inactive users: 
SELECT * FROM users where active = 0
4. Select all servers that are not online: 
SELECT * FROM servers WHERE status != "online";
5. Select all servers running Linux: 
SELECT * FROM servers WHERE os = "Linux";
6. Select all users whose role contains the word "manager" — think about which operator handles partial text matches: 
SELECT * FROM users WHERE role LIKE "%manager%"

Which servers are currently available:
SELECT * FROM servers WHERE status = "online";
Which users need their accounts reviewed:
SELECT * FROM users WHERE active = 0;
Which servers might need attention:
SELECT * FROM servers WHERE status != "online";
Are there any servers not running Windows?
SELECT * FROM servers WHERE os != "Windows";

Who are the first 3 users alphabetically that are active? 
SELECT * FROM users WHERE active = 1 ORDER BY name LIMIT 3;
What are the last 2 servers added to the database? 
SELECT * FROM servers ORDER BY id DESC LIMIT 2;
If you were paginating users 3 at a time, what would page 2 look like? 
SELECT * FROM users LIMIT 3 OFFSET 3

* Return all users ordered alphabetically by name: 
SELECT * FROM users ORDER BY name;
* Return all users ordered by `active` — inactive users first: 
SELECT * FROM users ORDER BY active ASC;
* Return the first 3 servers alphabetically by hostname: 
SELECT * FROM servers ORDER BY hostname LIMIT 3;
* Return all servers ordered by status — think about what alphabetical ordering does to "maintenance", "offline", "online": 
SELECT * FROM servers ORDER BY status;
* Return the most recently added user — think about which column tells you insertion order and which direction to sort:  
SELECT * FROM users ORDER BY id DESC LIMIT 1;


ALTER TABLE servers ADD COLUMN assigned_to INTEGER;

A good rule of thumb — if the question says "with their [something]", that implies a match must exist, 
which points to INNER JOIN. 
If the question says "and show whether they have [something]", that points to LEFT JOIN.
INNER JOIN implies there is a match in both tables, while LEFT JOIN implies there may not be a match in the right table.

1. List all servers with their assigned users name and role using INNER JOIN: SELECT s.hostname, u.name, u.role
FROM servers s
INNER JOIN users u ON s.assigned_to = u.id;
2. List all servers using LEFT JOIN — observe which one shows NULL: SELECT s.hostname, u.name, u.role
FROM servers s
LEFT JOIN users u ON s.assigned_to = u.id;
3. Find unassigned servers — use a LEFT JOIN with a WHERE clause that filters for NULL. Hint: WHERE u.id IS NULL: 
SELECT s.hostname, u.name, u.role
FROM servers s
LEFT JOIN users u ON s.assigned_to = u.id WHERE u.id IS NULL;
4. List only online servers with their assigned user:  SELECT s.hostname, u.name, u.role, s.status
FROM servers s
LEFT JOIN users u ON s.assigned_to = u.id WHERE s.status = "online";

* Which user is responsible for the most servers? SELECT s.hostname, u.name, u.role, u.active
FROM servers s
INNER JOIN users u ON s.assigned_to = u.id
ORDER BY name;
# Need GROUP BY and COUNT to find the user with the most servers assigned. Day 19***
* Are there any servers with no assigned admin? 
SELECT s.hostname, u.name, u.role FROM servers s 
LEFT JOIN users u ON s.assigned_to = u.id WHERE u.id IS NULL;
* Which active users have servers assigned to them? 
SELECT s.hostname, u.name, u.role, u.active
FROM servers s
INNER JOIN users u ON s.assigned_to = u.id WHERE u.active = 1;


* Count how many users are active vs inactive — you should get two rows back: SELECT active, COUNT(*) AS total
FROM users
GROUP BY active;
* Count how many servers are in each status group: SELECT status, COUNT(*) AS total
FROM servers
GROUP BY status;
* Count how many servers each OS has: SELECT os, COUNT(*) AS total
FROM servers
GROUP BY os;
* List each user with a count of how many servers they are assigned to — include users with zero servers. Hint: which JOIN type keeps all users regardless of whether they have servers? SELECT u.name, COUNT(s.id) AS server_count
FROM users u
LEFT JOIN servers s ON s.assigned_to = u.id
GROUP BY u.id
ORDER BY server_count DESC;
* Find any roles that have more than one user — use HAVING: SELECT role, COUNT(*) AS total
FROM users
GROUP BY role
HAVING total > 1;

