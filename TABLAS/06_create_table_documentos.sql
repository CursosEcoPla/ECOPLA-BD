use ecotech_data ;

CREATE TABLE eco_tech_documentos (
    doc_id                INT          AUTO_INCREMENT,
    doc_curso             INT          ,
    doc_modulo            INT          , 
    doc_nombre            VARCHAR(100) ,
    doc_descripcion       VARCHAR(255) ,
    doc_url               VARCHAR(255) NOT NULL,
    doc_fecha_creacion    DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (doc_id , doc_curso, doc_modulo),
    FOREIGN KEY (doc_curso)  REFERENCES  eco_tech_cursos(cur_id)  ON DELETE CASCADE,
	FOREIGN KEY (doc_modulo) REFERENCES eco_tech_modulos(mod_id ) ON DELETE CASCADE
);

ALTER TABLE eco_tech_documentos AUTO_INCREMENT = 3000;