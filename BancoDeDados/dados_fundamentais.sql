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


insert into cidade values (1, 'Manaus'),
						  (2, 'Rio Preto da Eva'),
                          (3, 'Iranduba');
                          
select * from cidade;


insert into bairro values (1, null, 'São Lázaro', 'Sul');

insert into bairro values (1, null, 'Adrianópolis', 'Centro-Sul');

insert into bairro values (1, null, 'Centro', 'Sul'),
                          (1, null, 'Nossa Senhora Aparecida', 'Sul'),
                          (1, null, 'Presidente Vargas', 'Sul'),
                          (1, null, 'Praça 14 de Janeiro', 'Sul'),
                          (1, null, 'Cachoeirinha', 'Sul'),
                          (1, null, 'Raiz', 'Sul'),
                          (1, null, 'São Francisco', 'Sul'),
                          (1, null, 'Petrópolis', 'Sul'),
                          (1, null, 'Japiim', 'Sul'),
                          (1, null, 'Educandos', 'Sul'),
                          (1, null, 'Japiim', 'Sul'),
                          (1, null, 'Educandos', 'Sul'),
                          (1, null, 'Santa Luzia', 'Sul'),
                          (1, null, 'Morro da Liberdade', 'Sul'),
                          (1, null, 'Betânia', 'Sul'),
                          (1, null, 'Colônia Oliveira Machado', 'Sul'),
                          (1, null, 'Crespo', 'Sul'),
                          (1, null, 'Vila Buriti', 'Sul'),
                          (1, null, 'Distrito Industrial I', 'Sul'),
                          
                          (1, null, 'Dom Pedro', 'Centro-Sul'),
                          (1, null, 'Flores', 'Centro-Sul'),
                          (1, null, 'Parque 10 de Novembro', 'Centro-Sul'),
                          (1, null, 'Aleixo', 'Centro-Sul'),
                          (1, null, 'Nossa Senhora das Graças', 'Centro-Sul'),
                          (1, null, 'São Geraldo', 'Centro-Sul'),
                          (1, null, 'Chapada', 'Centro-Sul'),
                          
                          (1, null, 'São Raimundo', 'Oeste'),
                          (1, null, 'Glória', 'Oeste'),
                          (1, null, 'Santo Antônio', 'Oeste'),
                          (1, null, 'Vila da Prata', 'Oeste'),
                          (1, null, 'Compensa', 'Oeste'),
                          (1, null, 'São Jorge', 'Oeste'),
                          (1, null, 'Santo Agostinho', 'Oeste'),
                          (1, null, 'Nova Esperança', 'Oeste'),
                          (1, null, 'Lírio do Vale', 'Oeste'),
                          (1, null, 'Ponta Negra', 'Oeste'),
                          (1, null, 'Tarumã', 'Oeste'),
                          (1, null, 'Tarumã-Açu', 'Oeste'),
                          
                          (1, null, 'Planalto', 'Centro-Oeste'),
                          (1, null, 'Alvorada', 'Centro-Oeste'),
                          (1, null, 'Redenção', 'Centro-Oeste'),
                          (1, null, 'Da Paz', 'Centro-Oeste'),
                          
                          (1, null, 'Coroado', 'Leste'),
                          (1, null, 'Distrito Industrial II', 'Leste'),
                          (1, null, 'Mauazinho', 'Leste'),
                          (1, null, 'Colônia Antônio Aleixo', 'Leste'),
                          (1, null, 'Puraquequara', 'Leste'),
                          (1, null, 'Armando Mendes', 'Leste'),
                          (1, null, 'Zumbi dos Palmares', 'Leste'),
                          (1, null, 'São José Operário', 'Leste'),
                          (1, null, 'Tancredo Neves', 'Leste'),
                          (1, null, 'Jorge Teixeira', 'Leste'),
                          (1, null, 'Gilberto Mestrinho', 'Leste'),
                          (1, null, 'Lago Azul', 'Leste'),
                          
                          (1, null, 'Colônia Santo Antônio', 'Norte'),
                          (1, null, 'Novo Israel', 'Norte'),
                          (1, null, 'Colônia Terra Nova', 'Norte'),
                          (1, null, 'Santa Etelvina', 'Norte'),
                          (1, null, 'Monte das Oliveiras', 'Norte'),
                          (1, null, 'Cidade Nova', 'Norte'),
                          (1, null, 'Novo Aleixo', 'Norte'),
                          (1, null, 'Cidade de Deus', 'Norte'),
                          (1, null, 'Nova Cidade', 'Norte');
                        
                          
                          
                          
select *from bairro group by Bairro_zona, Bairro_nome;








