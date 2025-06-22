-- 1. film tablosunda film uzunluğu (length) sütununda gösterilmektedir. Uzunluğu ortalama film uzunluğundan fazla kaç tane film vardır?
SELECT COUNT(*)
FROM film
WHERE length > (SELECT AVG(length) FROM film);

---

-- 2. film tablosunda en yüksek rental_rate değerine sahip kaç tane film vardır?
SELECT COUNT(*)
FROM film
WHERE rental_rate = (SELECT MAX(rental_rate) FROM film);

---

-- 3. film tablosunda en düşük rental_rate ve en düşük replacement_cost değerlerine sahip filmleri sıralayınız.
SELECT *
FROM film
WHERE rental_rate = (SELECT MIN(rental_rate) FROM film)
AND replacement_cost = (SELECT MIN(replacement_cost) FROM film);

---

-- 4. payment tablosunda en fazla sayıda alışveriş yapan müşterileri (customer) sıralayınız.
SELECT customer_id, COUNT(customer_id) AS alisveris_sayisi
FROM payment
GROUP BY customer_id
ORDER BY alisveris_sayisi DESC
LIMIT (SELECT COUNT(customer_id) FROM payment GROUP BY customer_id ORDER BY COUNT(customer_id) DESC LIMIT 1);
-- Not: Bu sorgu, en çok alışveriş yapan müşteri sayısını bulup, o sayıya eşit veya daha fazla alışveriş yapan tüm müşterileri listeler.
-- Eğer sadece tek bir müşteriyi (veya birden fazla müşteri en yüksek aynı değere sahipse) istiyorsanız LIMIT 1 kullanabilirsiniz.