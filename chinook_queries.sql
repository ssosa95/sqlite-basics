List all tracks with their album name — you will need to JOIN Track and Album:
SELECT t.name, a.Title
FROM Album a
INNER JOIN Track t ON t.AlbumId = a.AlbumId;

List all albums with their artist name:
SELECT ar.Name, a.Title
FROM Album a
INNER JOIN Artist ar ON ar.ArtistId = a.ArtistId;

List all tracks with their genre name and media type:
SELECT t.Name, g.Name, mt.Name
FROM Track t
INNER JOIN Genre g ON t.GenreId = g.GenreId
INNER JOIN MediaType mt ON t.MediaTypeId = mt.MediaTypeId;
How many tracks does each genre have? Order by count descending:

SELECT g.Name, t.GenreId, COUNT(*) as total
FROM Track t
INNER JOIN Genre g ON g.GenreId = t.GenreId
GROUP BY g.Name
ORDER BY total DESC;

Which artist has the most albums?
SELECT ar.Name, a.ArtistId, COUNT(*) as total
FROM Album a
INNER JOIN Artist ar ON ar.ArtistId = a.ArtistId
GROUP BY ar.Name
ORDER BY total DESC
LIMIT 1;

List all invoices with the customers first and last name: 
SELECT i.InvoiceId, i.InvoiceDate, i.Total, c.FirstName, c.LastName
FROM Invoice i
INNER JOIN Customer c ON i.CustomerId = c.CustomerId;

What is the total revenue per country?
SELECT BillingCountry, SUM(Total) AS total_revenue
FROM Invoice
GROUP BY BillingCountry;

OR

SELECT c.Country, SUM(i.Total) AS total_revenue
FROM Invoice i
INNER JOIN Customer c ON i.CustomerId = c.CustomerId
GROUP BY c.Country;
