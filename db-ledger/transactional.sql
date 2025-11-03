DROP TABLE IF EXISTS ledger;

CREATE TABLE IF NOT EXISTS ledger
(
    id INT UNIQUE,
    sender INT,
    recipient INT,
    value INT
);

INSERT INTO ledger (id, sender, recipient, value) VALUES
(1, 101, 102, 60),
(2, 102, 103, 40),
(3, 103, 101, 20);

WITH Accounts AS
(
	SELECT DISTINCT sender AS account FROM Ledger
	UNION
	SELECT DISTINCT recipient AS account FROM Ledger
),
Sums AS
(
	SELECT
	account,
	(SELECT SUM(value) FROM ledger WHERE recipient = account) AS received,
	(SELECT SUM(value) FROM ledger WHERE sender = account) AS sent
	FROM Accounts
)
SELECT
account,
received,
sent,
received - sent AS balance
FROM Sums;