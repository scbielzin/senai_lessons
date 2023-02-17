CREATE TABLE Departamento (
    ID_Depto    NUMERIC(2)      NOT NULL,
    NomeDepto   VARCHAR(30)   NOT NULL,
    ID_Gerente  NUMERIC(4)      NOT NULL,
    CONSTRAINT pk_depto PRIMARY KEY (ID_Depto),
    CONSTRAINT uk_nome UNIQUE (NomeDepto)
);

CREATE TABLE Funcionario (
    ID_Func     NUMERIC(4)     NOT NULL,
    NomeFunc    VARCHAR(30)  NOT NULL,
    Endereco    VARCHAR(50)  NOT NULL,
    DataNasc    DATE          NOT NULL,
    Sexo        CHAR(1)       NOT NULL,
    Salario     NUMERIC(8,2)   NOT NULL,
    ID_Superv   NUMERIC(4)         NULL,
    ID_Depto    NUMERIC(2)     NOT NULL,
    CONSTRAINT pk_func PRIMARY KEY (ID_Func),
    CONSTRAINT ck_sexo CHECK (Sexo='M' or Sexo='F')
);

CREATE TABLE Projeto (
    ID_Proj       NUMERIC(4)     NOT NULL,
    NomeProj      VARCHAR(30)  NOT NULL,
    Localizacao   VARCHAR(30)      NULL,
    ID_Depto      NUMERIC(2)     NOT NULL,
    CONSTRAINT pk_proj PRIMARY KEY (ID_Proj),
    CONSTRAINT uk_nomeProj UNIQUE (NomeProj)
);

CREATE TABLE Dependente (
    ID_Dep       NUMERIC(6)     NOT NULL,
    ID_Func      NUMERIC(4)     NOT NULL,
    NomeDep      VARCHAR(30)  NOT NULL,
    DataNasc     DATE          NOT NULL,
    Sexo         CHAR(1)       NOT NULL,
    Parentesco   CHAR(15)          NULL,
    CONSTRAINT pk_depend PRIMARY KEY (ID_Dep, ID_Func),
    CONSTRAINT ck_sexo_dep CHECK (Sexo='M' or Sexo='F')
);

CREATE TABLE Trabalha (
    ID_Func    NUMERIC(4)     NOT NULL,
    ID_Proj    NUMERIC(4)     NOT NULL,
    NumHoras   NUMERIC(6,1)       NULL,
    CONSTRAINT pk_trab PRIMARY KEY (ID_Func,ID_Proj)
);

INSERT INTO Funcionario
VALUES (1,'Joao Silva','R. Guaicui, 175','1955-02-01','M',500,2,1);
INSERT INTO Funcionario
VALUES (2,'Frank Santos','R. Gentios, 22','1966-02-02','M',1000,8,1);
INSERT INTO Funcionario
VALUES (3,'Alice Pereira','R. Curitiba, 11','1970-05-15','F',700,4,3);
INSERT INTO Funcionario
VALUES (4,'Junia Mendes','R. Espirito Santos, 123','1976-07-06','F',1200,8,3);
INSERT INTO Funcionario
VALUES (5,'Jose Tavares','R. Irai, 153','1975-10-07','M',1500,2,1);
INSERT INTO Funcionario
VALUES (6,'Luciana Santos','R. Irai, 175','1960-10-07','F',600,2,1);
INSERT INTO Funcionario
VALUES (7,'Maria Ramos','R. C. Linhares, 10','1965-11-01','F',1000,4,3);
INSERT INTO Funcionario
VALUES (8,'Jaime Mendes','R. Bahia, 111','1960-11-25','M',2000,NULL,2);

INSERT INTO Departamento
VALUES (1,'Pesquisa',2);
INSERT INTO Departamento
VALUES (2,'Administracao',8);
INSERT INTO Departamento
VALUES (3,'Construcao',4);

INSERT INTO Dependente
VALUES (1,2,'Luciana','1990-11-05','F','Filha');
INSERT INTO Dependente
VALUES (2,2,'Paulo','1992-11-01','M','Filho');
INSERT INTO Dependente
VALUES (3,2,'Sandra','1996-12-05','F','Filha');
INSERT INTO Dependente
VALUES (4,4,'Mike','1997-11-05','M','Filho');
INSERT INTO Dependente
VALUES (5,1,'Max','1979-11-05','M','Filho');
INSERT INTO Dependente
VALUES (6,1,'Rita','1985-11-07','F','Filha');
INSERT INTO Dependente
VALUES (7,1,'Bety','1960-12-15','F','Esposa');

INSERT INTO Projeto
VALUES (1,'ProdX','Savassi',1);
INSERT INTO Projeto
VALUES (2,'ProdY','Luxemburgo',1);
INSERT INTO Projeto
VALUES (3,'ProdZ','Centro',1);
INSERT INTO Projeto
VALUES (10,'Computacao','C. Nova',3);
INSERT INTO Projeto
VALUES (20,'Organizacao','Luxemburgo',2);
INSERT INTO Projeto
VALUES (30,'N. Beneficios','C. Nova',1);

INSERT INTO Trabalha
VALUES (1,1,32.5);
INSERT INTO Trabalha
VALUES (1,2,7.5);
INSERT INTO Trabalha
VALUES (5,3,40.0);
INSERT INTO Trabalha
VALUES (6,1,20.0);
INSERT INTO Trabalha
VALUES (6,2,20.0);
INSERT INTO Trabalha
VALUES (2,2,10.0);
INSERT INTO Trabalha
VALUES (2,3,10.0);
INSERT INTO Trabalha
VALUES (2,10,10.0);
INSERT INTO Trabalha
VALUES (2,20,10.0);
INSERT INTO Trabalha
VALUES (3,30,30.0);
INSERT INTO Trabalha
VALUES (3,10,10.0);
INSERT INTO Trabalha
VALUES (7,10,35.0);
INSERT INTO Trabalha
VALUES (7,30,5.0);
INSERT INTO Trabalha
VALUES (4,20,15.0);
INSERT INTO Trabalha
VALUES (8,20,NULL);

