use ecotech;
DELIMITER $$
CREATE PROCEDURE sp_ecotech_operaciones_busqueda(
    IN  i_operacion       VARCHAR(3),
    IN i_search_int       INT       ,
    IN i_search_var       VARCHAR(10) 
)
BEGIN
    
    -- -------------------------------
    -- operaciones para cursos 
    -- -------------------------------
    
    -- operacion para obtener todos los curso
    IF  i_operacion = '1' THEN
        SELECT * FROM eco_tech_cursos ;
    END IF;

	-- operacion para obtener cursos especifico 
	IF  i_operacion = '2' THEN
        SELECT * FROM eco_tech_cursos 
        WHERE cur_id = i_search_int;
    END IF;
    
    -- operacion para obtener todos los curso por categoria
    IF  i_operacion = '3' THEN
        SELECT * FROM eco_tech_cursos 
        WHERE cur_categoria = i_search_var;
    END IF;
   
   -- operacion para obtener cursos creado por usuario
	IF  i_operacion = '4' THEN
        SELECT * FROM eco_tech_cursos 
        WHERE cur_usuario = i_search_int;
    END IF;
    
    -- -------------------------------
    -- operaciones para modulos
    -- -------------------------------
    
   -- operacion para obtener modulo 
    IF  i_operacion = '5' THEN
        SELECT * FROM eco_tech_modulos
        WHERE mod_id =  i_search_int ;
    END IF;
    
    -- operacion para obtener modulo por curso
    IF  i_operacion = '6' THEN
        SELECT * FROM eco_tech_modulos
        WHERE mod_id_curso =  i_search_int ;
    END IF;
    
	-- ---------------------------------------------
    -- operaciones para obtener archivos por modulos
    -- ---------------------------------------------
    
    -- operacion para obtener archivos por modulos
    IF  i_operacion = '7' THEN
        SELECT * FROM eco_tech_documentos , 
                      eco_tech_formulario ,
                      eco_tech_videos          
        WHERE doc_modulo   =  i_search_int 
        AND   form_modulo  =  i_search_int
        AND   vi_id_modulo =  i_search_int
        ORDER BY doc_fecha_creacion , form_fecha_creacion, 
				 vi_fecha_creacion; 
    END IF;
    
	-- ------------------------------------
    -- operaciones para obtener subscritos 
    -- ------------------------------------
    
	-- operaciones para obtener subscritos a curso 
    IF  i_operacion = '8' THEN
        SELECT * FROM eco_tech_subscripciones
        WHERE sub_id_curso =  i_search_int ;
    END IF;
    
END $$

DELIMITER ;
