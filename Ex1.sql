drop database student;

create database student;

use student;

create table Lop_Hoc(
	ma_lop int primary key,
    khoa_hoc varchar(255),
    so_hv int
);

create table Hoc_Vien(
	ma_hv int primary key,
    ten varchar(255),
    ngay_sinh varchar(255),
    dia_chi varchar(255),
    ma_lop int,
    FOREIGN KEY (ma_lop) REFERENCES Lop_Hoc(ma_lop)
);

create table Mon_Hoc(
	ma_mh int primary key,
    ten_mh varchar(255),
	so_gio int
);

create table Giao_Vien(
	ma_gv int primary key,
    ten varchar(255),
	tuoi int,
    que_quan varchar(255)
);

create table Bang_Cap(
	ma_bc int primary key,
    ngay_cap varchar(255),
    ma_hv int,
    FOREIGN KEY (ma_hv) REFERENCES Hoc_Vien(ma_hv)
);

create table Hoc_Vien_Mon_Hoc(
	ma_hv int,
    ma_mh int,
    FOREIGN KEY (ma_hv) REFERENCES Hoc_Vien(ma_hv),
    FOREIGN KEY (ma_mh) REFERENCES Mon_Hoc(ma_mh),
    diem int
);



