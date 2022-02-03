-- -- (1)
-- Large objects (photos, videos, CAD files, etc.) are stored as a large object:
-- blob: binary large object --object is a large collection of uninterpreted binary data
-- (whose interpretation is left to an application outside of the database system)
-- clob: character large object --object is a large collection of character data
-- When a query returns a large object, a pointer is returned rather than the large object itself.

--(2)
CREATE ROLE administrator WITH PASSWORD 'admin' LOGIN;
CREATE ROLE accountant WITH PASSWORD 'accountant' LOGIN;
CREATE ROLE support WITH PASSWORD 'support' LOGIN;



GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO administrator;
GRANT UPDATE ON accounts to accountant;
GRANT UPDATE, INSERT, DELETE ON customers, transactions TO support;

CREATE USER "User1";
CREATE USER "User2";
CREATE USER "User3";

GRANT administrator to "User1";
GRANT accountant to "User2";
GRANT support to "User3";

REVOKE UPDATE ON accounts from "User2";

show config_file;


--(3)(-)

--(4)(-)

--(5)
CREATE UNIQUE INDEX cur ON accounts(account_id, currency);
CREATE INDEX index1 ON accounts(currency, balance);

--(6)
BEGIN;

UPDATE accounts SET balance = balance - 20 WHERE account_id IN (SELECT account_id FROM accounts, transactions WHERE account_id = src_account);

UPDATE accounts SET balance = balance + 20 WHERE account_id NOT IN (SELECT account_id FROM accounts, transactions WHERE account_id = src_account);

-- ROLLBACK IF EXISTS(SELECT accounts_id, balance, limit FROM accounts, transactions WHERE accounts_id = src_account, balance < limit);

COMMIT;


