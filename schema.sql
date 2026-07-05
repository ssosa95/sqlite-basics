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
