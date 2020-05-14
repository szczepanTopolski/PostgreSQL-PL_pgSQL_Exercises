CREATE OR REPLACE PROCEDURE public.fill_addresses(
	a character)
LANGUAGE 'plpgsql'

AS $BODY$
DECLARE
    iterator INTEGER := 1;
BEGIN
    RAISE NOTICE '%', a;
    WHILE iterator < 20000
    LOOP
    iterator := iterator + 1;
    IF NOT EXISTS (SELECT * FROM address WHERE id = iterator) THEN
       INSERT INTO address (id, zip_code, city, street, local_number )VALUES (iterator, 'Zip 123', 'Miastko', 'Ulica fajna', '33456676');
    END IF;
    end loop;
END; $BODY$;