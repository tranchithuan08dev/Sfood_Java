CREATE DATABASE Sfood;

USE Sfood;

CREATE TABLE Users (
    UserId INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) UNIQUE,
    PasswordHash VARCHAR(255) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    Address NVARCHAR(255) NOT NULL,
    Role VARCHAR(10) CHECK (Role IN ('Customer', 'Staff'))     
);

CREATE TABLE Orders (
    OrderId INT PRIMARY KEY IDENTITY(1,1),
    UserId INT,
    OrderDate DATE,
    Status INT,
    Total Float,
    FOREIGN KEY (UserId) REFERENCES Users(UserId)
);

CREATE TABLE OrderItem (
    ItemId INT PRIMARY KEY IDENTITY(1,1),
    ItemName NVARCHAR(225),
    Price FLOAT,
    Image VARCHAR(255),
    Type VARCHAR(255) CHECK (Type IN ('Drink', 'Food'))
);

CREATE TABLE Recipe (
    RecipeID INT PRIMARY KEY IDENTITY(1,1),
    ItemId INT UNIQUE,
    Name NVARCHAR(255),
    Ingredients NVARCHAR(255),
    FOREIGN KEY (ItemId) REFERENCES OrderItem(ItemId)
);

CREATE TABLE WeeklyMenu (
    PlanID INT PRIMARY KEY IDENTITY(1,1),  
    Name NVARCHAR(255),
    DayName VARCHAR(255) CHECK (DayName IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday')),
    Description NVARCHAR(255),
    Week VARCHAR(255) CHECK (Week IN ('Week1', 'Week2', 'Week3', 'Week4')),
    Type VARCHAR(255) CHECK (Type IN ('vegetarian','vegan','special dietary'))
);

CREATE TABLE OrderDetail (
    DetailId INT PRIMARY KEY IDENTITY(1,1),
    OrderId INT,
    ItemId INT,
    Quantity INT,
    FOREIGN KEY (OrderId) REFERENCES Orders(OrderId),
    FOREIGN KEY (ItemId) REFERENCES OrderItem(ItemId)
);

CREATE TABLE WeeklyMenuItems (
    MenuItemID INT PRIMARY KEY IDENTITY(1,1),
    PlanID INT,
    ItemId INT,
    FOREIGN KEY (PlanID) REFERENCES WeeklyMenu(PlanID),
    FOREIGN KEY (ItemId) REFERENCES OrderItem(ItemId)
);

CREATE TABLE DescriptionPage(
     DescriptionPageID INT IDENTITY(1,1) PRIMARY KEY,
     DescriptionName NVARCHAR(255),
     ImageDescription VARCHAR(255)
);

CREATE TABLE DescriptionPageDetail(
     DescriptionPageDetailID INT IDENTITY(1,1) PRIMARY KEY,
     DescriptionPageID INT,
     DescriptionNameDetail NVARCHAR(255),
     FOREIGN KEY (DescriptionPageID) REFERENCES DescriptionPage(DescriptionPageID)
);

CREATE TABLE FeedBack(
  FeedBackID INT IDENTITY(1,1) PRIMARY KEY,
  FullName NVARCHAR(255),
  Email NVARCHAR(255),
  Phone VARCHAR(15) NOT NULL,
  Require NVARCHAR(255)
);
