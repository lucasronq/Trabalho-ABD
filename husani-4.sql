--ex 4
CREATE OR REPLACE FUNCTION verifica_data_cirurgia() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.data_cirurgia < CURRENT_DATE THEN
        RAISE EXCEPTION 'Não é possível inserir uma cirurgia com data antiga';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trig_verifica_data_cirurgia BEFORE INSERT ON cirurgia
FOR EACH ROW EXECUTE FUNCTION verifica_data_cirurgia();

SELECT criar_cirurgia('2021-04-05'::DATE, 'cirurgia kk 04'::VARCHAR, 'PAC003'::CHAR(10), 'CIR77887'::CHAR(10));

DROP TRIGGER trig_verifica_data_cirurgia ON cirurgia;


