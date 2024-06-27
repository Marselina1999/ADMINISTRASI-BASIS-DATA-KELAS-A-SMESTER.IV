-- Nama : Marselina Bulu
-- Nim : 22241019
-- Modul 5

-- menggunakan database
use mart_undikma;

-- Join
-- Tampilkan data nama pelanggan dan qty belanjanya
SELECT mp.nama_pelanggan, tp.qty 
FROM tr_penjualan_dqlab AS tp JOIN ms_pelanggan_dqlab AS mp
ON tp.kode_pelanggan = mp.kode_pelanggan;

-- join tanpa filtering on = cross join
SELECT mp.nama_pelanggan, tp.qty 
FROM tr_penjualan_dqlab AS tp JOIN ms_pelanggan_dqlab AS mp
ON true;

-- INNER JOIN
SELECT mp.nama_pelanggan, tp.qty 
FROM tr_penjualan_dqlab AS tp INNER JOIN ms_pelanggan_dqlab AS mp
ON tp.kode_pelanggan = mp.kode_pelanggan;

-- LEFT OUTER JOIN
SELECT mp.nama_pelanggan, tp.qty 
FROM tr_penjualan_dqlab AS tp LEFT JOIN ms_pelanggan_dqlab AS mp
ON tp.kode_pelanggan = mp.kode_pelanggan;

-- RIGHT OUTER JOIN
SELECT mp.nama_pelanggan, tp.qty 
FROM tr_penjualan_dqlab AS tp RIGHT JOIN ms_pelanggan_dqlab AS mp
ON tp.kode_pelanggan = mp.kode_pelanggan;
-- TAMPILKAN PELANGGAN YANG TIDAK PERNAH BELANJA
SELECT mp.nama_pelanggan, tp.qty 
FROM tr_penjualan_dqlab AS tp RIGHT JOIN ms_pelanggan_dqlab AS mp
ON tp.kode_pelanggan = mp.kode_pelanggan
WHERE tp.qty IS NULL;

-- JOIN 3 TABEL
SELECT tp.kode_pelanggan, mp.nama_pelanggan, mpd.kategori_produk, mpd.nama_produk, tp.qty
FROM ms_pelanggan_dqlab AS mp LEFT OUTER JOIN tr_penjualan_dqlab AS tp
ON mp.kode_pelanggan = tp.kode_pelanggan
LEFT OUTER JOIN ms_produk_dqlab AS mpd
ON mpd.kode_produk = tp.kode_produk;

-- ORDER BY PADA JOIN
-- URUTKAN BERDASARKAN QTY BESAR KE KECIL
SELECT tp.kode_pelanggan, mp.nama_pelanggan, mpd.kategori_produk, mpd.nama_produk, tp.qty
FROM ms_pelanggan_dqlab AS mp LEFT OUTER JOIN tr_penjualan_dqlab AS tp
ON mp.kode_pelanggan = tp.kode_pelanggan
LEFT OUTER JOIN ms_produk_dqlab AS mpd
ON mpd.kode_produk = tp.kode_produk
ORDER BY qty DESC;
-- URUTKAN BERDASARKAN QTY KECIL KE BESAR
SELECT tp.kode_pelanggan, mp.nama_pelanggan, mpd.kategori_produk, mpd.nama_produk, tp.qty
FROM ms_pelanggan_dqlab AS mp LEFT OUTER JOIN tr_penjualan_dqlab AS tp
ON mp.kode_pelanggan = tp.kode_pelanggan
LEFT OUTER JOIN ms_produk_dqlab AS mpd
ON mpd.kode_produk = tp.kode_produk
ORDER BY qty ASC;

-- GROUPING DAN PUNGSI AGREGASI
-- menampilkan summery total produk terjual
SELECT mpd.kategori_produk, mpd.nama_produk, sum(tp.qty) AS jml_produk_terjual
FROM ms_produk_dqlab AS mpd LEFT JOIN tr_penjualan_dqlab AS tp
ON mpd.kode_produk = tp.kode_produk
GROUP BY mpd.kategori_produk, mpd.nama_produk
ORDER BY sum(tp.qty) DESC;