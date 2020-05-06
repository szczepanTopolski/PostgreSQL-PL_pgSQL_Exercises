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
	UPDATE ACCOUNT SET balance = balance - charge_amount WHERE id = id_from;
	UPDATE ACCOUNT SET balance = balance + amount WHERE id = id_target;
    INSERT INTO TRANSACTION(from_account_id,to_account_id,amount,date)
	VALUES(id_from,id_target,amount,date(now()));
	IF (charge_amount <= 0 or amount <= 0) THEN
		RAISE WARNING 'Exchange rate for this transfer is unavailable.';
		RAISE EXCEPTION 'Amount must be greater than 0.'
		USING HINT = 'Insert amount greater than 0.';
		ROLLBACK;
		RETURN;
	END IF;
    COMMIT;
 END ;$$
 LANGUAGE plpgsql;