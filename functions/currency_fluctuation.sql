CREATE OR REPLACE FUNCTION currency_fluctuation(base_currency_name TEXT, target_currency_name TEXT, date_from DATE, date_to DATE) returns TABLE (date DATE, rate DECIMAL(3,2)) AS $$
BEGIN
    RETURN QUERY SELECT DISTINCT ON (ex.date) ex.date, ex.rate FROM EXCHANGE_RATE AS ex
                 WHERE base_currency_id = (SELECT id FROM CURRENCY WHERE name = base_currency_name)
                   AND target_currency_id = (SELECT id FROM CURRENCY WHERE name = target_currency_name)
                   AND ex.date between date_from AND date_to;
END $$
LANGUAGE plpgsql;