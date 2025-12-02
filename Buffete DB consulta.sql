CREATE DATABASE BUFFETEDB

CREATE TABLE CASOS (
    caso_id INT PRIMARY KEY IDENTITY,
    inicio_dte DATE NOT NULL,
    final_dte DATE,
    estatus_id INT NOT NULL,
    abogado_id INT NOT NULL,
    cliente_id INT NOT NULL,
    FOREIGN KEY (estatus_id) REFERENCES ESTATUS_MST(estatus_id),
    FOREIGN KEY (abogado_id) REFERENCES ABOGADOS(abogado_id),
    FOREIGN KEY (cliente_id) REFERENCES CLIENTES(cliente_id)
);

CREATE TABLE ESTATUS_MST (
    estatus_id INT PRIMARY KEY IDENTITY,
    estatus_tipo VARCHAR(50) NOT NULL, -- ejemplo: 'caso', 'cliente', 'abogado'
    estatus_dsc VARCHAR(255) NOT NULL
);


CREATE TABLE CLIENTES (
    cliente_id INT PRIMARY KEY IDENTITY,
    cliente_nom VARCHAR(100) NOT NULL,
    cliente_ap VARCHAR(100) NOT NULL,
    cliente_nac DATE
);

CREATE TABLE ABOGADOS (
    abogado_id INT PRIMARY KEY IDENTITY,
    abogado_nom VARCHAR(100) NOT NULL,
    abogado_ap VARCHAR(100) NOT NULL,
    abogado_nac DATE
);

CREATE TABLE DOCUMENTOS (
    doc_id INT PRIMARY KEY IDENTITY,
    doc_dsc VARCHAR(255) NOT NULL,
    doc_tipo VARCHAR(50),
    doc_url VARCHAR(255) NOT NULL,
    caso_id INT NOT NULL,
    FOREIGN KEY (caso_id) REFERENCES CASOS(caso_id)
);


INSERT INTO ESTATUS_MST (estatus_tipo, estatus_dsc)
VALUES ('caso', 'Terminado');

INSERT INTO CLIENTES (cliente_nom, cliente_ap, cliente_nac)
VALUES ('paco', 'Pérez', '1985-06-15');

INSERT INTO CLIENTES (cliente_nom, cliente_ap, cliente_nac)
VALUES ('tomas', 'Pérez', '1985-06-15');


INSERT INTO ABOGADOS (abogado_nom, abogado_ap, abogado_nac)
VALUES ('María', 'Gómez', '1978-03-22');

INSERT INTO ABOGADOS (abogado_nom, abogado_ap, abogado_nac)
VALUES ('julio', 'Gómez', '1978-03-22');


INSERT INTO CASOS (inicio_dte, final_dte, estatus_id, abogado_id, cliente_id)
VALUES ('2025-12-01', NULL, 1, 1, 1);

INSERT INTO DOCUMENTOS (doc_dsc, doc_tipo, doc_url, caso_id)
VALUES ('Contrato inicial', 'PDF', 'https://buffete.com/docs/contrato1.pdf', 1);


