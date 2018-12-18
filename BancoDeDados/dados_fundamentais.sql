use cigs_generico;

insert into postograduacao values (1, 'Marechal'),
								  (2, 'General de Exército'),
								  (3, 'General de Divisão'),
								  (4, 'General de Brigada'),
								  (5, 'Coronel'),
								  (6, 'Tenente Coronel'),
								  (7, 'Major'),
								  (8, 'Capitão'),
								  (9, '1º Tenente'),
								 (10, '2º Tenente'),
								 (11, 'Aspirante a Oficial'),
								 (12, 'Subtenente'),
								 (13, '1º Sargento'),
								 (14, '2º Sargento'),
								 (15, '3º Sargento'),
								 (16, 'Cabo'),
								 (17, 'Soldado');

select * from postograduacao;

insert into qas_qms values (1, 'Arma de Infantaria'),
						   (2, 'Arma de Cavalaria'),
						   (3, 'Arma de Artilharia'),
						   (4, 'Arma de Engenharia'),
						   (5, 'Arma de Comunicações'),
						   (6, 'Quadro de Material Bélico'),
						   (7, 'Quadro de Engenheiros Militares'),
						   (8, 'Quadro Auxiliar de Oficiais'),
						   (9, 'Quadro Complementar de Oficiais'),
						  (10, 'Serviço de Intendência'),
						  (11, 'Serviço de Saúde'),
						  (12, 'Serviço de Assistência Religiosa');

select * from qas_qms;

insert into divisaosecao values (1, 'Divisão de Pessoal (S1)'),
							    (2, 'Divisão Administrativa (DA/S4)'),
							    (3, 'Divisão de Ensino (DE)'),
							    (4, 'Divisão de Alunos (Div Al)'),
							    (5, 'Divisão de Doutrina e Pequisa (DDP)'),
							    (6, 'Divisão Veterinária (Div Vet)'),
							    (7, 'Seção de Operações'),
							    (8, 'Seção de Inteligência (S2)'),
							    (9, 'Seção de Tecnologia da Informação (STI)'),
							   (10, 'Companhia de Comando e Serviço (CCSv)'),
							   (11, 'Companhia Auxiliar de Ensino (CAE)'),
							   (12, 'Comunicação Social (Com Soc)'),
							   (13, 'Assessoria Jurídica'),
							   (14, 'Hotel de Trânsito (HT)');

select * from divisaosecao;

insert into escolaridade values (1, 'Ensino Fundamental Completo'),
								(2, 'Ensino Médio Completo'),
								(3, 'Ensino Superior Completo'),
								(4, 'Pós Graduação Completa'),
								(5, 'Mestre'),
								(6, 'Doutor');

select * from escolaridade;
