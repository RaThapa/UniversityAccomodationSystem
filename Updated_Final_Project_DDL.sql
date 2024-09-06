-- Creating databases
CREATE DATABASE housing_database; 
USE housing_database;

-- Creating tables
-- Student table 
CREATE TABLE Student (
    BannerNumber INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    StreetName VARCHAR(30), 
    CityName VARCHAR(20), 
    StateName VARCHAR(20),
    Zip INT, 
    CountryCode VARCHAR(10),
    MobilePhoneNumber VARCHAR(20),
    Email VARCHAR(70) UNIQUE,
    DateOfBirth DATE,
    Gender VARCHAR(10),
    Category VARCHAR(50),
    Nationality VARCHAR(50),
    SpecialNeeds TEXT,
    Comments TEXT,
    CurrentStatus VARCHAR(20),
    Major VARCHAR(30),
    Minor VARCHAR(30),
    AdvisorID INT,
    NextOfKinID INT,
    PlaceNumber INT,
    CourseNumber INT,
    LeaseNumber INT
);


-- Advisor table 
CREATE TABLE Advisor (
	FirstName VARCHAR(50), 
    LastName VARCHAR(50), 
    AdvisorID INT PRIMARY KEY,
    Position VARCHAR(50),
    DepartmentName VARCHAR(50),
    InternalPhoneNumber VARCHAR(20),
    Email VARCHAR(70) UNIQUE,
    RoomNumber VARCHAR(30)
);



-- Course table 
CREATE TABLE Course (
    CourseNumber INT PRIMARY KEY,
    CourseTitle VARCHAR(30),
    InstructorFirstName VARCHAR(30),
    InstructorLastName VARCHAR(30),
    InstructorPhoneNumber VARCHAR(20),
    InstructorEmail VARCHAR(70) UNIQUE,
    InstructorRoomNumber INT,
    DepartmentName VARCHAR(50)
);


-- NextOfKin Table
CREATE TABLE NextOfKin (
    NextOfKinID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    StreetName VARCHAR(30), 
    CityName VARCHAR(20), 
    StateName VARCHAR(20),
    Zip INT, 
    CountryCode VARCHAR(10),
    Relationship VARCHAR(50),
    ContactPhoneNumber VARCHAR(30)
);


-- Lease Table
CREATE TABLE Lease (
    LeaseNumber INT PRIMARY KEY,
    Duration VARCHAR(20),
    BannerNumber INT,
    StudentFirstName VARCHAR(20),
    StudentLastName VARCHAR(20),
    PlaceNumber INT,
    RoomNumber VARCHAR(30),
	StreetName VARCHAR(30), 
    CityName VARCHAR(20), 
    StateName VARCHAR(20),
    Zip INT, 
    CountryCode VARCHAR(10),
    StartDate DATE,
    EndDate DATE NULL
);

-- Invoice table 
CREATE TABLE Invoice (
	InvoiceNumber INT PRIMARY KEY,
    Semester VARCHAR(30),
    FirstName VARCHAR(30),
    LastName VARCHAR(30),
    BannerNumber INT,
    PlaceNumber INT,
    RoomNumber VARCHAR(30),
    StreetName VARCHAR(30), 
    CityName VARCHAR(20), 
    StateName VARCHAR(20),
    Zip INT, 
    CountryCode VARCHAR(10),
    PaymentDue DECIMAL(10, 2),
    PaymentMethod VARCHAR(50),
    PaymentDate DATE,
    FirstReminderDate DATE,
    SecondReminderDate DATE 
);

-- Room Table
CREATE TABLE Room (
	PlaceNumber INT PRIMARY KEY,
    RoomNumber VARCHAR(30),
    MonthlyRent DECIMAL(10, 2),
    RoomType VARCHAR(30),
    StaffNumber INT,
    HallId INT,
    ApartmentNumber INT
);

-- Hall of Residence  Table 
CREATE TABLE HallOfResidence (
	HallId INT PRIMARY KEY,
    StreetName VARCHAR(30), 
    CityName VARCHAR(20), 
    StateName VARCHAR(20),
    Zip INT, 
    CountryCode VARCHAR(10),
    MobilePhoneNumber VARCHAR(20)
);


