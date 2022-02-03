CREATE TABLE customers(
    customer_id INTEGER PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    city VARCHAR(40) NOT NULL,
    street VARCHAR(255) NOT NULL,
    house INTEGER NOT NULL,
    telephone_number VARCHAR(20) NOT NULL
);

INSERT INTO customers (customer_id, customer_name, city, street, house, telephone_number) VALUES (101, 'Evgeny Orlov', 'Almaty', 'Rozybakiyev', 120, '+7 777 987 12 21');
INSERT INTO customers (customer_id, customer_name, city, street, house, telephone_number) VALUES (102, 'Jasmin Kayrzhanova', 'Karagandy', 'Yerubayev', 20, '+7 778 402 41 29');
INSERT INTO customers (customer_id, customer_name, city, street, house, telephone_number) VALUES (105, 'Azamat Tusipbayev', 'Astana', 'Lenin', 205, '+7 701 679 54 65');
INSERT INTO customers (customer_id, customer_name, city, street, house, telephone_number) VALUES (106, 'Kanat Zhanayev', 'Karagandy', 'Buhar Jyrau', 65, '+7 705 248 16 69');
INSERT INTO customers (customer_id, customer_name, city, street, house, telephone_number) VALUES (104, 'Nurlan Omarov', 'Atyrau', 'St. Baytursynov', 10, '+7 700 101 34 91');
INSERT INTO customers (customer_id, customer_name, city, street, house, telephone_number) VALUES (103, 'Juldyz Sovetova', 'Almaty', 'Rozybakiyev', 20, '+7 706 613 11 07');

CREATE TABLE package(
    package_id INTEGER PRIMARY KEY,
    sender_id INTEGER REFERENCES customers(customer_id) NOT NULL,
    package_desc VARCHAR(255),
    hazardous BOOLEAN NOT NULL,
    sending_date_time TIMESTAMP NOT NULL,
    ship_price INTEGER NOT NULL
);

INSERT INTO package (package_id, sender_id, package_desc, hazardous, sending_date_time, ship_price) VALUES (201, 101, NULL, FALSE, '2021-10-05 14:23:59', 900);
INSERT INTO package (package_id, sender_id, package_desc, hazardous, sending_date_time, ship_price) VALUES (206, 102, NULL, FALSE, '2021-12-01 10:05:21', 500);
INSERT INTO package (package_id, sender_id, package_desc, hazardous, sending_date_time, ship_price) VALUES (205, 105, NULL, FALSE, '2020-11-29 15:03:46', 2000);
INSERT INTO package (package_id, sender_id, package_desc, hazardous, sending_date_time, ship_price) VALUES (204, 106, NULL, FALSE, '2020-12-01 20:40:45', 3000);
INSERT INTO package (package_id, sender_id, package_desc, hazardous, sending_date_time, ship_price) VALUES (202, 104, NULL, TRUE, '2020-09-01 00:00:00', 5000);
INSERT INTO package (package_id, sender_id, package_desc, hazardous, sending_date_time, ship_price) VALUES (203, 103, NULL, FALSE, '2021-10-15 12:43:10', 1500);
INSERT INTO package (package_id, sender_id, package_desc, hazardous, sending_date_time, ship_price) VALUES (207, 101, NULL, TRUE, '2020-10-05 14:23:59', 1200);
INSERT INTO package (package_id, sender_id, package_desc, hazardous, sending_date_time, ship_price) VALUES (208, 102, NULL, FALSE, '2020-12-01 10:05:21', 400);
INSERT INTO package (package_id, sender_id, package_desc, hazardous, sending_date_time, ship_price) VALUES (212, 105, NULL, TRUE, '2020-11-29 15:03:46', 600);
INSERT INTO package (package_id, sender_id, package_desc, hazardous, sending_date_time, ship_price) VALUES (209, 106, NULL, FALSE, '2021-12-01 20:40:45', 300);
INSERT INTO package (package_id, sender_id, package_desc, hazardous, sending_date_time, ship_price) VALUES (211, 104, NULL, FALSE, '2020-09-01 00:00:00', 10000);
INSERT INTO package (package_id, sender_id, package_desc, hazardous, sending_date_time, ship_price) VALUES (210, 103, NULL, TRUE, '2021-10-15 12:43:10', 1000);


