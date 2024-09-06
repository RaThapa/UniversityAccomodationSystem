# Module 5
# Query 1: Get all students banner number, name, special needs, and comments.
# additionally pull Advisor name and the type of room they are staying in, and place number
SELECT s.BannerNumber, CONCAT(s.LastName, ', ' , s.FirstName) AS StudentName, s.SpecialNeeds, s.Comments,
r.RoomType, r.MonthlyRent, r.PlaceNumber
FROM Student s
JOIN Room r ON s.PlaceNumber = r.PlaceNumber;

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
SELECT s.BannerNumber, CONCAT(s.FirstName, ' ', s.LastName) AS StudentName, s.CityName, s.Zip,
kin.Relationship, CONCAT(kin.FirstName, ' ', kin.LastName) AS NextOfKinName, kin.CityName, kin.Zip
FROM Student s
JOIN NextOfKin kin ON kin.NextOfKinID = s.NextOfKinID
WHERE s.CityName != kin.CityName;

# Query 5
SELECT rm.RoomType,
CONCAT(s.FirstName, ' ', s.LastName) AS StudentName, s.StreetName AS StudentStreet, s.Gender,
CONCAT(rs.FirstName, ' ', rs.LastName) AS StaffName, rs.StreetName AS StaffStreet, rs.Gender
FROM Student s
JOIN Room rm ON rm.PlaceNumber = s.PlaceNumber
JOIN ResidenceStaff rs ON rs.StaffNumber = rm.StaffNumber
WHERE s.Gender = rs.Gender;