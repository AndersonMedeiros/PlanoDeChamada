use cigs;

insert into postograduacao(pg_nome) values ('Marechal'),
								  ('General de Exército'),
								  ('General de Divisão'),
								  ('General de Brigada'),
								  ('Coronel'),
								  ('Tenente Coronel'),
								  ('Major'),
								  ('Capitão'),
								  ('1º Tenente'),
								 ('2º Tenente'),
								 ('Aspirante a Oficial'),
								 ('Subtenente'),
								 ('1º Sargento'),
								 ('2º Sargento'),
								 ('3º Sargento'),
								 ('Cabo'),
								 ('Soldado do Efetivo Profissional'),
								 ('Soldado do Efetivo Variável');

select * from postograduacao;

insert into qas_qms(Arma_desc) values ('Arma de Infantaria'),
						   ('Arma de Cavalaria'),
						   ('Arma de Artilharia'),
						   ('Arma de Engenharia'),
						   ('Arma de Comunicações'),
						   ('Quadro de Material Bélico'),
						   ('Quadro de Engenheiros Militares'),
						   ('Quadro Auxiliar de Oficiais'),
						   ('Quadro Complementar de Oficiais'),
						   ('Serviço de Intendência'),
						   ('Serviço de Saúde'),
						   ('Serviço de Assistência Religiosa');

select * from qasqms;

insert into divisaosecao(ds_nome) values ('Divisão de Pessoal (S1)'),
							    ('Divisão Administrativa (DA/S4)'),
							    ('Divisão de Ensino (DE)'),
							    ('Divisão de Alunos (Div Al)'),
							    ('Divisão de Doutrina e Pequisa (DDP)'),
							    ('Divisão Veterinária (Div Vet)'),
							    ('Seção de Operações'),
							    ('Seção de Inteligência (S2)'),
							    ('Seção de Tecnologia da Informação (STI)'),
							   ('Companhia de Comando e Serviço (CCSv)'),
							   ('Companhia Auxiliar de Ensino (CAE)'),
							   ('Comunicação Social (Com Soc)'),
							   ('Assessoria Jurídica'),
							   ('Hotel de Trânsito (HT)');

select * from divisaosecao;

insert into escolaridade(nome) values ('Ensino Fundamental Completo'),
								('Ensino Médio Completo'),
								('Ensino Superior Completo'),
								('Pós Graduação Completa'),
								('Mestre'),
								('Doutor');

select * from escolaridade;

insert into estado(nome) values ('Amazonas');
insert into estado(nome) values ('Bahia');

select * from estado;


insert into cidade(nome,estado_id) values ('Manaus', 1),
						  ('Rio Preto da Eva', 1),
                          ('Iranduba', 1),
                          ('Manacapuru', 1);
                          
select * from cidade;


insert into bairro(nome,zona,cidade_id,cidade_estado_id) values ('São Lázaro', 'Sul', 1, 1);

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
  
select * from bairro;
select * from bairro where cidade_id=1;

insert into situacao(situacao) values ('ATIVO'),
							('INATIVO');




insert into militar(DivisaoSecao_ds_id,PostoGraduacao_pg_id,QAS_QMS_Arma_id,Situacao_id,Mil_nome,
            Mil_nome_guerra,Mil_sexo,Mil_naturalidade,Mil_est_civil,Mil_dt_praca,Mil_identidade,Mil_cpf,Mil_preccp,Mil_data_nasc,
            Mil_cnh_num,Mil_cnh_cat,Mil_pai,Mil_mae,Escolaridade_Esc_id,Mil_end_cep,Mil_end_estado,Mil_cid_id,Bairro_Bairro_id,
            Mil_end_logradouro,Mil_end_num,Mil_end_complemento,Mil_fone1,Mil_fone2,Mil_email,Mil_contato_referencia,Mil_fone_referencia,
            Mil_senha) values(9,17,5,1,'Anderson de Paula Andrade Medeiros','De Paula','M','Amazonense','Solteiro(a)','20180301','1207153378',
                           '01807086275','358157992','19991029','','','Almir de Paula Medeiros','Odineia Andrade Medeiros',2,'69073570','Amazonas',
						   1,1,'Rua Jonas Barreto','59','','92995253071','92993021343','andersonandrade.30@gmail.com','Pai','92992454102','29101999');
select * from militar;
insert into militar (identidade,nome,nome_guerra,cpf,preccp,sexo,est_civil,data_nasc,data_praca,pai,mae,fone1,email,nome_referencia,
					 fone_referencia,end_cep,end_logradouro,end_num,naturalidade,tipo_acesso,senha,titulo_num,titulo_zona,titulo_secao,
                     escolaridade_id,qasqms_id,postograduacao_id,divisaosecao_id,bairro_id,bairro_cidade_id,bairro_cidade_estado_id,
                     situacao_id)
                     values ('1207153378', 'Anderson de Paula Andrade Medeiros', 'De Paula', '01807086275', '358157992', 'M', 
                     'Solteiro(a)', '19991029', '20180301', 'Almir', 'Odineia', '92995253071', 'andersonandrade.30@gmail.com', 
                     'Pai', '92992454102', '69073570', 'Rua Jonas Barreto', '59', 'Amazonense', 'admin', '29101999', '121213131414', 
                     '031', '0255', '3', '5', '15', '2', '1', '1', '1' ,'1');

use cigs;
select e.nome, m.identidade from militar as m, estado as e where e.id=m.bairro_cidade_estado_id;

select ds.nome, pg.nome, m.nome_guerra, m.nome, c.nome, b.nome, m.end_logradouro, m.end_num, m.end_complemento, m.fone1, m.fone2, m.email, m.nome_referencia, m.fone_referencia
from militar as m, cidade as c, postograduacao as pg, divisaosecao as ds, qasqms as qq, bairro as b
where ds.id=m.divisaosecao_id and pg.id=m.postograduacao_id and c.id=m.bairro_cidade_id and b.id=m.bairro_id;

select ds.nome, pg.nome, m.nome_guerra, m.nome, c.nome, b.nome, m.end_logradouro, m.end_num, m.end_complemento, m.fone1, m.fone2, m.email, m.nome_referencia, m.fone_referencia
from militar as m, divisaosecao as ds, postograduacao as pg, cidade as c, bairro as b
where m.divisaosecao_id=ds.id and m.postograduacao_id=pg.id and m.bairro_cidade_id=c.id and m.bairro_id=b.id;


select militar.nome militar, militar.end_logradouro endereco, militar.end_num as 'numero casa', 
ifnull(militar.end_complemento, 'Sem complento') as complemento, militar.fone1,
militar.fone2, militar.email, militar.nome_referencia, militar.fone_referencia,
militar.nome_guerra, divisaosecao.nome, postograduacao.nome, cidade.nome, bairro.nome from militar 
inner join divisaosecao on militar.divisaosecao_id = divisaosecao.id 
inner join postograduacao on militar.postograduacao_id = postograduacao.id
inner join bairro on militar.bairro_id = bairro.id
inner join cidade on militar.bairro_cidade_id = cidade.id
where divisaosecao.nome like '%STI%';



select * from militar;