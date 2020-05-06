CREATE OR REPLACE FUNCTION get_address_id(zip_code TEXT, city TEXT, street TEXT, local_number TEXT) RETURNS INTEGER AS $$
DECLARE
address_id INTEGER;
BEGIN
	SELECT a.id INTO address_id FROM ADDRESS as a WHERE a.zip_code = zip_code AND a.city = city AND a.street = street AND a.local_number = local_number;
	return address_id;
END $$
LANGUAGE plpgsql;


CREATE OR REPLACE PROCEDURE change_contact_information((client_id INTEGER, phone_number TEXT, zip_code TEXT, city TEXT, street TEXT, local_number TEXT) AS $$
DECLARE
address_id INTEGER;
BEGIN
    INSERT INTO ADDRESS (zip_code, city, street, local_number) VALUES (zip_code, city, street, local_number);
    address_id := get_address_id(zip_code, city, street, local_number);
	UPDATE CLIENT SET CLIENT.phone_number = phone_number WHERE CLIENT.id = client_id;
	UPDATE CLIENT SET CLIENT.address_id = address_id WHERE CLIENT.id = client_id;
    COMMIT;
 END $$
 LANGUAGE plpgsql;



