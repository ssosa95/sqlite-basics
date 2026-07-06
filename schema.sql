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