-- StudentApartment Table 
CREATE TABLE StudentApartment (
	ApartmentNumber INT PRIMARY KEY,
    StreetName VARCHAR(30), 
    CityName VARCHAR(20), 
    StateName VARCHAR(20),
    Zip INT, 
    CountryCode VARCHAR(10),
    NumberOfRooms INT
);

-- Inspection Table 
CREATE TABLE Inspection (
	StaffNumber INT,
    StudentFirstName VARCHAR(50),
    StudentLastName VARCHAR(50),
	ApartmentNumber INT,
    InspectionDate DATE,
    Satisfactory VARCHAR(20),
    Comments TEXT
);

-- Residence Staff Table 
CREATE TABLE ResidenceStaff (
	StaffNumber INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(70) UNIQUE, 
    StreetName VARCHAR(30), 
    CityName VARCHAR(20), 
    StateName VARCHAR(20),
    Zip INT, 
    CountryCode VARCHAR(10),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    Position VARCHAR(20),
    Location VARCHAR(20)
);

-- Adding foreign keys references 
-- For Student Table 
-- For advisor Id
ALTER TABLE Student 
ADD CONSTRAINT fk_Student_Advisor_AdvisorID
FOREIGN KEY (AdvisorID)
REFERENCES Advisor(AdvisorID);

-- For NextOfKinId
ALTER TABLE Student 
ADD CONSTRAINT fk_Student_NextOfKin_NextOfKinID
FOREIGN KEY (NextOfKinID)
REFERENCES NextOfKin(NextOfKinID);

-- For PlaceNumebr
ALTER TABLE Student 
ADD CONSTRAINT fk_Student_Room_PlaceNumber
FOREIGN KEY (PlaceNumber)
REFERENCES Room(PlaceNumber);

-- For Course 
ALTER TABLE Student
ADD CONSTRAINT fk_Student_Course_CourseNumber
FOREIGN KEY (CourseNumber)
REFERENCES Course(CourseNumber);

-- For Lease 
ALTER TABLE Student 
ADD CONSTRAINT fk_Student_Lease_LeaseNumber 
FOREIGN KEY (LeaseNumber)
REFERENCES Lease(LeaseNumber);

-- Adding foreign keys references 
-- For Lease Table 
-- For BannerNumber
ALTER TABLE Lease 
ADD CONSTRAINT fk_Lease_Student_BannerNumber 
FOREIGN KEY (BannerNumber) 
REFERENCES Student(BannerNumber);

-- For PlaceNumber
ALTER TABLE Lease
ADD CONSTRAINT fk_Lease_Room_PlaceNumber
FOREIGN KEY (PlaceNumber)
REFERENCES Room(PlaceNumber);

-- Adding foreign keys references 
-- For Invoice Table 
-- For BannerNumber
ALTER TABLE Invoice 
ADD CONSTRAINT fk_Invoice_Student_BannerNumber
FOREIGN KEY (BannerNumber) 
REFERENCES Student(BannerNumber);

-- Adding foreign keys references 
-- For Room Table 
-- For HallId
ALTER TABLE Room
ADD CONSTRAINT fk_Room_HallOfResidence_HallId
FOREIGN KEY (HallId)
REFERENCES HallOfResidence(HallId);

-- For ApartmentNumber
ALTER TABLE Room
ADD CONSTRAINT fk_Room_StudentApartment_ApartmentNumber
FOREIGN KEY (ApartmentNumber)
REFERENCES StudentApartment(ApartmentNumber);

-- For StaffNumber
ALTER TABLE Room
ADD CONSTRAINT fk_Room_ResidenceStaff_StaffNumber
FOREIGN KEY (StaffNumber)
REFERENCES ResidenceStaff(StaffNumber);

-- Adding foreign keys references 
-- For Inspection Table 
-- For ApartmentNumber
ALTER TABLE Inspection
ADD CONSTRAINT fk_Inspection_StudentApartment_ApartmentNumber 
FOREIGN KEY (ApartmentNumber) 
REFERENCES StudentApartment(ApartmentNumber);


