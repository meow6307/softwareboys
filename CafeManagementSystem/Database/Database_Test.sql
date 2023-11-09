USE cafe_staff_management;

-- Insert sample user roles
INSERT INTO UserRole (ID, RoleName) VALUES
(1, 'Cafe Owner'),
(2, 'Cafe Manager'),
(3, 'Cafe Staff'),
(4, 'System Admin'),
(5, 'Chef'),
(6, 'Waiter'),
(7, 'Cashier');

-- Insert sample user data (Cafe Owner, Cafe Manager, System Admin)
INSERT INTO User (ID, FullName, Username, Password, UserRoleID) VALUES
(1, 'John Doe', 'john_doe', 'password', 1),
(2, 'Jane Smith', 'jane_smith', 'password', 2),
(6, 'Admin User', 'admin', 'admin123', 4);

-- Insert sample data for Cafe Staff
INSERT INTO User (ID, FullName, Username, Password, UserRoleID) VALUES
(3, 'Mark Johnson', 'mark_j', 'password', 3),  -- Initially Cafe Staff (Chef)
(4, 'Alice Brown', 'alice_b', 'password', 3),  -- Initially Cafe Staff (Waiter)
(5, 'Sarah White', 'sarah_w', 'password', 3);  -- Initially Cafe Staff (Cashier)

-- Insert sample data for Work Slots (created by Cafe Owner)
INSERT INTO WorkSlot (ID, Date, StartTime, EndTime, Description, CafeOwnerID) VALUES
(1, '2023-11-01', '08:00:00', '12:00:00', 'Morning Shift', 1),
(2, '2023-11-01', '12:00:00', '16:00:00', 'Afternoon Shift', 1),
(3, '2023-11-02', '08:00:00', '12:00:00', 'Morning Shift', 1),
(4, '2023-11-02', '12:00:00', '16:00:00', 'Afternoon Shift', 1);

-- Insert sample data for Assigned Slots
INSERT INTO AssignedSlot (ID, WorkSlotID, StaffID, AssignmentDate) VALUES
(1, 1, 3, '2023-11-01'), -- Chef Mark Johnson assigned to Morning Shift on Nov 1
(2, 2, 4, '2023-11-01'); -- Waiter Alice Brown assigned to Afternoon Shift on Nov 1

-- Insert sample data for Bid Statuses
INSERT INTO BidStatus (ID, StatusName) VALUES
(1, 'Pending'),
(2, 'Approved'),
(3, 'Rejected');

-- Insert sample data for Bids (for Staff with Roles)
INSERT INTO Bid (ID, StaffID, WorkSlotID, StatusID) VALUES
(1, 5, 2, 1); -- Cashier Sarah White's bid for Afternoon Shift on Nov 1, Pending