CREATE OR REPLACE VIEW pln_to_eur_fluctuation_over_year_VIEW AS
SELECT DISTINCT ON (date) date, rate FROM EXCHANGE_RATE
WHERE date > now()::date - 365 AND base_currency_id = (SELECT id FROM CURRENCY WHERE name = 'PLN') AND target_currency_id = (SELECT id FROM CURRENCY WHERE name = 'EUR')
ORDER BY date desc;


CREATE OR REPLACE VIEW pln_to_eur_fluctuation_over_month_VIEW AS
SELECT DISTINCT ON (date) date, rate FROM EXCHANGE_RATE
WHERE date > CURRENT_DATE - INTERVAL '1 month' AND base_currency_id = (SELECT id FROM CURRENCY WHERE name = 'PLN') AND target_currency_id = (SELECT id FROM CURRENCY WHERE name = 'EUR')
ORDER BY date desc;