-- Inserting values 
-- Advisor Table 
INSERT INTO Advisor (AdvisorID, FirstName, LastName, Position, DepartmentName, InternalPhoneNumber, Email, RoomNumber) VALUES
(1, 'John', 'Doe', 'Professor', 'Computer Science', '1234', 'johndoe@university.edu', '101'),
(2, 'Jane', 'Smith', 'Associate Professor', 'Mathematics', '1235', 'janesmith@university.edu', '102'),
(3, 'Alice', 'Johnson', 'Lecturer', 'Physics', '1236', 'alicejohnson@university.edu', '103'),
(4, 'Bob', 'Brown', 'Senior Lecturer', 'Chemistry', '1237', 'bobbrown@university.edu', '104'),
(5, 'Carol', 'White', 'Assistant Professor', 'Biology', '1238', 'carolwhite@university.edu', '105'),
(6, 'David', 'Black', 'Professor', 'Engineering', '1239', 'davidblack@university.edu', '106'),
(7, 'Eve', 'Green', 'Senior Lecturer', 'Economics', '1240', 'evegreen@university.edu', '107'),
(8, 'Frank', 'Blue', 'Lecturer', 'History', '1241', 'frankblue@university.edu', '108'),
(9, 'Grace', 'Yellow', 'Associate Professor', 'Literature', '1242', 'graceyellow@university.edu', '109'),
(10, 'Hank', 'Purple', 'Professor', 'Philosophy', '1243', 'hankpurple@university.edu', '110');

-- Course Table 
INSERT INTO Course (CourseNumber, CourseTitle, InstructorFirstName, InstructorLastName, InstructorPhoneNumber, InstructorEmail, InstructorRoomNumber, DepartmentName) VALUES
(1, 'Database Systems', 'Alice', 'Johnson', '(710) 234-6789', 'alicejohnson@university.edu', 102, 'Computer Science'),
(2, 'Calculus', 'David', 'Smith', '(669) 345-6790', 'davidsmith@university.edu', 103, 'Mathematics'),
(3, 'Physics 101', 'Robert', 'Brown', '(345) 456-6791', 'robertbrown@university.edu', 104, 'Physics'),
(4, 'Chemistry 101', 'Michael', 'White', '(134) 567-6792', 'michaelwhite@university.edu', 105, 'Chemistry'),
(5, 'Biology 101', 'Laura', 'Black', '(298) 678-6793', 'laurablack@university.edu', 106, 'Biology'),
(6, 'Engineering 101', 'Chris', 'Green', '(471) 789-6794', 'chrisgreen@university.edu', 107, 'Engineering'),
(7, 'Economics 101', 'Sarah', 'Blue', '(562) 890-6795', 'sarahblue@university.edu', 108, 'Economics'),
(8, 'History 101', 'James', 'Yellow', '(680) 901-6796', 'jamesyellow@university.edu', 109, 'History'),
(9, 'Literature 101', 'Emily', 'Purple', '(710) 012-6797', 'emilypurple@university.edu', 110, 'Literature'),
(10, 'Philosophy 101', 'Anna', 'Orange', '(499) 123-6798', 'annaorange@university.edu', 111, 'Philosophy');


-- NextOfkin Table
INSERT INTO NextOfKin (NextOfKinID, FirstName, LastName, StreetName, CityName, StateName, Zip, CountryCode, Relationship, ContactPhoneNumber) VALUES
(1, 'Jane', 'Doe', '123 Main St', 'Berkeley', 'CA', 94704, 'US', 'Mother', '(510) 123-4567'),
(2, 'Peter', 'Smith', '456 Oak St', 'Tracy', 'CA', 95376, 'US', 'Father', '(209) 234-5678'),
(3, 'Mary', 'Johnson', '789 Pine St', 'Castro Valley', 'CA', 94546, 'US', 'Guardian', '(510) 345-6789'),
(4, 'Paul', 'Brown', '101 Maple St', 'Richmond', 'CA', 94801, 'US', 'Sibling', '(510) 456-7890'),
(5, 'Lucy', 'White', '202 Birch St', 'Oakland', 'CA', 94612, 'US', 'Mother', '(510) 567-8901'),
(6, 'James', 'Black', '303 Cedar St', 'San Leandro', 'CA', 94577, 'US', 'Father', '(510) 678-9012'),
(7, 'Emily', 'Green', '404 Spruce St', 'Hayward', 'CA', 94541, 'US', 'Guardian', '(510) 789-0123'),
(8, 'Michael', 'Blue', '505 Elm St', 'Dublin', 'CA', 94568, 'US', 'Sibling', '(925) 890-1234'),
(9, 'Sarah', 'Yellow', '606 Fir St', 'Fremont', 'CA', 94536, 'US', 'Mother', '(510) 901-2345'),
(10, 'Tom', 'Purple', '707 Redwood St', 'Pleasanton', 'CA', 94566, 'US', 'Father', '(925) 012-3456');



