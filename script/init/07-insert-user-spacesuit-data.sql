create function insert_user_spacesuit_data(head integer, chest integer, waist integer, hips integer, foot_size integer, height integer, fabric_texture_id integer, user_id integer) returns integer
    language plpgsql
as
$$
DECLARE
inserted_id INT;
BEGIN
    -- Вставка данных в таблицу "user_spacesuit_data"
INSERT INTO user_spacesuit_data (head, chest, waist, hips, foot_size, height, fabric_texture_id)
VALUES (head, chest, waist, hips, foot_size, height, fabric_texture_id)
    RETURNING user_spacesuit_data_id INTO inserted_id;

-- Обновление связи с пользователем
UPDATE users SET user_spacesuit_data_id = inserted_id WHERE id = user_id;

-- Возвращаем ID вставленной строки
RETURN inserted_id;
END;
$$;

alter function insert_user_spacesuit_data(integer, integer, integer, integer, integer, integer, integer, integer) owner to postgres;

