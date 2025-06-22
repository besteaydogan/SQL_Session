-- film tablosunda bulunan replacement_cost sütununda birbirinden farklı değerleri sıralayınız.
SELECT DISTINCT replacement_cost FROM film;

---

-- film tablosunda bulunan replacement_cost sütununda birbirinden farklı kaç tane veri vardır?
SELECT COUNT(DISTINCT replacement_cost) FROM film;

---

-- film tablosunda bulunan film isimlerinde (title) kaç tanesi 'T' karakteri ile başlar ve aynı zamanda rating 'G'ye eşittir?
SELECT COUNT(*) FROM film
WHERE title LIKE 'T%' AND rating = 'G';

---

-- country tablosunda bulunan ülke isimlerinden (country) kaç tanesi 5 karakterden oluşmaktadır?
SELECT COUNT(*) FROM country
WHERE country LIKE '_____'; -- 5 alt çizgi, tam olarak 5 karakter anlamına gelir.

---

-- city tablosundaki şehir isimlerinin kaç tanesi 'R' veya 'r' karakteri ile biter?
SELECT COUNT(*) FROM city
WHERE city ILIKE '%R'; -- ILIKE büyük/küçük harf duyarsız arama yapar.