-- HallOfResidence Table 
INSERT INTO HallOfResidence (HallId, StreetName, CityName, StateName, Zip, CountryCode, MobilePhoneNumber) VALUES
(1, '123 College Ave', 'Berkeley', 'CA', 94704, 'US', '(510) 123-4567'),
(2, '456 University Blvd', 'Berkeley', 'CA', 94705, 'US', '(510) 234-5678'),
(3, '789 Dormitory Ln', 'Berkeley', 'CA', 94720, 'US', '(510) 345-6789'),
(4, '101 Campus Dr', 'Berkeley', 'CA', 94703, 'US', '(510) 456-7890'),
(5, '202 Student Way', 'Berkeley', 'CA', 94709, 'US', '(510) 567-8901'),
(6, '303 Quad Cir', 'Berkeley', 'CA', 94707, 'US', '(510) 678-9012'),
(7, '404 Academic Rd', 'Berkeley', 'CA', 94702, 'US', '(510) 789-0123'),
(8, '505 Learning St', 'Berkeley', 'CA', 94710, 'US', '(510) 890-1234'),
(9, '606 Study Ln', 'Berkeley', 'CA', 94708, 'US', '(510) 901-2345'),
(10, '707 Knowledge Ave', 'Berkeley', 'CA', 94706, 'US', '(510) 012-3456');


-- StudentApartment 
INSERT INTO StudentApartment (ApartmentNumber, StreetName, CityName, StateName, Zip, CountryCode, NumberOfRooms) VALUES
(1, '123 Campus Dr', 'Berkeley', 'CA', 94720, 'US', 4),
(2, '124 Campus Dr', 'Berkeley', 'CA', 94720, 'US', 3),
(3, '125 Campus Dr', 'Berkeley', 'CA', 94720, 'US', 2),
(4, '126 Campus Dr', 'Berkeley', 'CA', 94720, 'US', 1),
(5, '127 Campus Dr', 'Berkeley', 'CA', 94720, 'US', 5),
(6, '128 Campus Dr', 'Berkeley', 'CA', 94720, 'US', 4),
(7, '129 Campus Dr', 'Berkeley', 'CA', 94720, 'US', 3),
(8, '130 Campus Dr', 'Berkeley', 'CA', 94720, 'US', 2),
(9, '131 Campus Dr', 'Berkeley', 'CA', 94720, 'US', 1),
(10, '132 Campus Dr', 'Berkeley', 'CA', 94720, 'US', 5);

-- ResidenceStaff
INSERT INTO ResidenceStaff (StaffNumber, FirstName, LastName, Email, StreetName, CityName, StateName, Zip, CountryCode, DateOfBirth, Gender, Position, Location) VALUES
(1, 'Mike', 'Smith', 'mikesmith@university.edu', '101 Campus Block A', 'Berkeley', 'CA', 94720, 'US', '1970-01-01', 'Male', 'Manager', 'Campus Block A'),
(2, 'Laura', 'Brown', 'laurabrown@university.edu', '102 Campus Block A', 'Berkeley', 'CA', 94720, 'US', '1980-02-02', 'Female', 'Coordinator', 'Campus Block A'),
(3, 'Chris', 'White', 'chriswhite@university.edu', '103 Campus Block B', 'Berkeley', 'CA', 94720, 'US', '1975-03-03', 'Male', 'Supervisor', 'Campus Block B'),
(4, 'Anna', 'Black', 'annablack@university.edu', '104 Campus Block B', 'Berkeley', 'CA', 94720, 'US', '1985-04-04', 'Female', 'Director', 'Campus Block B'),
(5, 'James', 'Green', 'jamesgreen@university.edu', '105 Campus Block C', 'Berkeley', 'CA', 94720, 'US', '1990-05-05', 'Male', 'Assistant', 'Campus Block C'),
(6, 'Sarah', 'Blue', 'sarahblue@university.edu', '106 Campus Block C', 'Berkeley', 'CA', 94720, 'US', '1978-06-06', 'Female', 'Manager', 'Campus Block C'),
(7, 'Robert', 'Yellow', 'robertyellow@university.edu', '107 Campus Block D', 'Berkeley', 'CA', 94720, 'US', '1982-07-07', 'Male', 'Coordinator', 'Campus Block D'),
(8, 'Emily', 'Purple', 'emilypurple@university.edu', '108 Campus Block D', 'Berkeley', 'CA', 94720, 'US', '1989-08-08', 'Female', 'Supervisor', 'Campus Block D'),
(9, 'Paul', 'Orange', 'paulorange@university.edu', '109 Campus Block E', 'Berkeley', 'CA', 94720, 'US', '1972-09-09', 'Male', 'Director', 'Campus Block E'),
(10, 'Diana', 'Pink', 'dianapink@university.edu', '110 Campus Block E', 'Berkeley', 'CA', 94720, 'US', '1987-10-10', 'Female', 'Assistant', 'Campus Block E');


