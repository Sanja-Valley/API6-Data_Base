/* CREATE SCHEMA */
CREATE SCHEMA IFEST;
/*
DROP SCHEMA
DROP SCHEMA IFEST CASCADE;
*/

/* TABELA USUARIO */
CREATE TABLE IFEST.USUARIO (
                      ID          BIGSERIAL    NOT NULL,
                      NM_USUARIO  VARCHAR(255) NOT NULL,
                      CD_LOGIN    VARCHAR(255) NOT NULL,
                      DS_SENHA    VARCHAR(255) NOT NULL,
                      NR_CPF      VARCHAR(255) NOT NULL,
                      DS_EMAIL    VARCHAR(255) NOT NULL,
                      ID_ENDERECO BIGINT               ,
                      NR_ENDERECO INT          NOT NULL,

                      CONSTRAINT USUARIO_PK PRIMARY KEY(ID)
                     );

/* TABELA ENDERECO */
CREATE TABLE IFEST.ENDERECO (
                       ID             BIGSERIAL    NOT NULL,
                       NM_RUA         VARCHAR(255) NOT NULL,
                       DS_COMPLEMENTO VARCHAR(255) NOT NULL,
                       NM_CIDADE      VARCHAR(255) NOT NULL,
                       NM_BAIRRO      VARCHAR(255) NOT NULL,

                       CONSTRAINT ENDERECO_PK PRIMARY KEY(ID)
                      );

/* TABELA FORMA_PAGAMENTO */
CREATE TABLE IFEST.FORMA_PAGAMENTO (
                              ID                 BIGSERIAL    NOT NULL,
                              NM_FORMA_PAGAMENTO VARCHAR(255) NOT NULL,
                              DS_FORMA_PAGAMENTO VARCHAR(255) NOT NULL,

                              CONSTRAINT FORMA_PAGAMENTO_PK PRIMARY KEY(ID)
                             );

/* TABELA SUB_CATEGORIA */
CREATE TABLE IFEST.SUB_CATEGORIA (
                            ID               BIGSERIAL    NOT NULL,
                            NM_SUBCATEGORIA  VARCHAR(255) NOT NULL,
                            DS_SUBCATEGORIA  VARCHAR(255) NOT NULL,
                            ID_CATEGORIA     BIGINT               ,
                            ID_SUB_CATEGORIA BIGINT               ,

                            CONSTRAINT SUB_CATEGORIA_PK PRIMARY KEY(ID)
                           );

/* TABELA CATEGORIA */
CREATE TABLE IFEST.CATEGORIA (
                        ID           BIGSERIAL    NOT NULL,
                        NM_CATEGORIA VARCHAR(255) NOT NULL,
                        DS_CATEGORIA VARCHAR(255) NOT NULL,

                        CONSTRAINT CATEGORIA_PK PRIMARY KEY(ID)
                       );

/* TABELA PRODUTO VENDA */
CREATE TABLE IFEST.PRODUTO_VENDA (
                            ID            BIGSERIAL NOT NULL,
                            NR_QUANTIDADE INT       NOT NULL,
                            ID_PRODUTO    BIGINT            ,
                            ID_VENDA      BIGINT            ,

                            CONSTRAINT PRODUTO_VENDA_PK PRIMARY KEY(ID)
                           );

/* TABELA VENDA */
CREATE TABLE IFEST.VENDA (
                    ID                 BIGSERIAL     NOT NULL,
                    VL_TOTAL           NUMERIC(10,2) NOT NULL,
                    VL_PAGO            NUMERIC(10,2) NOT NULL,
                    DH_VENDA           TIMESTAMP     NOT NULL,
                    DH_EVENTO          TIMESTAMP     NOT NULL,
                    NR_CONVIDADOS      INT           NOT NULL,
                    ID_FORMA_PAGAMENTO BIGINT                ,
                    ID_USUARIO         BIGINT                ,

                    CONSTRAINT VENDA_PK PRIMARY KEY(ID)
                   );

