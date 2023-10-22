-- Sample data for the Bids table with existing WorkSlotID values
INSERT INTO Bids (WorkSlotID, StaffID, BidStatus, StaffRole) VALUES
    (1, 4, 'Approved', 'Chef'),
    (2, 5, 'Approved', 'Cashier'),
    (3, 4, 'Pending', 'Waiter');

-- Sample data for the Users table
INSERT INTO Users (Username, Password, Role, Status, Email) VALUES
    ('admin_user', 'admin_password', 'Admin', 'Active', 'admin@example.com'),
    ('owner_user', 'owner_password', 'Owner', 'Active', 'owner@example.com'),
    ('manager_user', 'manager_password', 'Manager', 'Active', 'manager@example.com'),
    ('staff1_user', 'staff1_password', 'Staff', 'Active', 'staff1@example.com'),
    ('staff2_user', 'staff2_password', 'Staff', 'Active', 'staff2@example.com');

-- Sample data for the UserProfiles table
INSERT INTO UserProfiles (UserID, Name, ContactInfo) VALUES
    (1, 'Admin User', 'Contact Info for Admin'),
    (2, 'Owner User', 'Contact Info for Owner'),
    (3, 'Manager User', 'Contact Info for Manager'),
    (4, 'Staff 1', 'Contact Info for Staff 1'),
    (5, 'Staff 2', 'Contact Info for Staff 2');

-- Sample data for the WorkSlots table
INSERT INTO WorkSlots (CafeID, Date, Time, CafeRole, MaxStaff) VALUES
    (2, '2023-10-25', '08:00:00', 'Chef', 3),
    (2, '2023-10-25', '12:00:00', 'Cashier', 2),
    (2, '2023-10-25', '16:00:00', 'Waiter', 4);

-- Sample data for the Cafes table
INSERT INTO Cafes (OwnerID, CafeName, Location) VALUES
    (2, 'Sample Cafe', '123 Main St, Sampleville');

-- Sample data for the CafeManagerAssignment table
INSERT INTO CafeManagerAssignment (ManagerID, WorkSlotID) VALUES
    (3, 1);

-- Sample data for the AssignedSlots table
INSERT INTO AssignedSlots (WorkSlotID, StaffID) VALUES
    (1, 4),
    (2, 5),
    (3, 4);
