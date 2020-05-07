CREATE OR REPLACE PROCEDURE transfer_from_saving_account(id_from INTEGER,id_target INTEGER, amount INTEGER) AS $$
DECLARE
	account_from_type INTEGER;
	account_target_type INTEGER;
BEGIN
	SELECT account_type_id INTO account_from_type FROM account WHERE id = id_from;
	SELECT account_type_id INTO account_target_type FROM account WHERE id = id_target;
	IF account_from_type = 1 and account_target_type = 2 THEN
		CALL transfer(id_from,id_target,amount);
	ELSE
		RAISE EXCEPTION 'Transfer is imposible'
		USING HINT = 'Try again later';
	END IF;
END; $$
LANGUAGE plpgsql;