CREATE DATABASE quan_ly_vat_tu;
CREATE TABLE vat_tu (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tenvattu VARCHAR(255)
);
CREATE TABLE nha_cung_cap (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ten VARCHAR(50),
    diachi VARCHAR(255),
    sodienthoai VARCHAR(20)
);
CREATE TABLE don_dat_hang (
    sodonhang INT PRIMARY KEY AUTO_INCREMENT,
    ngaydathang DATETIME
);
CREATE TABLE phieu_xuat (
    IDphieuxuat INT PRIMARY KEY AUTO_INCREMENT,
    ngayxuat DATETIME
);
CREATE TABLE phieu_nhap (
    IDphieunhap INT PRIMARY KEY AUTO_INCREMENT,
    ngaynhap DATETIME
);
ALTER TABLE don_dat_hang
ADD COLUMN IDnhacungcap INT,
ADD FOREIGN KEY (IDnhacungcap) REFERENCES nha_cung_cap(id);
CREATE TABLE chi_tiet_DH(
IDvattu INT,
IDnhacungcap INT,
soluong INT NOT NULL DEFAULT(0) CHECK(soluong >= 0),
PRIMARY KEY (IDvattu, IDnhacungcap),
FOREIGN KEY (IDvattu) REFERENCES vat_tu(id),
FOREIGN KEY (IDnhacungcap) REFERENCES nha_cung_cap(id)
);
SELECT 
    *
FROM
    nha_cung_cap;
CREATE TABLE chi_tiet_nhap (
    IDvattu INT,
    IDphieunhap INT,
    don_gia_nhap INT,
    soluongnhap INT,
    PRIMARY KEY (IDvattu , IDphieunhap),
    FOREIGN KEY (IDphieunhap)
        REFERENCES phieu_nhap (idphieunhap),
    FOREIGN KEY (IDvattu)
        REFERENCES vat_tu (id)
);
use quan_ly_vat_tu;
CREATE TABLE chi_tiet_xuat (
    IDvattu INT,
    IDphieuxuat INT,
    don_gia_xuat INT,
    soluongxuat INT,
    PRIMARY KEY (IDvattu , IDphieuxuat),
    FOREIGN KEY (IDvattu)
        REFERENCES vat_tu (id),
    FOREIGN KEY (IDphieuxuat)
        REFERENCES phieu_xuat (idphieuxuat)
);