Create database Booklists
Use Booklists
Create table Authors
(
Id int primary key identity,
Name nvarchar(100) not null,
Surname nvarchar(100) not null
)
Create table Books
(
Id int primary key identity,
Name nvarchar(100)not null check (Len(Name)Between 2 and 100),
PageCount int check(PageCount >=10),
AuthorId int references Authors(Id)
)
Insert into Authors values
('Eli','Veliyev'),
('Huseyn','Quliyev'),
('Ceyhun','Eliyev')
Insert into Books values
('Mocuze',200,1),
('Ali ve Nino',150,1),
('Siyaset',300,1)

Create view BookInfo
as
Select b.Id, b.Name, b.PageCount,a.Name + ' ' + a.Surname AS AuthorFullName
From Books b
Join Authors a 
On 
b.AuthorId = a.Id

Select * from Books

Create view AuthorInfo as
Select a.Id AS AuthorId,a.Name + ' ' + a.Surname AS AuthorFullName,
Count(b.Id) AS BooksCount,
Max(b.PageCount) AS MaxPageCount
FROM Authors a
Left join Books b On a.Id = b.AuthorId
Group by a.Id, a.Name, a.Surname