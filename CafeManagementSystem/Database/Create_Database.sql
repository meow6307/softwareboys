-- Step 1: Create a Database
CREATE DATABASE cafe_staff_management;

-- Step 2: Select the Database
USE cafe_staff_management;

-- Step 3: Create Tables within the Selected Database

-- User Roles
CREATE TABLE UserRole (
    ID INT PRIMARY KEY,
    RoleName VARCHAR(255) NOT NULL
);

-- Users Table
CREATE TABLE User (
    ID INT PRIMARY KEY,
    FullName VARCHAR(255) NOT NULL,
    Username VARCHAR(50) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    UserRoleID INT NOT NULL,
    FOREIGN KEY (UserRoleID) REFERENCES UserRole(ID)
);

-- Work Slots
CREATE TABLE WorkSlot (
    ID INT PRIMARY KEY,
    Date DATE NOT NULL,
    StartTime TIME NOT NULL,
    EndTime TIME NOT NULL,
    Description VARCHAR(255) NOT NULL,
    CafeOwnerID INT,
    FOREIGN KEY (CafeOwnerID) REFERENCES User(ID)
);

-- Assigned Slots
CREATE TABLE AssignedSlot (
    ID INT PRIMARY KEY,
    WorkSlotID INT NOT NULL,
    StaffID INT NOT NULL,
    AssignmentDate DATE NOT NULL,
    FOREIGN KEY (WorkSlotID) REFERENCES WorkSlot(ID),
    FOREIGN KEY (StaffID) REFERENCES User(ID)
);

-- Bid Statuses
CREATE TABLE BidStatus (
    ID INT PRIMARY KEY,
    StatusName VARCHAR(255) NOT NULL
);

-- Bids for Work Slots
CREATE TABLE Bid (
    ID INT PRIMARY KEY,
    StaffID INT NOT NULL,
    WorkSlotID INT NOT NULL,
    StatusID INT,
    FOREIGN KEY (StaffID) REFERENCES User(ID),
    FOREIGN KEY (WorkSlotID) REFERENCES WorkSlot(ID),
    FOREIGN KEY (StatusID) REFERENCES BidStatus(ID)
);