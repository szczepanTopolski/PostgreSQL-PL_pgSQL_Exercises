CREATE OR REPLACE PROCEDURE transfer(id_from INTEGER, id_target INTEGER, amount INTEGER) AS $$
DECLARE 
from_currency INTEGER;
 target_currency INTEGER; 
 charge_amount INTEGER;
BEGIN
    from_currency := find_currency(id_from);
    target_currency := find_currency(id_target);
    charge_amount := convert_currencies(from_currency,target_currency,amount,date(now())-1);
	RAISE NOTICE 'fc =%, tc=% ca=%',from_currency,target_currency,charge_amount;
	IF (charge_amount > 0) THEN
		UPDATE ACCOUNT SET balance = balance - charge_amount WHERE id = id_from;
	ELSE 
		RAISE WARNING 'Exchange rate for this transfer is unavailable.';
		ROLLBACK;
	END IF;
	IF (amount > 0) THEN
		UPDATE ACCOUNT SET balance = balance + amount WHERE id = id_target;
	ELSE 
		RAISE EXCEPTION 'Amount must be greater than 0.'
		USING HINT = 'Insert amount greater than 0.';
		ROLLBACK;
	END IF;
    COMMIT;
 END ;$$
 LANGUAGE plpgsql;