CREATE TABLE location(
    location_code INTEGER NOT NULL ,
    pack_id INTEGER REFERENCES package(package_id) PRIMARY KEY,
    country VARCHAR(40) NOT NULL,
    city VARCHAR(30) NOT NULL,
    arr_date_time TIMESTAMP,
    executed_regulations BOOLEAN NOT NULL
);

INSERT INTO location (location_code, pack_id, country, city, arr_date_time, executed_regulations) VALUES (304, 202, 'Kazakhstan', 'Astana', '2021-10-07 10:21:24', TRUE);
INSERT INTO location (location_code, pack_id, country, city, arr_date_time, executed_regulations) VALUES (302, 206, 'Kazakhstan', 'Aktau', '2021-12-05 08:06:45', TRUE);
INSERT INTO location (location_code, pack_id, country, city, arr_date_time, executed_regulations) VALUES (301, 205, 'Russia', 'Moscow', '2020-12-01 19:07:25', FALSE);
INSERT INTO location (location_code, pack_id, country, city, arr_date_time, executed_regulations) VALUES (306, 201, 'Kazakhstan', 'Pavlodar', NULL, FALSE);
INSERT INTO location (location_code, pack_id, country, city, arr_date_time, executed_regulations) VALUES (303, 203, 'Kazakhstan', 'Semey', '2020-09-06 23:07:12', TRUE);
INSERT INTO location (location_code, pack_id, country, city, arr_date_time, executed_regulations) VALUES (305, 204, 'Russia', 'Saint-Petersburg', '2021-10-18 15:49:55', TRUE);
INSERT INTO location (location_code, pack_id, country, city, arr_date_time, executed_regulations) VALUES (306, 207, 'Kazakhstan', 'Pavlodar', NULL, FALSE);
INSERT INTO location (location_code, pack_id, country, city, arr_date_time, executed_regulations) VALUES (305, 208, 'Russia', 'Saint-Petersburg', '2021-10-18 15:49:55', TRUE);
INSERT INTO location (location_code, pack_id, country, city, arr_date_time, executed_regulations) VALUES (306, 210, 'Kazakhstan', 'Pavlodar', NULL, FALSE);
INSERT INTO location (location_code, pack_id, country, city, arr_date_time, executed_regulations) VALUES (301, 212, 'Russia', 'Moscow', '2020-12-01 19:07:25', TRUE);
INSERT INTO location (location_code, pack_id, country, city, arr_date_time, executed_regulations) VALUES (301, 209, 'Russia', 'Moscow', '2020-12-03 19:17:25', FALSE);
INSERT INTO location (location_code, pack_id, country, city, arr_date_time, executed_regulations) VALUES (305, 211, 'Russia', 'Saint-Petersburg', '2021-10-21 19:58:21', FALSE);

CREATE TABLE shipment(
    pack_id INTEGER PRIMARY KEY REFERENCES package(package_id),
    sender_id INTEGER NOT NULL REFERENCES customers(customer_id),
    recipient_id INTEGER NOT NULL
);

INSERT INTO shipment (pack_id, sender_id, recipient_id) VALUES (202, 104, 401);
INSERT INTO shipment (pack_id, sender_id, recipient_id) VALUES (206, 102, 405);
INSERT INTO shipment (pack_id, sender_id, recipient_id) VALUES (205, 105, 404);
INSERT INTO shipment (pack_id, sender_id, recipient_id) VALUES (201, 101, 402);
INSERT INTO shipment (pack_id, sender_id, recipient_id) VALUES (203, 103, 403);
INSERT INTO shipment (pack_id, sender_id, recipient_id) VALUES (204, 106, 407);
INSERT INTO shipment (pack_id, sender_id, recipient_id) VALUES (207, 101, 409);
INSERT INTO shipment (pack_id, sender_id, recipient_id) VALUES (208, 102, 406);
INSERT INTO shipment (pack_id, sender_id, recipient_id) VALUES (210, 103, 408);
INSERT INTO shipment (pack_id, sender_id, recipient_id) VALUES (212, 105, 410);
INSERT INTO shipment (pack_id, sender_id, recipient_id) VALUES (209, 106, 411);
INSERT INTO shipment (pack_id, sender_id, recipient_id) VALUES (211, 104, 412);


CREATE TABLE payment_data(
    card_number VARCHAR(19) PRIMARY KEY,
    payment_system VARCHAR(20) NOT NULL,
    cust_id INTEGER references customers(customer_id) NOT NULL,
    card_name VARCHAR(255) NOT NULL,
    card_exp VARCHAR(5),
    cvv_code INTEGER
);

