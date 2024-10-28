# Estrutura das Tabelas, dados fictícios de pacientes, MySQL

CREATE TABLE TB_PACIENTE (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    data_nascimento DATE NOT NULL,
    sexo ENUM('Masculino', 'Feminino', 'Outro') NOT NULL,
    data_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO TB_PACIENTE (nome, data_nascimento, sexo)
VALUES 
    ('Ana Silva', '1990-05-14', 'Feminino'),
    ('Carlos Pereira', '1985-11-20', 'Masculino'),
    ('Juliana Almeida', '1992-01-30', 'Feminino'),
    ('Rafael Santos', '1987-07-17', 'Masculino'),
    ('Mariana Costa', '2000-03-22', 'Outro');

CREATE TABLE TB_DIAGNOSTICO (
    id INT AUTO_INCREMENT PRIMARY KEY,
    paciente_id INT,
    data_diagnostico DATE NOT NULL,
    descricao TEXT NOT NULL,
    FOREIGN KEY (paciente_id) REFERENCES TB_PACIENTE(id) ON DELETE CASCADE
);
INSERT INTO TB_DIAGNOSTICO (paciente_id, data_diagnostico, descricao)
VALUES 
    (1, '2023-01-15', 'Paciente apresentou sintomas de ansiedade leve. Recomendada terapia semanal.'),
    (2, '2023-02-18', 'Diagnóstico de depressão moderada. Início de tratamento com antidepressivo.'),
    (3, '2023-03-22', 'Sintomas compatíveis com estresse pós-traumático. Recomendada terapia cognitivo-comportamental.'),
    (4, '2023-04-25', 'Identificado TDAH. Sugestão de abordagem medicamentosa e terapêutica combinada.'),
    (1, '2023-06-10', 'Reavaliação de ansiedade. Paciente mostra melhora, mas segue em tratamento.'),
    (3, '2023-07-05', 'Reavaliação de estresse pós-traumático, com progresso positivo na terapia.');

CREATE TABLE TB_PROGNOSTICO ( 
    id INT AUTO_INCREMENT PRIMARY KEY,
    diagnostico_id INT,
    data_prognostico DATE NOT NULL,
    descricao TEXT NOT NULL,
    FOREIGN KEY (diagnostico_id) REFERENCES TB_DIAGNOSTICO(id) ON DELETE CASCADE
);

INSERT INTO TB_PROGNOSTICO (diagnostico_id, data_prognostico, descricao)
VALUES 
    (1, '2023-08-15', 'Paciente com boa resposta ao tratamento inicial, recomendado acompanhamento trimestral.'),
    (2, '2023-09-10', 'Prognóstico positivo, possível alta em 6 meses caso mantenha progresso.'),
    (3, '2023-10-05', 'Estresse ainda presente, mas com redução significativa nos sintomas.'),
    (4, '2023-10-20', 'TDAH sob controle com tratamento combinado, paciente com boa adaptação.'),
    (1, '2023-11-01', 'Paciente mantém progresso, com sintomas de ansiedade bem reduzidos.');

CREATE TABLE TB_TRATAMENTO ( 
    id INT AUTO_INCREMENT PRIMARY KEY,
    paciente_id INT,
    data_tratamento DATE NOT NULL,
    descricao TEXT NOT NULL,
    FOREIGN KEY (paciente_id) REFERENCES TB_PACIENTE(id) ON DELETE CASCADE
);
INSERT INTO TB_TRATAMENTO (paciente_id, data_tratamento, descricao)
VALUES 
    (1, '2023-07-01', 'Sessão inicial de terapia cognitivo-comportamental para ansiedade.'),
    (2, '2023-07-15', 'Início de tratamento com sertralina para depressão moderada.'),
    (3, '2023-08-01', 'Sessão de terapia para gerenciamento de estresse.'),
    (4, '2023-08-15', 'Primeira sessão de orientação para TDAH, recomendação de medicação.'),
    (1, '2023-08-30', 'Terapia de acompanhamento para ansiedade, paciente mostra progresso.');


