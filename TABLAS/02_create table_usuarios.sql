use ecotech ;

CREATE TABLE eco_tech_usuario (
    us_id               INT             AUTO_INCREMENT PRIMARY KEY,
    us_name             varchar(15 )    ,
    us_contrasena       VARCHAR(100)    ,
    us_nombre           VARCHAR(100)    NOT NULL,
    us_apellido         VARCHAR(100)    NOT NULL,
    us_correo           VARCHAR(100)    UNIQUE,
    us_telefono         VARCHAR(15)     ,
    us_rol              VARCHAR(3)      -- 'EST' = estudiante
									    -- 'ADM' = administrador
);                                      -- 'PRO' = profesro

ALTER TABLE eco_tech_usuario AUTO_INCREMENT = 1000;

