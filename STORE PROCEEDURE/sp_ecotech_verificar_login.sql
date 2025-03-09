use ecotech;
DELIMITER $$
CREATE PROCEDURE sp_ecotech_verificar_login(
    IN  i_us_name       VARCHAR(15),
    IN  i_us_contrasena VARCHAR(100),
    OUT o_resultado     VARCHAR(4),
    OUT o_rol           VARCHAR(3),
    OUT o_is_user       INT
)
BEGIN
    -- Inicializar el resultado y rol
    SET o_resultado = '0000';
    SET o_rol = '';

    -- validacion
    SELECT us_rol , us_id INTO o_rol , o_is_user  
    FROM   eco_tech_usuario
    WHERE  us_name = i_us_name 
    AND    us_contrasena = i_us_contrasena
    LIMIT 1;

    -- Si se encuentra un usuario, establecer el resultado como '0001'(éxito)
    IF o_rol != '' THEN
        SET o_resultado = '0001';
    END IF;
END $$

DELIMITER ;









