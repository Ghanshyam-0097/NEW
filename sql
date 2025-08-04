-- Admin table
CREATE TABLE Admin (
    AdminID INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(100),
    Email NVARCHAR(100) UNIQUE,
    PasswordHash NVARCHAR(MAX)
);

-- Alumni table
CREATE TABLE Alumni (
    AlumniID INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(100),
    Email NVARCHAR(100) UNIQUE,
    PasswordHash NVARCHAR(MAX),
    Phone NVARCHAR(20),
    ProfilePic NVARCHAR(MAX),
    IsVerified BIT DEFAULT 0
);

-- Education
CREATE TABLE Education (
    EducationID INT IDENTITY PRIMARY KEY,
    AlumniID INT FOREIGN KEY REFERENCES Alumni(AlumniID),
    Degree NVARCHAR(100),
    Branch NVARCHAR(100),
    GraduationYear INT
);

-- Professional
CREATE TABLE Professional (
    ProfessionalID INT IDENTITY PRIMARY KEY,
    AlumniID INT FOREIGN KEY REFERENCES Alumni(AlumniID),
    Company NVARCHAR(100),
    Designation NVARCHAR(100),
    Industry NVARCHAR(100)
);

-- Job Post
CREATE TABLE JobPost (
    JobID INT IDENTITY PRIMARY KEY,
    AlumniID INT FOREIGN KEY REFERENCES Alumni(AlumniID),
    Title NVARCHAR(200),
    Description NVARCHAR(MAX),
    Location NVARCHAR(100),
    PostedOn DATETIME DEFAULT GETDATE()
);

-- Event
CREATE TABLE Event (
    EventID INT IDENTITY PRIMARY KEY,
    Title NVARCHAR(200),
    Description NVARCHAR(MAX),
    EventDate DATETIME
);

-- RSVP
CREATE TABLE RSVP (
    RSVPID INT IDENTITY PRIMARY KEY,
    EventID INT FOREIGN KEY REFERENCES Event(EventID),
    AlumniID INT FOREIGN KEY REFERENCES Alumni(AlumniID)
);

-- Announcement
CREATE TABLE Announcement (
    AnnouncementID INT IDENTITY PRIMARY KEY,
    Title NVARCHAR(200),
    Message NVARCHAR(MAX),
    CreatedAt DATETIME DEFAULT GETDATE()
);

-- Messaging
CREATE TABLE Message (
    MessageID INT IDENTITY PRIMARY KEY,
    SenderID INT FOREIGN KEY REFERENCES Alumni(AlumniID),
    ReceiverID INT FOREIGN KEY REFERENCES Alumni(AlumniID),
    Content NVARCHAR(MAX),
    SentAt DATETIME DEFAULT GETDATE(),
    IsRead BIT DEFAULT 0
);

 "ConnectionStrings": {
    "DefaultConnection": "Server=mydbinstance.abcdefghijk.us-east-1.rds.amazonaws.com;Database=AlumniDB;User Id=admin;Password=YourRDSPassword123;"
  }