-- Room Table 
INSERT INTO Room (PlaceNumber, RoomNumber, MonthlyRent, RoomType, StaffNumber, HallId, ApartmentNumber) VALUES
(1, '101A', 500.00, 'HallOfResidence', 1, 1, NULL),
(2, '102B', 450.00, 'HallOfResidence', 2, 2, NULL),
(3, '103C', 600.00, 'StudentApartment', 3, NULL, 3),
(4, '104D', 400.00, 'HallOfResidence', 4, 4, NULL),
(5, '105E', 550.00, 'HallOfResidence', 5, 5, NULL),
(6, '106F', 650.00, 'StudentApartment', 6, NULL, 6),
(7, '107G', 700.00, 'HallOfResidence', 7, 7, NULL),
(8, '108H', 600.00, 'HallOfResidence', 8, 8, NULL),
(9, '109I', 500.00, 'StudentApartment', 9, NULL, 9),
(10, '110J', 550.00, 'HallOfResidence', 10, 10, NULL);


-- Student Table 
INSERT INTO Student (BannerNumber, FirstName, LastName, StreetName, CityName, StateName, Zip, CountryCode, MobilePhoneNumber, Email, DateOfBirth, Gender, Category, Nationality, SpecialNeeds, Comments, CurrentStatus, Major, Minor, AdvisorID, NextOfKinID, PlaceNumber, CourseNumber, LeaseNumber) VALUES
(1, 'Mark', 'Taylor', '101 University Ave', 'Berkeley', 'CA', 94704, 'US', '510-555-1111', 'marktaylor@university.edu', '2000-01-01', 'Male', 'Undergraduate', 'US', 'None', 'Active and thriving', 'Active', 'Computer Science', 'Mathematics', 1, 1, 1, 1, NULL),
(2, 'Lisa', 'Brown', '102 University Ave', 'Berkeley', 'CA', 94704, 'US', '510-555-2222', 'lisabrown@university.edu', '2000-02-02', 'Female', 'Undergraduate', 'US', 'Low vision', 'Needs assistance with reading materials', 'Active', 'Mathematics', 'Physics', 2, 2, 2, 2, NULL),
(3, 'James', 'Smith', '103 University Ave', 'Berkeley', 'CA', 94704, 'US', '510-555-3333', 'jamessmith@university.edu', '2000-03-03', 'Male', 'Undergraduate', 'US', 'None', 'No comments', 'Active', 'Physics', 'Chemistry', 3, 3, 3, 3, NULL),
(4, 'Emily', 'Johnson', '104 University Ave', 'Berkeley', 'CA', 94704, 'US', '510-555-4444', 'emilyjohnson@university.edu', '2000-04-04', 'Female', 'Undergraduate', 'US', 'Limb leg', 'Requires accessible seating', 'Active', 'Chemistry', 'Biology', 4, 4, 4, 4, NULL),
(5, 'David', 'White', '105 University Ave', 'Berkeley', 'CA', 94704, 'US', '510-555-5555', 'davidwhite@university.edu', '2000-05-05', 'Male', 'Undergraduate', 'US', 'None', 'Active participant in clubs', 'Active', 'Biology', 'Engineering', 5, 5, 5, 5, NULL),
(6, 'Sarah', 'Black', '106 University Ave', 'Berkeley', 'CA', 94704, 'US', '510-555-6666', 'sarahblack@university.edu', '2000-06-06', 'Female', 'Undergraduate', 'US', 'Hearing impairment', 'Uses hearing aids in class', 'Active', 'Engineering', 'Economics', 6, 6, 6, 6, NULL),
(7, 'Chris', 'Green', '107 University Ave', 'Berkeley', 'CA', 94704, 'US', '510-555-7777', 'chrisgreen@university.edu', '2000-07-07', 'Male', 'Undergraduate', 'US', 'None', 'Participates in sports', 'Active', 'Economics', 'History', 7, 7, 7, 7, NULL),
(8, 'Laura', 'Blue', '108 University Ave', 'Berkeley', 'CA', 94704, 'US', '510-555-8888', 'laurablue@university.edu', '2000-08-08', 'Female', 'Undergraduate', 'US', 'None', 'Active in student government', 'Active', 'History', 'Literature', 8, 8, 8, 8, NULL),
(9, 'Michael', 'Yellow', '109 University Ave', 'Berkeley', 'CA', 94704, 'US', '510-555-9999', 'michaelyellow@university.edu', '2000-09-09', 'Male', 'Undergraduate', 'US', 'None', 'Volunteer at local shelters', 'Active', 'Literature', 'Philosophy', 9, 9, 9, 9, NULL),
(10, 'Anna', 'Purple', '110 University Ave', 'Berkeley', 'CA', 94704, 'US', '510-555-0000', 'annapurple@university.edu', '2000-10-10', 'Female', 'Undergraduate', 'US', 'None', 'Excels in academics', 'Active', 'Philosophy', 'Computer Science', 10, 10, 10, 10, NULL);

