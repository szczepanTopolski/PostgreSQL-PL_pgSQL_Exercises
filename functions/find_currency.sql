CREATE OR REPLACE FUNCTION find_currency(account_id INTEGER)
RETURNS INTEGER AS $$
DECLARE
currency_id INTEGER;
BEGIN
	SELECT a.currency_id INTO currency_id FROM ACCOUNT AS a WHERE a.id = account_id;
	RETURN currency_id;
END $$
LANGUAGE plpgsql;