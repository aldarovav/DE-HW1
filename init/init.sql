CREATE SCHEMA IF NOT EXISTS stg;

CREATE TABLE IF NOT EXISTS stg.cbr_rates (
    id SERIAL PRIMARY KEY,
    record_date DATE NOT NULL,
    currency_code VARCHAR(10) NOT NULL,
    currency_name VARCHAR(100) NOT NULL,
    nominal INT NOT NULL,
    value NUMERIC(10, 4) NOT NULL,
    loaded_at TIMESTAMP DEFAULT NOW(),
    UNIQUE (record_date, currency_code)
);

CREATE INDEX IF NOT EXISTS idx_cbr_rates_date ON stg.cbr_rates(record_date);