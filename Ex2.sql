drop database products;

create database products;

use products;

create table Phieu_Xuat(
	So_PX int primary key,
    Ngay_Xuat date,
    DG_Xuat varchar(255)
);

create table Vat_Tu(
	MaVTU int primary key,
    Ngay_Xuat date,
    SLXuat int
);

create table Chi_tiet_phieu_nhap(
	So_PX int,
    MaVTU int,
	DG_Xuat varchar(255),
    SLXuat int,
    FOREIGN KEY (So_PX) REFERENCES Phieu_Xuat(So_PX),
	FOREIGN KEY (MaVTU) REFERENCES Vat_Tu(MaVTU)
);

create table Phieu_nhap(
	SoPN int primary key,
    Ngay_Nhap date,
    SLXuat int
);

create table NhaCC(
	MaNCC int primary key,
	TenNCC varchar(255),
    DiaChi varchar(255)
);

create table SDT(
	Id int primary key,
    MaNCC int,
	phone int,
    FOREIGN KEY (MaNCC) REFERENCES NhaCC(MaNCC)
);

create table DonDH(
	SoDH int primary key,
    NgayDH date,
    SLXuat int,
    MaNCC int,
    FOREIGN KEY (MaNCC) REFERENCES NhaCC(MaNCC)
);

create table Chi_tiet_don_dat_hang(
	MaVTU int,
    SoDH int,
    FOREIGN KEY (MaVTU) REFERENCES Vat_Tu(MaVTU),
	FOREIGN KEY (SoDH) REFERENCES DonDH(SoDH)
);


