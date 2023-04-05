
--ex 2
CREATE OR REPLACE FUNCTION criar_cirurgia(
    data_cirurgia DATE,
    descricao_cirurgia character varying(255),
    codigo_paciente char(10),
    codigo_cirurgia char(10)
)
RETURNS void
AS $$
DECLARE
    paciente_id INTEGER;
BEGIN
    -- Verificar se o paciente existe
    SELECT id_paciente INTO paciente_id FROM paciente WHERE codigo = codigo_paciente;
    
    IF NOT FOUND THEN
        RAISE EXCEPTION 'Paciente com codigo % não encontrado', codigo_paciente;
    END IF;
    
    -- Criar a cirurgia
   INSERT INTO cirurgia (codigo, data_cirurgia, descricao, id_paciente)
VALUES (codigo_cirurgia, data_cirurgia, descricao_cirurgia, paciente_id);

END;
$$
LANGUAGE plpgsql;

DROP FUNCTION criar_cirurgia(date,character varying,character,character)
SELECT criar_cirurgia('2023-04-05'::DATE, 'cirurgia de joelho'::VARCHAR, 'PAC002'::CHAR(10), 'CIR006'::CHAR(10));