/* TABELA PRODUTO */
CREATE TABLE IFEST.PRODUTO (
                      ID               BIGSERIAL     NOT NULL,
                      NM_PRODUTO       VARCHAR(255)  NOT NULL,
                      DS_PRODUTO       VARCHAR(255)  NOT NULL,
                      VL_PRODUTO       NUMERIC(10,2) NOT NULL,
                      NR_ENDERECO      INT           NOT NULL,
                      ID_ENDERECO      BIGINT                ,
                      ID_CATEGORIA     BIGINT                ,

                      CONSTRAINT PRODUTO_PK PRIMARY KEY(ID)
                     );





/* REFERÊNCIA USUARIO_ENDERECO TABELA USUARIO */
ALTER TABLE IFEST.USUARIO ADD CONSTRAINT USUARIO_ENDERECO
FOREIGN KEY (ID_ENDERECO)
REFERENCES  IFEST.ENDERECO (ID)
NOT DEFERRABLE
INITIALLY IMMEDIATE;



/* REFERÊNCIA VENDA_FORMA_PAGAMENTO TABELA VENDA */
ALTER TABLE IFEST.VENDA ADD CONSTRAINT VENDA_FORMA_PAGAMENTO
FOREIGN KEY (ID_FORMA_PAGAMENTO)
REFERENCES  IFEST.FORMA_PAGAMENTO (ID)
NOT DEFERRABLE
INITIALLY IMMEDIATE;

/* REFERÊNCIA VENDA_USUARIO TABELA VENDA */
ALTER TABLE IFEST.VENDA ADD CONSTRAINT VENDA_USUARIO
FOREIGN KEY (ID_USUARIO)
REFERENCES  IFEST.USUARIO (ID)
NOT DEFERRABLE
INITIALLY IMMEDIATE;

/* REFERÊNCIA PRODUTO_ENDERECO TABELA PRODUTO */
ALTER TABLE IFEST.PRODUTO ADD CONSTRAINT PRODUTO_ENDERECO
FOREIGN KEY (ID_ENDERECO)
REFERENCES  IFEST.ENDERECO (ID)
NOT DEFERRABLE
INITIALLY IMMEDIATE;

/* REFERÊNCIA PRODUTO_CATEGORIA TABELA PRODUTO */
ALTER TABLE IFEST.PRODUTO ADD CONSTRAINT PRODUTO_CATEGORIA
FOREIGN KEY (ID_CATEGORIA)
REFERENCES  IFEST.CATEGORIA (ID)
NOT DEFERRABLE
INITIALLY IMMEDIATE;

/* REFERÊNCIA SUB_CATEGORIA_CATEGORIA TABELA SUB_CATEGORIA */
ALTER TABLE IFEST.SUB_CATEGORIA ADD CONSTRAINT SUB_CATEGORIA_CATEGORIA
FOREIGN KEY (ID_CATEGORIA)
REFERENCES  IFEST.CATEGORIA (ID)
NOT DEFERRABLE
INITIALLY IMMEDIATE;


ALTER TABLE IFEST.SUB_CATEGORIA ADD CONSTRAINT SUB_CATEGORIA_SUB_CATEGORIA
FOREIGN KEY (ID_SUB_CATEGORIA)
REFERENCES  IFEST.SUB_CATEGORIA (ID)
NOT DEFERRABLE
INITIALLY IMMEDIATE;

ALTER TABLE IFEST.PRODUTO_VENDA ADD CONSTRAINT PRDUTO_VENDA_PRODUTO
FOREIGN KEY (ID_PRODUTO)
REFERENCES  IFEST.PRODUTO(ID)
NOT DEFERRABLE
INITIALLY IMMEDIATE;

ALTER TABLE IFEST.PRODUTO_VENDA ADD CONSTRAINT PRDUTO_VENDA_VENDA
FOREIGN KEY (ID_VENDA)
REFERENCES  IFEST.VENDA(ID)
NOT DEFERRABLE
INITIALLY IMMEDIATE;





