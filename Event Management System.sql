Create database Event_Management;
Use Event_Management;

CREATE TABLE Events (
Event_ID INT PRIMARY KEY,
Event_Name VARCHAR (25),
Event_Date DATE,
Event_Location VARCHAR (25),
Event_Description VARCHAR (50)
);

CREATE TABLE Attendees (
Attendee_ID INT PRIMARY KEY,
Attendee_Name VARCHAR (25),
Attendee_Phone VARCHAR (25),
Attendee_Email VARCHAR (25),
Attendee_City VARCHAR (15)
);

CREATE TABLE Registrations (
Registration_ID INT PRIMARY KEY,
Event_ID INT,
Attendee_ID INT,
Registration_Date DATE,
Registration_Amount DECIMAL(10,2),
FOREIGN KEY (Event_ID) REFERENCES Events(Event_ID),
FOREIGN KEY (Attendee_ID) REFERENCES Attendees(Attendee_ID)
);

-- Insert sample data into the Events table
INSERT INTO Events (Event_ID, Event_Name, Event_Date, Event_Location, Event_Description)
VALUES
(1, 'Auto Expo', '2024-01-01', 'Chennai', 'Showcases Cars'),
(2, 'Home Expo', '2024-02-02', 'Bengaluru', 'Showcases homes'),
(3, 'Food Expo', '2024-03-03', 'Delhi', 'Showcases food'),
(4, 'Gym Expo', '2024-04-04', 'Mumbai', 'Showcases Gym equipment'),
(5, 'Art Expo', '2024-05-05', 'Kolkata', 'Showcases Art work');

-- Insert sample data into the Attendees table
INSERT INTO Attendees (Attendee_ID, Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City)
VALUES
(1, 'Raja', '123456789', 'raja@email.com', 'Chennai'),
(2, 'Kumar', '123445678', 'kumar@email.com', 'Bengaluru'),
(3, 'Satish', '123454654', 'satish@email.com', 'Delhi'),
(4, 'John', '1237428314', 'john@email.com', 'Mumbai'),
(5, 'Kiran', '1239734322', 'kiran@email.com', 'Kolkata');

-- Insert sample data into the Registrations table
INSERT INTO Registrations (Registration_ID, Event_ID, Attendee_ID, Registration_Date, Registration_Amount)
VALUES
(1, 1, 1, '2023-09-01', 150.00),
(2, 1, 2, '2023-09-05', 150.00),
(3, 2, 2, '2023-06-15', 75.00),
(4, 2, 3, '2023-06-20', 75.00),
(5, 3, 3, '2023-11-01', 300.00),
(6, 3, 4, '2023-11-05', 300.00),
(7, 4, 4, '2023-05-10', 100.00),
(8, 4, 5, '2023-05-15', 100.00),
(9, 5, 5, '2023-02-20', 25.00);

-- Insert New event

INSERT INTO Events (Event_ID, Event_Name, Event_Date, Event_Location, Event_Description)
VALUES (6, 'Fashion expo', '2024-06-06', 'Noida', 'Showcase for Fashion');
-- SELECT*From Events;

-- Updating an event's information

UPDATE Events
SET Event_Name = 'Bike expo',
	Event_Date = '2024-07-07',
    Event_Location = 'Pune',
    Event_Description = 'Showcase bike'
WHERE Event_ID = 3;
-- SELECT*From Events;
-- Deleting an Event

DELETE FROM Registrations WHERE Event_ID = 4; -- To delete any dependent data
DELETE FROM Events WHERE Event_ID = 4; -- To delete the event
-- SELECT*From Events; 
-- Insert a New Attandee

INSERT INTO Attendees (Attendee_ID, Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City)
VALUES (6, 'Mohan', '12397343234', 'mohan@email.com', 'Pune');
-- Select * from attendees;
-- Registering a New Attendee

INSERT INTO Registrations (Registration_ID, Event_ID, Attendee_ID, Registration_Date, Registration_Amount)
VALUES (10, 1, 5, '2023-10-07', 100.00);
Select * from attendees;
-- Retrieve Event Information

SELECT 
    Event_ID,
    Event_Name,
    Event_Date,
    Event_Location,
    Event_Description
FROM 
    Events;
    
    -- Generate Attendee List
    
    SELECT
    a.Attendee_ID,
    a.Attendee_Name,
    a.Attendee_Phone,
    a.Attendee_Email,
    a.Attendee_City
FROM
    Attendees a
INNER JOIN Registrations r
    ON a.Attendee_ID = r.Attendee_ID
WHERE
    r.Event_ID = 3;
    
    -- Event Attendance 
    
    SELECT
    e.Event_ID,
    e.Event_Name,
    COUNT(r.Registration_ID) AS Number_Of_Attendees
FROM
    Events e
LEFT JOIN Registrations r
    ON e.Event_ID = r.Event_ID
GROUP BY
    e.Event_ID, e.Event_Name
ORDER BY
    Number_Of_Attendees DESC;