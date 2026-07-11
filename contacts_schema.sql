# This is a schema file for the contacts database. It defines the structure of the database, including tables, columns, and relationships between tables.
# Also contains some example queries to demonstrate how to interact with the database.

PRAGMA foreign_keys = ON;
-- Result: 0 rows returned in 4ms
-- At line 3:
CREATE TABLE Company (
	CompanyId INTEGER PRIMARY KEY,
	Name TEXT,
	Industry TEXT,
	Website TEXT
);
-- Result: query executed successfully. Took 3ms
-- At line 10:
CREATE TABLE Contact (
	ContactId INTEGER PRIMARY KEY,
	CompanyId INTEGER,
	FirstName TEXT,
	LastName TEXT,
	Email TEXT,
	PhoneNumber TEXT,
	FOREIGN KEY (CompanyId) REFERENCES Company(CompanyId)
);
-- Result: query executed successfully. Took 0ms
-- At line 20:
CREATE TABLE Note (
	NoteId INTEGER PRIMARY KEY,
	ContactId INTEGER,
	Note TEXT,
	DATE TEXT,
	FOREIGN KEY (ContactId) REFERENCES Contact(ContactId)
);
-- Result: query executed successfully. Took 0ms
-- At line 28:
CREATE TABLE Tag (
	TagId INTEGER PRIMARY KEY,
	TagName TEXT
);
-- Result: query executed successfully. Took 0ms
-- At line 33:
CREATE TABLE ContactTag (
	ContactId INTEGER,
	TagId INTEGER,
	PRIMARY KEY (ContactId, TagId),
	FOREIGN KEY (ContactId) REFERENCES Contact(ContactId),
	FOREIGN KEY (TagId) REFERENCES Tag(TagId)
);

List all contacts with their company name:
SELECT c.FirstName, c.LastName, com.Name 
FROM Contact c
LEFT JOIN Company com ON c.CompanyId = com.CompanyId

List all notes for a specific contact with the date:
SELECT c.FirstName, c.LastName, n.Note, n.DATE
FROM Contact c
INNER JOIN Note n ON c.ContactId = n.ContactId
WHERE c.ContactId = 1;

List all contacts that have the tag "client":
SELECT c.FirstName, c.LastName, t.TagName 
FROM ContactTag ct
LEFT JOIN Tag t ON ct.TagId = t.TagId
LEFT JOIN Contact c ON c.ContactId = ct.ContactId
WHERE t.TagName = "Client";

Which company has the most contacts?
SELECT com.Name, COUNT(c.ContactId) AS total_contacts
FROM Company com
INNER JOIN Contact c ON com.CompanyId = c.CompanyID
GROUP BY com.Name
ORDER BY total_contacts DESC
LIMIT 1;