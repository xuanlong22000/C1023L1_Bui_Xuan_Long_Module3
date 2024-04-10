drop database products2;

create database products2;

use products2;

create table Customer(
	cID int primary key,
    cName varchar(255),
    cAge varchar(255)
);

create table Order_(
	oID int primary key,
    cID int,
    oDate date,
    oTotalPrice double,
    FOREIGN KEY (cID) REFERENCES Customer(cID)
);

create table Product(
	pID int primary key,
    pName varchar(255),
    pPrice double
);

create table OrderDetail(
	oID int,
    pID int,
    primary key(oID, pID),
    FOREIGN KEY (oID) REFERENCES Order_(oID),
    FOREIGN KEY (pID) REFERENCES Product(pID)
);
