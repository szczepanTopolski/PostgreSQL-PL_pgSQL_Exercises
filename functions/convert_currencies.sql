create function convert_currencies(original_currency integer, target_currency integer, amount integer, transaction_date date) returns integer
    language plpgsql
as
$$
DECLARE
    conversion_rate float;
BEGIN
    SELECT rate INTO conversion_rate FROM exchange_rate
    WHERE date < transaction_date AND base_currency_id = original_currency AND target_currency_id = target_currency
    ORDER BY date DESC
    LIMIT 1;
    RETURN amount * conversion_rate;
END;
$$;