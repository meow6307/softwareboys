-- Create the database
CREATE DATABASE CafeStaffManagement;

-- Use the newly created database
USE CafeStaffManagement;

-- Create the Users table to store user information
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Role ENUM('Owner', 'Admin', 'Manager', 'Staff') NOT NULL,
    Status ENUM('Active', 'Suspended') NOT NULL,
    Email VARCHAR(100)
);

-- Create the UserProfiles table to store additional user details
CREATE TABLE UserProfiles (
    ProfileID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT UNIQUE,
    Name VARCHAR(100) NOT NULL,
    ContactInfo VARCHAR(255)
);

-- Create the WorkSlots table to store information about work slots
CREATE TABLE WorkSlots (
    SlotID INT AUTO_INCREMENT PRIMARY KEY,
    CafeID INT,
    Date DATE NOT NULL,
    Time TIME NOT NULL,
    CafeRole ENUM('Chef', 'Cashier', 'Waiter') NOT NULL,
    MaxStaff INT NOT NULL,
    FOREIGN KEY (CafeID) REFERENCES Users (UserID)
);

-- Create the Bids table to store bid information
CREATE TABLE Bids (
    BidID INT AUTO_INCREMENT PRIMARY KEY,
    WorkSlotID INT,
    StaffID INT,
    BidStatus ENUM('Pending', 'Approved', 'Rejected') NOT NULL,
    FOREIGN KEY (WorkSlotID) REFERENCES WorkSlots (SlotID),
    FOREIGN KEY (StaffID) REFERENCES Users (UserID)
);

-- Create the Cafes table to store cafe details
CREATE TABLE Cafes (
    CafeID INT AUTO_INCREMENT PRIMARY KEY,
    OwnerID INT,
    CafeName VARCHAR(100) NOT NULL,
    Location VARCHAR(255),
    -- Other Cafe Details
    FOREIGN KEY (OwnerID) REFERENCES Users (UserID)
);

-- Create the CafeManagerAssignment table to track assignments made by cafe managers
CREATE TABLE CafeManagerAssignment (
    AssignmentID INT AUTO_INCREMENT PRIMARY KEY,
    ManagerID INT,
    WorkSlotID INT,
    FOREIGN KEY (ManagerID) REFERENCES Users (UserID),
    FOREIGN KEY (WorkSlotID) REFERENCES WorkSlots (SlotID)
);

-- Create the AssignedSlots table to track staff assignments to work slots
CREATE TABLE AssignedSlots (
    AssignmentID INT AUTO_INCREMENT PRIMARY KEY,
    WorkSlotID INT,
    StaffID INT,
    FOREIGN KEY (WorkSlotID) REFERENCES WorkSlots (SlotID),
    FOREIGN KEY (StaffID) REFERENCES Users (UserID)
);
