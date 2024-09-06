SELECT * FROM housing_database.student;

-- Query 1
-- Retrives students with specialneeds, along with thier Room and Advisor's informartion
Select s.BannerNumber, S.FirstName, S.LastName, s.SpecialNeeds, s.CurrentStatus, 
Concat(a.FirstName, ' ' , a.LastName) AS AdvisorName,
r.RoomType, r.PlaceNumber, r.RoomNumber
From Student s JOIN Room r on s.PlaceNumber = r.PlaceNumber
Join Advisor a ON s.AdvisorID = a.AdvisorID
where s.SpecialNeeds != 'None';

-- Query2 
-- Retrieves apartmemts with more thyan 2 rooms along with students info 
SELECT s.BannerNumber, s.FirstName, s.LastName, s.PlaceNumber,
sa.ApartmentNumber, sa.NumberOfRooms
From Student s Join Room r On s.PlaceNumber = r.PlaceNumber
Join StudentApartment sa ON r.ApartmentNumber = sa.ApartmentNumber
where  sa.NumberOfRooms >2;


-- Query3
-- Retrieve students whose Next of kin are their parents.
Select s.BannerNumber, Concat(s.FirstName, ' ',  s.LastName) AS StudentName, 
n.NextofKinID, concat(n.FirstName, ' ', n.LastName) AS NextOfKinName, n.Relationship
from Student s Join NextOfKin n 
ON s.NextofKinID = n.NextOfKinID
where n.Relationship = 'Mother' or n.Relationship = 'Father';

-- Query4
-- Retrieve info about residence staff with rooms they are assign to along with their position and location 
Select r.RoomNumber, r.PlaceNumber, r.MonthlyRent,
rs.FirstName, rs.LastName, rs.Position, rs.Location
From Room r Join ResidenceStaff rs
ON r.staffNumber = rs.StaffNumber;

-- Query5
-- Show apartments which issues found during inspection, along with staff info who conducted the inspection
SELECT i.InspectionDate, i.StaffNumber, CONCAT(s.FirstName, ' ', s.LastName) AS StaffName,
CONCAT(i.StudentFirstName, ' ', i.StudentLastName) AS StudentName,
 i.ApartmentNumber, i.Satisfactory, i.Comments
FROM  Inspection i
JOIN ResidenceStaff s ON i.StaffNumber = s.StaffNumber
WHERE i.Satisfactory = 'NO';

-- Rent report for apartment 
-- Select s.BannerNumber, Concat(s.FirstName, ' ',  s.LastName) AS StudentName, s.PlaceNumber,
-- r.RoomNumber, r.MonthlyRent, 
-- l.Duration, 
-- i.PaymentDue AS TotalPayment
-- From Student s Join Room r ON s.PlaceNumber = r.PlaceNumber
-- JOIN Lease l on s.LeaseNumber = l.LeaseNumber 
-- Join Invoice i ON s. BannerNumber = i.BannerNumber;

# Module 5
# Query 1: Get all students banner number, name, special needs, and comments.
# additionally pull Advisor name and the type of room they are staying in, and place number
SELECT s.BannerNumber, CONCAT(s.LastName, ', ' , s.FirstName) AS StudentName, s.SpecialNeeds, s.Comments,
CONCAT(a.LastName, ', ' , a.FirstName) AS AdvisorName,
r.RoomType, r.PlaceNumber
FROM Student s
JOIN Room r ON s.PlaceNumber = r.PlaceNumber
JOIN Advisor a ON s.AdvisorID = a.AdvisorID;

# Query 2:
SELECT i.InspectionDate, CONCAT(r.FirstName, ' ', r.LastName) AS StaffName,
CONCAT(i.StudentFirstName, ' ', i.StudentLastName) AS StudentName,
 i.ApartmentNumber, i.Satisfactory, i.Comments
FROM Inspection i
JOIN ResidenceStaff r ON i.StaffNumber = r.StaffNumber
WHERE i.Comments = "Minor cleaning required."
AND i.InspectionDate = "2024-08-16";

# Query 3:
SELECT s.BannerNumber, CONCAT(s.FirstName, ' ', s.LastName) AS StudentName, s.Nationality,
kin.Relationship AS KinRelationship, CONCAT(kin.FirstName, ' ', kin.LastName) AS NextOfKinName,
CONCAT(rs.FirstName, ' ', rs.LastName) AS ResidentStaffName
FROM Student s
JOIN NextOfKin kin ON kin.NextOfKinID = s.NextOfKinID
JOIN ResidenceStaff rs ON rs.LastName = kin.LastName;

# Query 4
SELECT s.BannerNumber, s.FirstName, s.LastName, s.CityName, s.Zip, kin.FirstName, kin.LastName, kin.CityName, kin.Zip
FROM Student s
JOIN NextOfKin kin ON kin.NextOfKinID = s.NextOfKinID
WHERE s.CityName != kin.CityName;
