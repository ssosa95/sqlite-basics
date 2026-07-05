CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    name TEXT,
    role TEXT,
    active INTEGER
);
INSERT INTO users(name, role, active) VALUES 
    ("Samuel", "SysAdmin", 1),
    ("Alex", "engineer", 1),
    ("Jessica", "hr manager", 1),
    ("Linda", "secretary", 1),
    ("Louis", "security guard", 0);

SELECT * FROM users;

CREATE TABLE servers (
    id INTEGER PRIMARY KEY,
    hostname TEXT,
    ip_address TEXT,
    os TEXT,
    status TEXT
);
INSERT INTO servers (hostname, ip_address, os, status) VALUES 
    ("computer-01", "10.10.1.100", "Windows", "online"),
    ("computer-02", "10.10.1.101", "Windows", "offline"),
    ("computer-03", "10.10.1.102", "Linux", "online"),
    ("computer-04", "10.10.1.103", "MacOS", "maintenance");
SELECT * FROM servers;