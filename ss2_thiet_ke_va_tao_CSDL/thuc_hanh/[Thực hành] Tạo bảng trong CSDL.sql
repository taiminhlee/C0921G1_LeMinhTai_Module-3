create DATABASE quan_ly_diem_thi;
USE quan_ly_diem_thi;

CREATE TABLE hoc_sinh(
    ma_HS VARCHAR(20) PRIMARY KEY,
    Ten_HS VARCHAR(50),
    Ngay_Sinh DATETIME,
    Lop VARCHAR(20),
    GT VARCHAR(20)
);

CREATE TABLE mon_hoc(
    Ma_MH VARCHAR(20) PRIMARY KEY,
    Ten_MH VARCHAR(50)
);

CREATE TABLE bang_diem(
    Ma_HS VARCHAR(20),
    Ma_MH VARCHAR(20),
    Diem_Thi INT,
    Ngay_KT DATETIME,
    PRIMARY KEY (Ma_HS, Ma_MH),
    FOREIGN KEY (Ma_HS) REFERENCES hoc_sinh(Ma_HS),
    FOREIGN KEY (Ma_MH) REFERENCES mon_hoc(Ma_MH)
);

CREATE TABLE giao_vien(
    Ma_GV VARCHAR(20) PRIMARY KEY,
    Ten_GV VARCHAR(20),
    SDT VARCHAR(10)
);

ALTER TABLE mon_hoc ADD Ma_GV VARCHAR(20);
ALTER TABLE mon_hoc ADD CONSTRAINT FK_MaGV FOREIGN KEY (Ma_GV) REFERENCES giao_vien(Ma_GV);