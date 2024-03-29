CREATE FUNCTION getCurrUserSpacesuitData(user_id integer)
    RETURNS TABLE (
        user_spacesuit_data_id integer
        ) AS
$$
BEGIN
RETURN QUERY
SELECT user_spacesuit_data.user_spacesuit_data_id
FROM user_spacesuit_data WHERE user_spacesuit_data.user_spacesuit_data_id = user_id;
END
$$
LANGUAGE plpgsql;