-- Lease Table 
INSERT INTO Lease (LeaseNumber, Duration, BannerNumber, StudentFirstName, StudentLastName, PlaceNumber, RoomNumber, StreetName, CityName, StateName, Zip, CountryCode, StartDate, EndDate) VALUES
(1, '12 months', 1, 'Mark', 'Taylor', 1, '201A', '123 College Rd', 'University City', 'CA', 94540, 'US', '2024-08-01', '2025-07-31'),
(2, '12 months', 2, 'Lisa', 'Brown', 2, '202B', '125 College Rd', 'University City', 'CA', 94541, 'US', '2024-08-01', '2025-07-31'),
(3, '12 months', 3, 'James', 'Smith', 3, '203C', '127 College Rd', 'University City', 'CA', 94542, 'US', '2024-08-01', '2025-07-31'),
(4, '12 months', 4, 'Emily', 'Johnson', 4, '204D', '129 College Rd', 'University City', 'CA', 94543, 'US', '2024-08-01', '2025-07-31'),
(5, '12 months', 5, 'David', 'White', 5, '205E', '131 College Rd', 'University City', 'CA', 94544, 'US', '2024-08-01', '2025-07-31'),
(6, '12 months', 6, 'Sarah', 'Black', 6, '206F', '133 College Rd', 'University City', 'CA', 94545, 'US', '2024-08-01', '2025-07-31'),
(7, '12 months', 7, 'Chris', 'Green', 7, '207G', '135 College Rd', 'University City', 'CA', 94546, 'US', '2024-08-01', '2025-07-31'),
(8, '12 months', 8, 'Laura', 'Blue', 8, '208H', '137 College Rd', 'University City', 'CA', 94547, 'US', '2024-08-01', '2025-07-31'),
(9, '12 months', 9, 'Michael', 'Yellow', 9, '209I', '139 College Rd', 'University City', 'CA', 94548, 'US', '2024-08-01', '2025-07-31'),
(10, '12 months', 10, 'Anna', 'Purple', 10, '210J', '141 College Rd', 'University City', 'CA', 94549, 'US', '2024-08-01', '2025-07-31');

