CREATE OR REPLACE FUNCTION update_user_spacesuit_data_status()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.status = 'READY' THEN
UPDATE user_spacesuit_data
SET status = 'READY'
WHERE user_spacesuit_data_id = NEW.user_spacesuit_data_id;
END IF;

RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_user_spacesuit_data_status_trigger
    AFTER UPDATE ON user_request
    FOR EACH ROW
    EXECUTE FUNCTION update_user_spacesuit_data_status();


-- UPDATE user_request
-- SET status = 'READY' WHERE user_spacesuit_data_id = 1;