-- task 1
--(a)
SELECT * FROM dealer, client;

--(b)
SELECT dealer.id, client.name, client.city, sell.id, sell.amount, sell.date, dealer.charge
FROM(dealer INNER JOIN client ON dealer.id = client.dealer_id) INNER JOIN sell ON dealer.id = client.dealer_id AND
                                                                                   client.id = sell.client_id;
--(c)
SELECT dealer.id, dealer.name, client.id, client.name FROM(dealer INNER JOIN client ON client.city = dealer.location);

--(d)
SELECT sell.id, sell.amount, client.name, client.city FROM(sell INNER JOIN client ON sell.amount > 100 AND sell.amount < 500);

--(e)
SELECT id, name FROM dealer;

--(f)
SELECT dealer.id, dealer.name, client.id, client.name, dealer.charge FROM(dealer INNER JOIN client ON dealer.id = client.dealer_id);

--(g)
SELECT dealer.id, dealer.charge, client.name, client.city FROM(dealer INNER JOIN client ON dealer.charge>0.12 AND dealer.id=client.dealer_id);

--(h)
SELECT client.name, client.city, sell.id, sell.date, sell.amount, dealer.name, dealer.charge FROM
(dealer INNER JOIN client ON dealer.id=client.dealer_id)INNER JOIN sell ON dealer.id=sell.dealer_id AND client.id=sell.client_id;

--right inner join  -- left outer join

--(i)(-)


