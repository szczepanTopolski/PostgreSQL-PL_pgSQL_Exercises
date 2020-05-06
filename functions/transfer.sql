CREATE OR REPLACE PROCEDURE transfer(id_from INTEGER, id_target INTEGER, amount INTEGER) AS $$
DECLARE 
from_currency INTEGER;
 target_currency INTEGER; 
 charge_amount INTEGER;
BEGIN
    from_currency := find_currency(id_from);
    target_currency := find_currency(id_target);
    charge_amount := convert_currencies(id_from,id_target,amount,date(now())-1);
	raise NOTICE 'fc =%, tc=% ca=%',from_currency,target_currency,charge_amount;
    commit;
 END ;$$
 LANGUAGE plpgsql;