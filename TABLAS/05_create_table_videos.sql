use ecotech;

CREATE TABLE eco_tech_videos (
    vi_id_video          INT          AUTO_INCREMENT,
    vi_id_curso          INT          ,
    vi_id_modulo         INT          ,
    vi_titulo            VARCHAR(100) ,
    vi_descripcion       VARCHAR(255) ,
    vi_url               VARCHAR(255) NOT NULL,
    vi_fecha_creacion    DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (vi_id_video , vi_id_curso,vi_id_modulo),
    FOREIGN KEY (vi_id_curso)  REFERENCES eco_tech_cursos(cur_id)   ON DELETE CASCADE,
	FOREIGN KEY (vi_id_modulo) REFERENCES eco_tech_modulos(mod_id ) ON DELETE CASCADE
    
);

ALTER TABLE eco_tech_videos AUTO_INCREMENT = 2000;
