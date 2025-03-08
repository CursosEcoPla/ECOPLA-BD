use ecotech;

CREATE TABLE eco_tech_formulario (
    form_id               INT          AUTO_INCREMENT ,
    form_curso            INT          ,
    form_modulo           INT          , 
    form_nombre           VARCHAR(100) ,
    form_descripcion      VARCHAR(255) ,
    form_url              VARCHAR(255) NOT NULL,
    form_fecha_creacion   DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (form_id , form_curso, form_modulo),
    FOREIGN KEY (form_curso)  REFERENCES eco_tech_cursos(cur_id)   ON DELETE CASCADE,
    FOREIGN KEY (form_modulo) REFERENCES eco_tech_modulos(mod_id ) ON DELETE CASCADE  
);

ALTER TABLE eco_tech_formulario AUTO_INCREMENT = 4000;
