INSERT INTO users(name, role, active) VALUES 
    ("Samuel", "SysAdmin", 1),
    ("Alex", "engineer", 1),
    ("Jessica", "hr manager", 1),
    ("Linda", "secretary", 1),
    ("Louis", "security guard", 0),
    ("Eliza", "talent manager", 1),
    ("Damon", "owner", 1),
    ("Kaylee", "analyst", 0);

SELECT * FROM users;

INSERT INTO servers (hostname, ip_address, os, status) VALUES 
    ("computer-01", "10.10.1.100", "Windows", "online"),
    ("computer-02", "10.10.1.101", "Windows", "offline"),
    ("computer-03", "10.10.1.102", "Linux", "online"),
    ("computer-04", "10.10.1.103", "MacOS", "maintenance"),
    ("computer-05", "10.10.1.104", "Linux", "offline"),
    ("computer-06", "10.10.1.105", "Windows", "maintenance"),
    ("computer-07", "10.10.1.106", "Linux", "maintenance");
SELECT * FROM servers;

UPDATE servers SET assigned_to = 1 WHERE id = 1;
UPDATE servers SET assigned_to = 1 WHERE id = 2;
UPDATE servers SET assigned_to = 2 WHERE id = 3;
UPDATE servers SET assigned_to = 3 WHERE id = 4;