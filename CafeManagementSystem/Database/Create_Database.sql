-- Create the database
CREATE DATABASE CafeStaffManagement;

-- Use the newly created database
USE CafeStaffManagement;

-- Create the Users table to store user information
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Role VARCHAR(50) NOT NULL,
    IsActive BIT
);

-- Create the UserProfiles table to store additional user details
CREATE TABLE UserProfiles (
    ProfileID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT UNIQUE,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    FOREIGN KEY (UserID) REFERENCES Users (UserID)
);

-- Create the WorkSlots table to store information about work slots
CREATE TABLE WorkSlots (
    SlotID INT AUTO_INCREMENT PRIMARY KEY,
    CafeOwnerID INT,
    Date DATE,
    Time TIME,
    FOREIGN KEY (CafeOwnerID) REFERENCES Users (UserID)
);

-- Create the Bids table to store bid information
CREATE TABLE Bids (
    BidID INT AUTO_INCREMENT PRIMARY KEY,
    WorkSlotID INT,
    StaffID INT,
    BidStatus VARCHAR(50),
    MaxSlots INT,
    FOREIGN KEY (WorkSlotID) REFERENCES WorkSlots (SlotID),
    FOREIGN KEY (StaffID) REFERENCES Users (UserID)
);

-- Create the AssignedSlots table to track assignments made by cafe managers
CREATE TABLE AssignedSlots (
    AssignmentID INT AUTO_INCREMENT PRIMARY KEY,
    WorkSlotID INT,
    StaffID INT,
    FOREIGN KEY (WorkSlotID) REFERENCES WorkSlots (SlotID),
    FOREIGN KEY (StaffID) REFERENCES Users (UserID)
);