INSERT INTO payment_data (card_number, payment_system, cust_id, card_name, card_exp, cvv_code) VALUES ('4405 2169 2030 8985', 'Visa', 101 , 'Evgeny Orlov', '25/07', 550);
INSERT INTO payment_data (card_number, payment_system, cust_id, card_name, card_exp, cvv_code) VALUES ('5169 4982 2930 9694', 'Mastercard', 106, 'Kanat Zhanayev', '23/05', 885);
INSERT INTO payment_data (card_number, payment_system, cust_id, card_name, card_exp, cvv_code) VALUES ('4405 1258 2030 8825', 'Visa', 104 , 'Nurlan Omarov', '22/12', 203);
INSERT INTO payment_data (card_number, payment_system, cust_id, card_name, card_exp, cvv_code) VALUES ('5169 2971 2930 4569', 'Mastercard', 103 , 'Juldyz Sovetova', '22/02', 203);


CREATE TABLE bank(
  iban VARCHAR(34) PRIMARY KEY,
  client_name VARCHAR(255) NOT NULL,
  cust_id INTEGER references customers(customer_id) NOT NULL
);

INSERT INTO bank (iban, client_name, cust_id) VALUES ('KZ1392183912', 'Azamat Tusipbayev', 105);
INSERT INTO bank (iban, client_name, cust_id) VALUES ('KZ1024832034', 'Jasmin Kayrzhanova', 102);

CREATE TABLE storage(
    storage_id INTEGER NOT NULL,
    pack_id INTEGER REFERENCES package(package_id) PRIMARY KEY,
    storage_tel VARCHAR(20) NOT NULL,
    storage_address VARCHAR(255) NOT NULL,
    arrive_time TIMESTAMP NOT NULL
);

INSERT INTO storage (storage_id, pack_id, storage_tel, storage_address, arrive_time) VALUES (302, 206, '+7 777 218 29 70', 'Aksay 3A, 60', '2021-12-05 08:06:45');

CREATE TABLE airport(
    air_id INTEGER NOT NULL,
    pack_id INTEGER REFERENCES package(package_id) PRIMARY KEY,
    flight_code VARCHAR(5) NOT NULL,
    arrive_time TIMESTAMP NOT NULL
);

INSERT INTO airport (air_id, pack_id, flight_code, arrive_time) VALUES (301, 205, 'K1054', '2020-12-01 19:07:25');
INSERT INTO airport (air_id, pack_id, flight_code, arrive_time) VALUES (301, 212, 'K1054', '2020-12-01 19:07:25');
INSERT INTO airport (air_id, pack_id, flight_code, arrive_time) VALUES (301, 209, 'D1247', '2020-12-03 19:17:25');
INSERT INTO airport (air_id, pack_id, flight_code, arrive_time) VALUES (303, 203, 'H1203', '2020-09-06 23:07:12');
INSERT INTO airport (air_id, pack_id, flight_code, arrive_time) VALUES (305, 204, 'M8276', '2021-10-18 15:49:55');
INSERT INTO airport (air_id, pack_id, flight_code, arrive_time) VALUES (305, 208, 'M8276', '2021-10-18 15:49:55');
INSERT INTO airport (air_id, pack_id, flight_code, arrive_time) VALUES (305, 211, 'G1823', '2021-10-21 19:58:21');

CREATE TABLE truck(
    truck_id INTEGER NOT NULL,
    pack_id INTEGER REFERENCES package(package_id) PRIMARY KEY,
    route_code VARCHAR(5) NOT NULL,
    status VARCHAR(20) NOT NULL,
    arrive_time TIMESTAMP
);

INSERT INTO truck (truck_id, pack_id, route_code, status, arrive_time) VALUES (304, 202, 'M7234', 'Successful', '2021-10-07 10:21:24');
INSERT INTO truck (truck_id, pack_id, route_code, status, arrive_time) VALUES (306, 201, 'Z1257', 'Unsuccessful', NULL);
INSERT INTO truck (truck_id, pack_id, route_code, status, arrive_time) VALUES (306, 207, 'Z1257', 'Unsuccessful', NULL);
INSERT INTO truck (truck_id, pack_id, route_code, status, arrive_time) VALUES (306, 210, 'Z1257', 'Unsuccessful', NULL);