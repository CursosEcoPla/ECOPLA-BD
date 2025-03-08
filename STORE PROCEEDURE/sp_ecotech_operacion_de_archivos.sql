USE ecotech;

DELIMITER $$

CREATE PROCEDURE sp_ecotech_operador_de_archivos(
    IN   i_operacion_1    VARCHAR(10),  -- 'UPL' = subir, 'DEL' = eliminar
    IN   i_operacion_2    VARCHAR(4),   -- 'VID' = video, 'DOC' = documento, 'FOR' = formulario
    IN   i_id_curso       INT,
    IN   i_arch_id        INT,
    IN   i_arch_id_mod    INT,
    IN   i_arch_titulo    VARCHAR(100),
    IN   i_arch_desc      VARCHAR(255),
    OUT  o_resultado      VARCHAR(4)
)
BEGIN

    DECLARE w_sec      INT;
    DECLARE w_sec_char VARCHAR(10);
    DECLARE w_url      VARCHAR(100);
    DECLARE w_id_curso VARCHAR(10);
    DECLARE w_id_mod   VARCHAR(10);

    -- Convertir los valores de ID a VARCHAR
    SET w_id_curso = CONVERT(i_id_curso, CHAR);
    SET w_id_mod = CONVERT(i_arch_id_mod, CHAR);

    IF i_operacion_1 = 'UPL' THEN  -- Para la operación de subir

        IF i_operacion_2 = 'VID' THEN  -- Subir un video
            -- Obtener el próximo secuencial del video
            SELECT MAX(vi_id_video)
            INTO w_sec
            FROM eco_tech_videos
            WHERE vi_id_curso = i_id_curso;

            -- Si no existe, el valor será NULL, lo manejamos como 0
            IF w_sec IS NULL THEN
                SET w_sec = 0;
            END IF;

            SET w_sec = w_sec + 1;
            SET w_sec_char = CONVERT(w_sec, CHAR);

            -- Armar la ruta de guardado del video
            SET w_url = CONCAT(w_id_curso, '/', w_id_mod, '/', 'VID', '/', w_sec_char);

            -- Insertar el nuevo video en la tabla
            INSERT INTO eco_tech_videos
                (vi_id_curso, vi_id_modulo, vi_titulo, vi_descripcion, vi_url)
            VALUES
                (i_id_curso, i_arch_id_mod, i_arch_titulo, i_arch_desc, w_url);

        ELSEIF i_operacion_2 = 'DOC' THEN  -- Subir un documento
        
            -- Obtener el próximo secuencial del documento
            SELECT MAX(doc_id)
            INTO w_sec
            FROM eco_tech_documentos
            WHERE doc_curso = i_id_curso;

            -- Si no existe, el valor será NULL, lo manejamos como 0
            IF w_sec IS NULL THEN
                SET w_sec = 0;
            END IF;

            SET w_sec = w_sec + 1;
            SET w_sec_char = CONVERT(w_sec, CHAR);

            -- Armar la ruta de guardado del documento
            SET w_url = CONCAT(w_id_curso, '/', w_id_mod, '/', 'DOC', '/', w_sec_char);

            -- Insertar el nuevo documento en la tabla
            INSERT INTO eco_tech_documentos
                (doc_curso, doc_modulo, doc_nombre, doc_descripcion, doc_url)
            VALUES
                (i_id_curso, i_arch_id_mod, i_arch_titulo, i_arch_desc, w_url);
                
        END IF;
    END IF;

    IF i_operacion_1     = 'DEL' THEN  -- Para la operación eliminar
    
        IF i_operacion_2 = 'VID' THEN  -- Eliminar un video
        
		   DELETE FROM eco_tech_videos
           WHERE vid_id_video = i_arch_id
           AND   vi_id_curso  = i_id_curso
           AND   vi_id_modulo = i_arch_id_mod;
           
    ELSEIF i_operacion_2 = 'DOC' THEN  -- Eliminar un documento
    
		   DELETE FROM eco_tech_documentos
           WHERE doc_id       = i_arch_id
           AND   doc_curso    = i_id_curso
           AND   doc_modulo   = i_arch_id_mod;

        END IF;
        
    END IF;

END $$

DELIMITER ;

