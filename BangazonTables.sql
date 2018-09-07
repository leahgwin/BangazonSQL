CREATE TABLE `Computers` (
	`ComputerId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`PurchaseDate`	TEXT NOT NULL,
	`DecommissionDate`	TEXT NOT NULL,
	`RepairStatus`	INTEGER NOT NULL
);

CREATE TABLE `Customers` (
	`CustomerId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`FirstName`	TEXT NOT NULL,
	`LastName`	TEXT NOT NULL,
	`AcctCreateDate`	INTEGER NOT NULL,
	`LastLoginDate`	INTEGER NOT NULL
);

CREATE TABLE `Department` (
	`DepartmentId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`Name`	TEXT NOT NULL,
	`Budget`	INTEGER NOT NULL
);

CREATE TABLE `EmployeeComp` (
	`EmployeeCompId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`StartDate`	TEXT NOT NULL,
	`EndDate`	TEXT NOT NULL,
	`ComputerId`	INTEGER NOT NULL,
	`EmployeeId`	INTEGER NOT NULL,
	FOREIGN KEY(`ComputerId`) REFERENCES `Computers`(`ComputerId`),
	FOREIGN KEY(`EmployeeId`) REFERENCES `Employees`(`EmployeeId`)
);

CREATE TABLE `EmployeeTraining` (
	`EmployeeTrainingId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`EmployeeId`	INTEGER NOT NULL,
	`TrainingId`	INTEGER NOT NULL,
	FOREIGN KEY(`TrainingId`) REFERENCES `TrainingPrograms`(`TrainingId`),
	FOREIGN KEY(`EmployeeId`) REFERENCES `Employees`(`EmployeeId`)
);

CREATE TABLE `Employees` (
	`EmployeeId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`FirstName`	TEXT NOT NULL,
	`LastName`	TEXT NOT NULL,
	`Title`	TEXT NOT NULL,
	`Supervisor`	INTEGER NOT NULL,
	`DepartmentId`	INTEGER NOT NULL,
	FOREIGN KEY(`DepartmentId`) REFERENCES `Department`(`DepartmentId`)
);

CREATE TABLE `Orders` (
	`OrderId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`CustomerId`	INTEGER NOT NULL,
	`PaymentId`	INTEGER NOT NULL,
	FOREIGN KEY(`CustomerId`) REFERENCES `Customers`(`CustomerId`),
	FOREIGN KEY(`PaymentId`) REFERENCES `Payment Types`(`PaymentId`)
);

CREATE TABLE `Payment Types` (
	`PaymentId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`Type`	TEXT NOT NULL,
	`AcctNumber`	TEXT NOT NULL,
	`Title`	TEXT NOT NULL,
	`CustomerId`	INTEGER NOT NULL,
	FOREIGN KEY(`CustomerId`) REFERENCES `Customers`(`CustomerId`)
);

CREATE TABLE `Product Categories` (
	`ProductCatId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`Name`	TEXT NOT NULL
);

CREATE TABLE `Product Orders` (
	`ProductOrderID`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`ProductId`	INTEGER NOT NULL,
	`OrderId`	INTEGER NOT NULL,
	FOREIGN KEY(`OrderId`) REFERENCES `Orders`(`OrderId`),
	FOREIGN KEY(`ProductId`) REFERENCES `Products`(`ProductId`)
);

CREATE TABLE `Products` (
	`ProductId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`Title`	TEXT NOT NULL,
	`Description`	TEXT NOT NULL,
	`Price`	INTEGER NOT NULL,
	`Quantity`	INTEGER NOT NULL,
	`CustomerId`	INTEGER NOT NULL,
	`ProductCatId`	INTEGER NOT NULL,
	FOREIGN KEY(`ProductCatId`) REFERENCES `Product Categories`(`ProductCatId`),
	FOREIGN KEY(`CustomerId`) REFERENCES `Customers`(`CustomerId`)
);

CREATE TABLE `TrainingPrograms` (
	`TrainingId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`Name`	TEXT NOT NULL,
	`StartDate`	TEXT NOT NULL,
	`EndDate`	TEXT NOT NULL,
	`MaxCapacity`	INTEGER NOT NULL
);