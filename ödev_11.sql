-- 1. actor ve customer tablolarında bulunan first_name sütunları için tüm verileri sıralayalım (UNION).
SELECT first_name FROM actor
UNION
SELECT first_name FROM customer;

---

-- 2. actor ve customer tablolarında bulunan first_name sütunları için kesişen verileri sıralayalım (INTERSECT).
SELECT first_name FROM actor
INTERSECT
SELECT first_name FROM customer;

---

-- 3. actor ve customer tablolarında bulunan first_name sütunları için ilk tabloda bulunan ancak ikinci tabloda bulunmayan verileri sıralayalım (EXCEPT).
SELECT first_name FROM actor
EXCEPT
SELECT first_name FROM customer;

---

-- Tekrar eden verilerle (ALL operatörü ile):

-- 4. actor ve customer tablolarında bulunan first_name sütunları için tüm verileri sıralayalım (UNION ALL).
SELECT first_name FROM actor
UNION ALL
SELECT first_name FROM customer;

---

-- 5. actor ve customer tablolarında bulunan first_name sütunları için kesişen verileri sıralayalım (INTERSECT ALL).
-- Not: PostgreSQL'de INTERSECT ALL doğrudan desteklenmez, ancak aşağıdaki gibi simüle edilebilir.
-- Ancak, genelde INTERSECT (DISTINCT) yeterlidir ve INTERSECT ALL kullanımı nadirdir.
-- Bu örnekte, PostgreSQL'de doğrudan INTERSECT ALL yerine mantıksal olarak aynı sonucu veren bir yaklaşıma örnek verilmiştir.
SELECT first_name FROM actor
WHERE first_name IN (SELECT first_name FROM customer)
UNION ALL
SELECT first_name FROM customer
WHERE first_name IN (SELECT first_name FROM actor);

---

-- 6. actor ve customer tablolarında bulunan first_name sütunları için ilk tabloda bulunan ancak ikinci tabloda bulunmayan verileri sıralayalım (EXCEPT ALL).
SELECT first_name FROM actor
EXCEPT ALL
SELECT first_name FROM customer;