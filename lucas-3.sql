--ex 3
CREATE OR REPLACE FUNCTION obter_desempenho_medicos(
  data_inicio DATE,
  data_fim DATE
) RETURNS SETOF RECORD AS $$
DECLARE
  registro RECORD;
BEGIN
  FOR registro IN SELECT m.nome, COUNT(a.id_atende)
                 FROM atende a
                 INNER JOIN medico m ON m.id_medico = a.id_medico
                 WHERE a.data BETWEEN data_inicio AND data_fim
                 GROUP BY m.nome
                 ORDER BY COUNT(a.id_atende) DESC
  LOOP
    RETURN NEXT registro;
  END LOOP;
  RETURN;
END;

$$ 
LANGUAGE plpgsql;

SELECT * FROM obter_desempenho_medicos('2022-01-01', '2022-12-31') AS (nome varchar, qtd bigint);

