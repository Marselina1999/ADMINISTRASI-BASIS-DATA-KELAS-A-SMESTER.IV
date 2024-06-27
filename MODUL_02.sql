-- Nama : Marselina Bulu
-- NIM : 22241019

-- MODUL 2

-- NILAI LITERAL

-- menggunakan SELECT Statemenet untuk nilai literal untuk angka
SELECT 77 AS nomor_punggung;

-- menampilkan nilai literal beberapa data
SELECT 2 AS angka, true AS nilai_logika, 'DQLAB' as Teks;

-- NULL (tidak memiiliki nilai atau kosong)

-- Menampilkan NULL
SELECT NULL AS Kosong;

-- Operator Matematika

-- Kalkulasi expresi matematika
SELECT 5%2 AS sisa_bagi, 5/2 hasil_bagi_1, 5 DIV 2 AS hasil_bagi_2;

-- Latihan Mandiri
SELECT 4*2 AS hasil_bagi_1, (4*8)%7 AS hasil_bagi_2, (4*8)MOD 7 AS hasil_bagi_3, (4*8)/7 AS sisa_bagi_4


SELECT * FROM tr_penjualan_dqlab;
-- EKSPRESI MATEMATIKA
-- Menampilkan hasil kali dari kolom qty dan harga
SELECT qty*harga AS total
FROM tr_penjualan_dqlab;

-- Operator perbandingan
-- Menampilkan hasil perbandingan nilai literal
SELECT 
5=5,
5<>5,
5<>4,
5!=5,
5!=4,
5>4;

SELECT 
1 = TRUE,
1 = FALSE,
5>=5,
5.2 = 5.20000,
NULL = 1,
NULL = NULL;

SELECT qty<=3 FROM tr_penjualan_dqlab;

-- FUNGSI
SELECT 
POW(3,2), ROUND(3.14), ROUND(3.54), 
ROUND(3.155,1), ROUND(3.155,2), floor(4.28), 
floor(4.78), ceiling(4.39), ceiling(4.55);

-- Fungsi Tanggal
SELECT NOW(), 
Year(now()),
DATEDIFF(now(), '2004-05-05'),
day('2004-05-05');

-- LATIHAN MANDIRI
SELECT 
DATEDIFF('2022-07-23', NOW()),
YEAR('2022-07-23'),
MONTH('2022-07-23'),
DAY ('2022-07-23'),
YEAR(NOW());

-- Menampilkan selisih transaksi terakhir dengan tanggal saat ini
SELECT 
DATEDIFF(NOW(), tgl_transaksi) AS selisih_hari
from 
	tr_penjualan_dqlab;

-- WHERE Statement
-- Mengambil nama produk dan quantity nya yang lebih dari 3
SELECT 
	nama_produk, qty 
from
	tr_penjualan_dqlab
WHERE 
	qty > 3;

-- Mengambil nama_produk, qty, yang qty > 3, dan transaksi bulan 6
SELECT 
	nama_produk, qty 
FROM 
	tr_penjualan_dqlab 
WHERE 
	qty>3 and month(tgl_transaksi) = 6;
	
-- Mengambil nama_produk , qty dengan nama tertentu
SELECT 
	nama_produk, qty
FROM
	tr_penjualan_dqlab
WHERE 
	nama_produk = 'Flashdisk DQLab 32 GB';

-- LIKE
-- Mengambil nama produk yang berawalan dengan huruf 'f'
SELECT nama_produk from tr_penjualan_dqlab WHERE nama_produk like'f%';
-- latihan mandiri
SELECT nama_produk from tr_penjualan_dqlab WHERE nama_produk like'_a%';
SELECT nama_produk from ms_produk_dqlab mpd  WHERE nama_produk like'%t%';
SELECT nama_produk from ms_produk_dqlab mpd  WHERE nama_produk like'&un%';

-- Operator Logika
-- filtering dengan operator logika and
SELECT nama_produk from tr_penjualan_dqlab WHERE nama_produk LIKE 'f%'and qty > 2;
SELECT nama_produk from tr_penjualan_dqlab WHERE nama_produk LIKE 'f%'or qty > 2;
