--(a)
CREATE VIEW view1 AS
    SELECT SUM(amount), AVG(amount), date
    FROM sell GROUP BY sell.date;

CREATE VIEW view2 AS
    SELECT COUNT(id)
    FROM client;

CREATE VIEW view3 AS
    SELECT count(DISTINCT sell.client_id), sell.date, AVG(sell.amount), SUM(sell.amount)
    FROM(sell INNER JOIN client ON client.id=sell.client_id)
    GROUP BY date;

--(b)
CREATE VIEW top AS
    SELECT SUM(amount), date
    FROM sell
    GROUP BY date
    ORDER BY SUM DESC
    LIMIT 5;

--(c)(-)

--(d)
CREATE VIEW dealer_sales AS
    SELECT dealer.id, city, SUM(amount) * charge AS total_sum
    FROM (dealer INNER JOIN client ON dealer.id = client.dealer_id) INNER JOIN sell ON sell.dealer_id=dealer.id AND sell.client_id=client.id
    GROUP BY dealer.id, city, charge;

--(e)
CREATE VIEW dealer_salary AS
    SELECT dealer.id, city, COUNT(sell.dealer_id), AVG(amount),SUM(amount)
    FROM (dealer INNER JOIN client ON dealer.id = client.dealer_id) INNER JOIN sell ON sell.dealer_id=dealer.id AND sell.client_id=client.id
    GROUP BY dealer.id,city;

--(f)
CREATE VIEW sales AS
    SELECT city, COUNT(sell.client_id), AVG(priority), SUM(priority)
    FROM client INNER JOIN sell ON client.id = sell.client_id
    GROUP BY city;

--(g)(-)

