
use ecotech;

CREATE TABLE eco_tech_modulos (
    mod_id             INT          AUTO_INCREMENT PRIMARY KEY, 
    mod_id_curso       INT          ,
    mod_titulo         VARCHAR(100) ,
    mod_descripcion    VARCHAR(500) ,
    FOREIGN KEY (mod_id_curso) REFERENCES eco_tech_cursos(cur_id) ON DELETE CASCADE
);

ALTER TABLE eco_tech_modulos AUTO_INCREMENT = 5000;