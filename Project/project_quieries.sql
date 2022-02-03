-- Task 1
-- 1
SELECT sender_id FROM package INNER JOIN truck ON package_id=pack_id WHERE status='Unsuccessful';
-- 2
SELECT recipient_id FROM (package INNER JOIN shipment ON package_id=shipment.pack_id) INNER JOIN truck ON package_id=truck.pack_id
WHERE status='Unsuccessful';

--Task 2
SELECT max(cnt) FROM (SELECT count(sender_id) AS cnt FROM package WHERE sending_date_time > '2019-12-31 23:59:59'
            AND sending_date_time<'2020-12-31 23:59:59' GROUP BY sender_id) AS max1;

-- Task 3
SELECT max(cnt) FROM (SELECT sum(ship_price) AS cnt FROM package AS cnt GROUP BY sender_id) AS max1;

-- Task 4(-)


-- Task 5
SELECT pack_id FROM location WHERE executed_regulations = FALSE;

-- Task 6(-)
