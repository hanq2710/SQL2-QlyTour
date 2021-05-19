DROP DATABASE sql2_dulich;

CREATE DATABASE sql2_dulich;

USE sql2_dulich;

CREATE TABLE thanhpho(thanhpho_id INT PRIMARY KEY NOT NULL UNIQUE,
                      thanhpho_name VARCHAR(50));

CREATE TABLE diemden (diemden_id INT PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT,
                      diemden_name VARCHAR(50) NOT NULL,
                      diemden_mota VARCHAR(50),
                      diemden_gia FLOAT,
                      thanhpho_id INT NOT NULL ,
                      FOREIGN KEY (thanhpho_id) REFERENCES thanhpho(thanhpho_id));

CREATE TABLE khachhang(khachhang_id INT PRIMARY KEY NOT NULL UNIQUE,
                       khachhang_name VARCHAR(50) NOT NULL,
                       khachhang_cancuoc VARCHAR(9) NOT NULL ,
                       khachhang_namsinh DATE,
                       thanhpho_id INT NOT NULL,
                       FOREIGN KEY (thanhpho_id) REFERENCES thanhpho(thanhpho_id));

CREATE TABLE loaituor(loaitour_id INT PRIMARY KEY NOT NULL UNIQUE,
                      loaitour_code TINYINT NOT NULL,
                      loaituor_name VARCHAR(50));

CREATE TABLE tour (tour_id INT PRIMARY KEY NOT NULL UNIQUE,
                   tuor_ma TINYINT NOT NULL,
                   loaitour_id INT NOT NULL,
                   FOREIGN KEY (loaitour_id) REFERENCES loaituor (loaitour_id),
                   tour_gia FLOAT NOT NULL CHECK (tour_gia > 0),
                   tour_start DATETIME NOT NULL,
                   tour_end DATETIME NOT NULL);

CREATE TABLE bill (bill_id INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
                   tour_id INT NOT NULL,
                   FOREIGN KEY (tour_id) REFERENCES tour(tour_id),
                   khachhang_id INT NOT NULL,
                   FOREIGN KEY (khachhang_id) REFERENCES khachhang(khachhang_id),
                   bill_status  BIT);

INSERT INTO thanhpho VALUES (1, 'Hanoi'),
                            (2, 'Hue'),
                            (3, 'DaNang'),
                            (4, 'DaLat'),
                            (5, 'SaiGon');

INSERT INTO diemden VALUES (1, 'VanMieu', 'DTLS', 1000,1),
                           (2, 'HoiAn', 'PhoCo', 1800, 2),
                           (3, 'SonTra', 'BaiBien', 1200, 3),
                           (4, 'Coixaygio', 'TPNui', 2200, 4),
                           (5, 'VuonDauTay', 'TPNui', 2200, 4);

INSERT INTO loaituor VALUES (1, 001, 'XinXoConBo'),
                            (2, 002, 'SieuCapVipPro');

INSERT INTO tour VALUES (1, 001, 1, 2000, '2021-05-20', '2021-05-25'),
                        (2, 002, 2, 4000, '2021-05-20', '2021-05-25'),
                        (3, 003, 1, 2100, '2021-05-22', '2021-05-27'),
                        (4, 004, 2, 4500, '2021-05-22', '2021-05-27'),
                        (5, 005, 1, 2500, '2021-05-24', '2021-05-29'),
                        (6, 006, 2, 5000, '2021-05-24', '2021-05-29'),
                        (7, 007, 1, 1800, '2021-05-25', '2021-05-30'),
                        (8, 008, 2, 4000, '2021-05-25', '2021-05-30'),
                        (9, 009, 1, 3700, '2021-06-02', '2021-06-10'),
                        (10, 010, 2, 8000, '2021-06-02', '2021-06-10');


SELECT * FROM thanhpho;


INSERT INTO khachhang (khachhang_id, khachhang_name, khachhang_namsinh, thanhpho_id, khachhang_cancuoc)VALUES (1, 'Ha','1997-10-27', 4,'123456'),
                                                                                                              (2, 'Hai', '1997-02-07', 4, '234567890'),
                                                                                                              (3, 'Hoang', '2003-04-17', 4, '456789123'),
                                                                                                              (4, 'Sang', '1992-05-05', 1, '567891234'),
                                                                                                              (5, 'Hieu', '1993-04-12', 3, '678912345'),
                                                                                                              (10, 'Hieu', '1993-04-12', 3, '68912345'),
                                                                                                              (6, 'Khanh', '1992-03-19', 4, '789123456'),
                                                                                                              (7, 'Cong', '1998-01-29', 4, '891234567'),
                                                                                                              (8, 'Phuong', '1999-11-21', 2, '912345678'),
                                                                                                              (9, 'Luc', '1997-10-27', 5, '987654321');

INSERT INTO bill VALUES (1,1, 1, 1),
                        (2,1, 2, 1),
                        (3,9, 9, 0),
                        (4,2, 8, 1),
                        (5,8, 5, 0),
                        (6,3, 3, 0),
                        (7,1, 4, 1),
                        (8,6, 7, 1),
                        (9,9, 6, 0),
                        (10,7, 10, 1);

SELECT t.thanhpho_name, COUNT(d.thanhpho_id)
FROM diemden d INNER JOIN thanhpho t ON d.thanhpho_id = t.thanhpho_id
GROUP BY d.thanhpho_id;

SELECT  t.tour_start, COUNT(t.tour_start )
FROM tour t
WHERE MONTH(T.tour_start) = 5
GROUP BY t.tour_start;

SELECT  t.tour_end, COUNT(t.tour_end )
FROM tour t
WHERE MONTH(t.tour_end) = 6
GROUP BY t.tour_end;

# SELECT  t.tour_end, COUNT(t.tour_end )
    # FROM tour t
      # WHERE '2020-06-01' <= t.tour_end <= '2020-06-30'
      # GROUP BY t.tour_end;