-- Invoice Table 
INSERT INTO Invoice (InvoiceNumber, Semester, FirstName, LastName, BannerNumber, PlaceNumber, RoomNumber, StreetName, CityName, StateName, Zip, CountryCode, PaymentDue, PaymentMethod, PaymentDate, FirstReminderDate, SecondReminderDate) VALUES
(1, 'Fall 2024', 'Mark', 'Taylor', 1, 1, '201A', '123 College Rd', 'University City', 'CA', 94540, 'US', 2000.00, 'Credit Card', '2024-09-01', '2024-09-10', '2024-09-20'),
(2, 'Fall 2024', 'Lisa', 'Brown', 2, 2, '202B', '125 College Rd', 'University City', 'CA', 94541, 'US', 1900.00, 'Bank Transfer', '2024-09-01', '2024-09-10', '2024-09-20'),
(3, 'Fall 2024', 'James', 'Smith', 3, 3, '203C', '127 College Rd', 'University City', 'CA', 94542, 'US', 2100.00, 'Credit Card', '2024-09-01', '2024-09-10', '2024-09-20'),
(4, 'Fall 2024', 'Emily', 'Johnson', 4, 4, '204D', '129 College Rd', 'University City', 'CA', 94543, 'US', 1800.00, 'Check', '2024-09-01', '2024-09-10', '2024-09-20'),
(5, 'Fall 2024', 'David', 'White', 5, 5, '205E', '131 College Rd', 'University City', 'CA', 94544, 'US', 1950.00, 'Credit Card', '2024-09-01', '2024-09-10', '2024-09-20'),
(6, 'Fall 2024', 'Sarah', 'Black', 6, 6, '206F', '133 College Rd', 'University City', 'CA', 94545, 'US', 2150.00, 'Bank Transfer', '2024-09-01', '2024-09-10', '2024-09-20'),
(7, 'Fall 2024', 'Chris', 'Green', 7, 7, '207G', '135 College Rd', 'University City', 'CA', 94546, 'US', 2200.00, 'Credit Card', '2024-09-01', '2024-09-10', '2024-09-20'),
(8, 'Fall 2024', 'Laura', 'Blue', 8, 8, '208H', '137 College Rd', 'University City', 'CA', 94547, 'US', 2000.00, 'Check', '2024-09-01', '2024-09-10', '2024-09-20'),
(9, 'Fall 2024', 'Michael', 'Yellow', 9, 9, '209I', '139 College Rd', 'University City', 'CA', 94548, 'US', 2050.00, 'Credit Card', '2024-09-01', '2024-09-10', '2024-09-20'),
(10, 'Fall 2024', 'Anna', 'Purple', 10, 10, '210J', '141 College Rd', 'University City', 'CA', 94549, 'US', 1950.00, 'Bank Transfer', '2024-09-01', '2024-09-10', '2024-09-20');

-- Inspection Table 
INSERT INTO Inspection (StaffNumber, StudentFirstName, StudentLastName, ApartmentNumber, InspectionDate, Satisfactory, Comments) VALUES
(1, 'Mark', 'Taylor', 1, '2024-08-15', 'Yes', 'No issues found.'),
(2, 'Lisa', 'Brown', 2, '2024-08-16', 'Yes', 'Minor cleaning required.'),
(3, 'James', 'Smith', 3, '2024-08-17', 'No', 'Plumbing issues detected.'),
(4, 'Emily', 'Johnson', 4, '2024-08-18', 'Yes', 'Well maintained.'),
(5, 'David', 'White', 5, '2024-08-19', 'Yes', 'No issues found.'),
(6, 'Sarah', 'Black', 6, '2024-08-20', 'No', 'Electrical issues detected.'),
(7, 'Chris', 'Green', 7, '2024-08-21', 'Yes', 'No issues found.'),
(8, 'Laura', 'Blue', 8, '2024-08-22', 'Yes', 'Minor cleaning required.'),
(9, 'Michael', 'Yellow', 9, '2024-08-23', 'Yes', 'Well maintained.'),
(10, 'Anna', 'Purple', 10, '2024-08-24', 'Yes', 'No issues found.');


CREATE TABLE CourseInstructor (
	CourseNumber INT PRIMARY KEY,
    CourseTitle VARCHAR(30),
    InstructorEmail VARCHAR(70) UNIQUE
); 


CREATE TABLE InstructorDetail (
    InstructorFirstName VARCHAR(30),
    InstructorLastName VARCHAR(30),
    InstructorPhoneNumber VARCHAR(20),
    InstructorEmail VARCHAR(70) UNIQUE,
    InstructorRoomNumber INT,
    DepartmentName VARCHAR(50),
    FOREIGN KEY(InstructorEmail) REFERENCES CourseInstructor(InstructorEmail)
);


