USE ecotech;

DELIMITER $$

CREATE PROCEDURE sp_ecotech_registrar_usuario(
    IN  i_us_name        VARCHAR(15),
    IN  i_us_contrasena  VARCHAR(100),
    IN  i_us_nombre      VARCHAR(100),
    IN  i_us_apellido    VARCHAR(100),
    IN  i_us_correo      VARCHAR(100),
    IN  i_us_telefono    VARCHAR(15),
    IN  i_us_rol         VARCHAR(3),
    OUT o_resultado      VARCHAR(4)
)
BEGIN
    -- Declaración de variable para contar registros
    DECLARE v_count INT;

    -- Inicializar el resultado
    SET o_resultado = '0000';

    -- Verificar si el nombre de usuario ya está en uso
    SELECT COUNT(*) INTO v_count
    FROM eco_tech_usuario
    WHERE us_name = i_us_name;

    -- Si el nombre de usuario ya está en uso, establecer el resultado de error
    IF v_count > 0 THEN
        SET o_resultado = '1001'; -- Error: Nombre de usuario ya existe
    ELSE
        -- Verificar si el correo ya está en uso
        SELECT COUNT(*) INTO v_count
        FROM eco_tech_usuario
        WHERE us_correo = i_us_correo;

        -- Si el correo ya está en uso, establecer el resultado de error
        IF v_count > 0 THEN
            SET o_resultado = '1002'; -- Error: Correo ya registrado
        ELSE
            -- Si todo es válido, insertar el nuevo usuario
            INSERT INTO eco_tech_usuario (
                us_name, us_contrasena, us_nombre, us_apellido,
                us_correo, us_telefono, us_rol
            )
            VALUES (
                i_us_name, i_us_contrasena, i_us_nombre, i_us_apellido,
                i_us_correo, i_us_telefono, i_us_rol
            );

            -- Si la inserción fue exitosa, establecer el resultado como '0001' (éxito)
            SET o_resultado = '0001'; -- Registro exitoso
        END IF;
    END IF;
END $$

DELIMITER ;
