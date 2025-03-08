use ecotech;

CREATE TABLE eco_tech_cursos (
    cur_id             INT          AUTO_INCREMENT,
    cur_usuario        INT          , -- usuario creador del curso
    cur_titulo         VARCHAR(100) ,
    cur_descripcion    VARCHAR(500) ,
    cur_categoria      VARCHAR(20)  ,
    PRIMARY KEY (cur_id ),
    FOREIGN KEY (cur_usuario) REFERENCES eco_tech_usuario(us_id) ON DELETE CASCADE
);

ALTER TABLE eco_tech_cursos AUTO_INCREMENT = 2000;