INSERT INTO CourseInstructor (CourseNumber, CourseTitle, InstructorEmail)
VALUES (1, 'Database Systems', 'alicejohnson@university.edu'),
(2, 'Calculus', 'davidsmith@university.edu'),
(3, 'Physics 101', 'robertbrown@university.edu'),
(4, 'Chemistry 101', 'michaelwhite@university.edu'),
(5, 'Biology 101', 'laurablack@university.edu' ),
(6, 'Engineering 101', 'chrisgreen@university.edu' ),
(7, 'Economics 101', 'sarahblue@university.edu'),
(8, 'History 101', 'jamesyellow@university.edu'),
(9, 'Literature 101', 'emilypurple@university.edu'),
(10, 'Philosophy 101', 'annaorange@university.edu');


INSERT INTO InstructorDetail (InstructorFirstName, InstructorLastName, InstructorPhoneNumber, InstructorEmail, InstructorRoomNumber, DepartmentName)
VALUES ('Alice', 'Johnson', '(710) 234-6789', 'alicejohnson@university.edu', 102, 'Computer Science'),
('David', 'Smith', '(669) 345-6790', 'davidsmith@university.edu', 103, 'Mathematics'),
('Robert', 'Brown', '(345) 456-6791', 'robertbrown@university.edu', 104, 'Physics'),
('Michael', 'White', '(134) 567-6792', 'michaelwhite@university.edu', 105, 'Chemistry'),
('Laura', 'Black', '(298) 678-6793', 'laurablack@university.edu', 106, 'Biology'),
('Chris', 'Green', '(471) 789-6794', 'chrisgreen@university.edu', 107, 'Engineering'),
('Sarah', 'Blue', '(562) 890-6795', 'sarahblue@university.edu', 108, 'Economics'),
('James', 'Yellow', '(680) 901-6796', 'jamesyellow@university.edu', 109, 'History'),
('Emily', 'Purple', '(710) 012-6797', 'emilypurple@university.edu', 110, 'Literature'),
('Anna', 'Orange', '(499) 123-6798', 'annaorange@university.edu', 111, 'Philosophy');


CREATE TABLE AdvisorEmail (
    AdvisorID INT PRIMARY KEY,
    Email VARCHAR(70) UNIQUE
);

CREATE TABLE AdvisorDetail (
	Email VARCHAR(70) UNIQUE,
	FirstName VARCHAR(50), 
    LastName VARCHAR(50), 
    Position VARCHAR(50),
    DepartmentName VARCHAR(50),
    InternalPhoneNumber VARCHAR(20),
    RoomNumber VARCHAR(30)
);


INSERT INTO AdvisorEmail(AdvisorID, Email)
VALUES (1, 'johndoe@university.edu'),
(2, 'janesmith@university.edu'),
(3, 'alicejohnson@university.edu'),
(4, 'bobbrown@university.edu'),
(5,'carolwhite@university.edu'),
(6, 'davidblack@university.edu'),
(7, 'evegreen@university.edu'),
(8, 'frankblue@university.edu'),
(9, 'graceyellow@university.edu'),
(10, 'hankpurple@university.edu');

INSERT INTO AdvisorDetail (Email, FirstName, LastName, Position, DepartmentName, InternalPhoneNumber, RoomNumber)
VALUES ('johndoe@university.edu', 'John', 'Doe', 'Professor', 'Computer Science', '1234', '101'),
('janesmith@university.edu','Jane', 'Smith', 'Associate Professor', 'Mathematics', '1235', '102'),
('alicejohnson@university.edu', 'Alice', 'Johnson', 'Lecturer', 'Physics', '1236','103'),
('bobbrown@university.edu', 'Bob', 'Brown', 'Senior Lecturer', 'Chemistry', '1237', '104'),
('carolwhite@university.edu', 'Carol', 'White', 'Assistant Professor', 'Biology', '1238', '105'),
('davidblack@university.edu','David', 'Black', 'Professor', 'Engineering', '1239', '106'),
('evegreen@university.edu', 'Eve', 'Green', 'Senior Lecturer', 'Economics', '1240', '107'),
('frankblue@university.edu',  'Frank', 'Blue', 'Lecturer', 'History', '1241', '108'),
('graceyellow@university.edu', 'Grace', 'Yellow', 'Associate Professor', 'Literature', '1242', '109'),
('hankpurple@university.edu', 'Hank', 'Purple', 'Professor', 'Philosophy', '1243', '110');

SELECT * FROM courseinstructor;
SELECT * FROM instructordetail;