ALTER TABLE Funcionario
ADD CONSTRAINT fk_func_depto FOREIGN KEY (ID_Depto) REFERENCES Departamento (ID_Depto);

ALTER TABLE Funcionario
ADD CONSTRAINT fk_func_superv FOREIGN KEY (ID_Superv) REFERENCES Funcionario (ID_Func);

ALTER TABLE Departamento
ADD CONSTRAINT fk_depto_func FOREIGN KEY (ID_Gerente) REFERENCES Funcionario (ID_Func);

ALTER TABLE Projeto
ADD CONSTRAINT fk_proj_depto FOREIGN KEY (ID_Depto) REFERENCES Departamento (ID_Depto);

ALTER TABLE Dependente
ADD CONSTRAINT fk_dep_func FOREIGN KEY (ID_Func) REFERENCES Funcionario (ID_Func) ON DELETE CASCADE;

ALTER TABLE Trabalha
ADD CONSTRAINT fk_trab_func FOREIGN KEY (ID_Func) REFERENCES Funcionario (ID_Func) ON DELETE CASCADE;

ALTER TABLE Trabalha
ADD CONSTRAINT fk_trab_proj FOREIGN KEY (ID_Proj) REFERENCES Projeto (ID_Proj) ON DELETE CASCADE;


select nomefunc, datanasc from Funcionario
where nomefunc = "Joao Silva";

select NomeFunc, Endereco, ID_Depto from funcionario
where id_depto = 1

select distinct id_proj, nomeproj, nomedepto, id_gerente, datanasc
from projeto, departamento, funcionario
where (projeto.id_depto=departamento.id_depto)
and(localizacao = "Luxemburgo")
and(id_gerente = id_func)

select distinct e.nomefunc, s.nomefunc
from funcionario as e inner join funcionario as s on s.id_func = e.id_superv

select distinct e.nomefunc
from funcionario as e 
where e.id_depto = 1

select distinct salario, nomefunc
from funcionario
group by salario

select nomefunc, endereco
from funcionario
where endereco like '%Irai%'

select nomefunc, endereco, p.id_proj, nomeproj, e.id_func
from funcionario as e, projeto as p, trabalha as t
where nomefunc like "%santos%"
and(p.id_proj = t.id_proj)
and(t.id_func = e.id_func)

select nomefunc, endereco, p.id_proj, p.nomeproj, e.id_func, e.salario, e.salario * 1.2
from funcionario as e, projeto as p, trabalha as t
where(p.id_proj = 1)
and(p.id_proj = t.id_proj)
and(t.id_func = e.id_func)
group by nomefunc

select e.nomefunc, d.id_depto, e.salario
from funcionario as e, departamento as d
where(d.id_depto = 3)
and(e.id_depto = d.id_depto)
and(e.salario >= 800 and e.salario <= 1200)

select e.nomefunc, d.nomedepto, p.nomeproj
from funcionario as e, departamento as d, projeto as p, trabalha as t
where(d.id_depto = e.id_depto)
and(t.id_proj = p.id_proj)
and(t.id_func = e.id_func)
order by d.id_depto, p.nomeproj

select distinct NomeFunc
FROM Projeto as P, Trabalha AS T, Funcionario AS E
WHERE P.id_proj = T.id_proj AND T.id_func = E.id_func
and t.id_proj in 
(select p.id_proj FROM Projeto as P, Trabalha AS T, Funcionario AS E
where e.nomefunc = 'João Silva' 
and t.id_proj = p.id_proj
and t.id_func = e.id_func)

select NomeFunc
FROM Funcionario AS E
where(e.id_superv is null)

SELECT nomeFunc, nomeDep
FROM Funcionario as E, Dependente as D
where(e.id_func = D.id_func) 
and (SELECT COUNT(*)
 FROM Dependente as D
 WHERE e.id_func = D.id_func) >= 2;

select max(salario) as maiorSalario, min(salario) as menorSalario, avg(salario) as mediaSalario, sum(salario) as somaSalario
FROM Projeto as P, Trabalha AS T, Funcionario AS E

select max(salario) as maiorSalario, min(salario) as menorSalario, avg(salario) as mediaSalario, sum(salario) as somaSalario
FROM Projeto as P, Trabalha AS T, Funcionario AS E
where e.id_depto = 1

select count(t.id_func), nomeProj
FROM Projeto as P, Trabalha AS T, Funcionario AS E
where(t.id_func = e.id_func)
and(t.id_proj = p.id_proj)
group by nomeProj

SELECT NomeProj, COUNT(*) AS NRO_FUNCS
FROM Trabalha, Projeto
WHERE Projeto.id_proj = Trabalha.id_proj
GROUP BY Projeto.id_proj, NomeProj
HAVING COUNT(*) > 2;

SELECT NomeDepto, COUNT(*) AS NRO_FUNCS
FROM Departamento, Funcionario
WHERE Funcionario.id_depto = Departamento.id_depto
GROUP BY Departamento.id_depto, NomeDepto
HAVING COUNT(*) > 2;

SELECT distinct f.salario from funcionario as F
where (f.salario=f.salario) 

