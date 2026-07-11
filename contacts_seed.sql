# This is a seed file for the contacts database. It populates the database with initial data for testing and development purposes.

INSERT INTO Company(Name, Industry, Website) VALUES
	("AT&T", "Telecommunications", "att.com"),
	("Verizon", "Telecommunications", "verizon.com"),
	("McDonalds", "Fast Food", "mcdonalds.com"),
	("Mercedes", "Car Sales", "mercedes.com");

INSERT INTO Contact(CompanyId, FirstName, LastName, Email, PhoneNumber) VALUES
	(1, "Michael", "Ryle", "m.ryle1987@gmail.com", "4075658574"),
	(2, "Jesus", "Gonzalez", "j.gonzalex1989@gmail.com", "4075588744"),
	(3, "Luke", "McCormick", "l.mccormick1975@gmail.com", "4074748664"),
	(4, "Richard", "Openda", "r.openda1984@gmail.com", "4074446774"),
	(1, "Xavier", "Martinez", "x.martinez1990@gmail.com", "4072213674"),
	(3, "Kyle", "Smith", "k.smith1987@gmail.com", "4071124875");
	
INSERT INTO Tag(TagName) VALUES
	("Client"),
	("Vendor"),
	("Partner");
	
INSERT INTO Note(ContactId, Note, DATE) VALUES
	(1, "Called to discuss contract renewal, follow up next week.", "30/06/2026"),
    (1, "Sent proposal via email, awaiting response.", "02/07/2026"),
    (2, "Met at industry conference, interested in partnership.", "15/06/2026");
	
INSERT INTO ContactTag(ContactId, TagId) VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 1),
	(5, 3),
	(6, 1);