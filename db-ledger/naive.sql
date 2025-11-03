DROP TABLE IF EXISTS ledger;

CREATE TABLE IF NOT EXISTS ledger
(
    name TEXT UNIQUE,
    value INT
);

INSERT INTO ledger (name, balance) VALUES
("Alice", 100),
("Bob", 50),
("Charlie", 20);