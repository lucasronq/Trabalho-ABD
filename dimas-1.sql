CREATE DATABASE trabalhoABD;

CREATE SEQUENCE paciente_id_paciente_seq START 1;
CREATE SEQUENCE medico_id_medico_seq START 1;
CREATE SEQUENCE atende_id_atende_seq START 1;
CREATE SEQUENCE cirurgia_id_cirurgia_seq START 1;



CREATE TABLE paciente (
	id_paciente SERIAL PRIMARY KEY,
  	codigo VARCHAR(10) UNIQUE,
    nome VARCHAR(100) NOT NULL,
    idade INTEGER NOT NULL
);

insert into paciente values (1,'p1', 'dimas', 13);
insert into paciente values (2,'p2', 'carlos', 13);
insert into paciente values (3,'p3', 'caaaaarlos', 15);
insert into paciente values (5,'p5', 'dimasdasd', 16);

INSERT INTO paciente (codigo, nome, idade) VALUES
    ('PAC001', 'João Silva', 35),
    ('PAC002', 'Maria Souza', 45),
    ('PAC003', 'Pedro Santos', 28),
    ('PAC004', 'Juliana Oliveira', 50),
    ('PAC005', 'Lucas Costa', 18);

select * from paciente
drop table paciente;





CREATE TABLE medico (
	id_medico SERIAL PRIMARY KEY,
    crm VARCHAR(10) UNIQUE,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(50) NOT NULL

);

insert into medico values (1,'crm1', 'carlos', 'pediatra');


INSERT INTO medico (crm, nome, especialidade) VALUES
    ('CRM001', 'Dr. Carlos Silva', 'Cardiologia'),
    ('CRM002', 'Dra. Ana Santos', 'Pediatria'),
    ('CRM003', 'Dr. Marcos Oliveira', 'Clínico Geral'),
    ('CRM004', 'Dr. Rafael Costa', 'Ortopedia'),
    ('CRM005', 'Dra. Carla Souza', 'Dermatologia');

select * from medico;
drop table medico;





CREATE TABLE atende (	
	id_atende SERIAL PRIMARY KEY,
    id_paciente INTEGER NOT NULL REFERENCES paciente(id_paciente),
    id_medico INTEGER NOT NULL REFERENCES medico(id_medico),
    data DATE NOT NULL
);
insert into atende values (1,1,1, '23/03/2023');
insert into atende values (3,3,1, '25/05/2025');

INSERT INTO atende (id_paciente, id_medico, data) VALUES
    (1, 3, '2022-01-10'),
    (2, 2, '2022-02-15'),
	(2, 2, '2022-07-15'),
    (3, 1, '2022-03-20'),
    (4, 5, '2022-04-25'),
    (5, 4, '2022-05-30');

drop table atende;
select * from atende;







CREATE TABLE cirurgia (
		id_cirurgia SERIAL PRIMARY KEY,
    codigo VARCHAR(10) UNIQUE,
    data_cirurgia DATE NOT NULL,
    descricao TEXT NOT NULL,
    id_paciente INTEGER NOT NULL REFERENCES paciente(id_paciente)
);



INSERT INTO cirurgia (codigo, data_cirurgia, descricao, id_paciente) VALUES
    ('CIR001', '2022-06-05', 'Cirurgia de apendicite', 1),
    ('CIR002', '2022-07-10', 'Cirurgia de hérnia', 2),
    ('CIR003', '2022-08-15', 'Cirurgia de catarata', 3),
    ('CIR004', '2022-09-20', 'Cirurgia de joelho', 4),
    ('CIR005', '2022-10-25', 'Cirurgia de rinoplastia', 5);

drop table cirurgia;
select * from cirurgia;
