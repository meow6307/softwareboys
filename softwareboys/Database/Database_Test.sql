USE CafeStaffManagement;

-- Insert sample data into the Users table (System Admin, Cafe Owner, Cafe Manager, Cafe Staff)
INSERT INTO Users (Username, Password, Role, IsActive)
VALUES
    ('admin', 'adminpassword', 'System Admin', 1),
    ('cafeowner1', 'owner1password', 'Cafe Owner', 1),
    ('cafemanager1', 'manager1password', 'Cafe Manager', 1),
    ('staff1', 'staff1password', 'Cafe Staff', 1),
    ('staff2', 'staff2password', 'Cafe Staff', 1);

-- Insert sample data into the UserProfiles table
INSERT INTO UserProfiles (UserID, FirstName, LastName)
VALUES
    (1, 'Admin', 'User'),
    (2, 'Cafe', 'Owner'),
    (3, 'Cafe', 'Manager'),
    (4, 'Staff', 'One'),
    (5, 'Staff', 'Two');

-- Insert sample data into the WorkSlots table (created by a cafe owner)
INSERT INTO WorkSlots (CafeOwnerID, Date, Time)
VALUES
    (2, '2023-10-17', '09:00:00'),
    (2, '2023-10-18', '10:00:00'),
    (2, '2023-10-19', '11:00:00');

-- Insert sample data into the Bids table (staff bidding for work slots)
INSERT INTO Bids (WorkSlotID, StaffID, BidStatus, MaxSlots)
VALUES
    (1, 4, 'Pending', 3),
    (2, 5, 'Pending', 2);

-- Insert sample data into the AssignedSlots table (assignments made by cafe managers)
INSERT INTO AssignedSlots (WorkSlotID, StaffID)
VALUES
    (1, 4);
