CREATE OR REPLACE PROCEDURE change_contact_information(client_id INTEGER, phone TEXT, code TEXT, city_name TEXT, street_name TEXT, local_number_value TEXT) AS $$
BEGIN
    UPDATE ADDRESS SET zip_code = code, city = city_name, street = street_name, local_number = local_number_value WHERE id = (SELECT address_id FROM CLIENT WHERE  id = client_id);
	UPDATE CLIENT SET phone_number = phone WHERE id = client_id;
    COMMIT;
 END $$
 LANGUAGE plpgsql;
