use ecotech;

CREATE TABLE eco_tech_subscripciones (
    sub_id             INT          AUTO_INCREMENT PRIMARY KEY,
    sub_id_curso       INT          ,
    sub_id_usuario     INT          ,  -- usuario subscrito al curso
    sub_estado         VARCHAR(3)   DEFAULT 'ACT',
	FOREIGN KEY (sub_id_curso)   REFERENCES eco_tech_cursos(cur_id) ON DELETE CASCADE,
    FOREIGN KEY (sub_id_usuario) REFERENCES eco_tech_usuario(us_id) ON DELETE CASCADE
);

ALTER TABLE eco_tech_subscripciones AUTO_INCREMENT = 3000;