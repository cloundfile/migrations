CREATE TABLE "UFS" (
    "ID" NUMBER(18,0) NOT NULL ENABLE, 
    "UF" VARCHAR2(3 BYTE) UNIQUE NOT NULL ENABLE, 
	"DESCRIPTION" VARCHAR2(60 BYTE) UNIQUE NOT NULL ENABLE, 
	"COUNTRIES" NUMBER(4,0) NOT NULL ENABLE
)

CREATE UNIQUE INDEX "UFS_PK" ON "UFS" ("ID");
CREATE INDEX "UFSCOUNTRIES_IDX" ON "UFS" ("COUNTRIES"); 

ALTER TABLE "UFS" ADD CONSTRAINT "UFS_PK" PRIMARY KEY ("ID") USING INDEX "UFS_PK"  ENABLE;
ALTER TABLE "UFS" ADD CONSTRAINT "UFSCOUNTRIES_FK" FOREIGN KEY ("COUNTRIES") REFERENCES "COUNTRIES" ("COD") ENABLE;

COMMENT ON COLUMN "UFS"."ID" IS 'ID universal';
COMMENT ON COLUMN "UFS"."UF" IS 'Federation Unit';
COMMENT ON COLUMN "UFS"."DESCRIPTION" IS 'Name of the Federation';
COMMENT ON COLUMN "UFS"."COUNTRIES" IS 'Country of Origin Code';
COMMENT ON TABLE  "UFS"  IS 'Federation Units';

CREATE SEQUENCE UFS_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE OR REPLACE TRIGGER UFS_ID_TRIGGER
BEFORE INSERT ON UFS
FOR EACH ROW
BEGIN
    :NEW.ID := UFS_SEQ.NEXTVAL;
END;

INSERT INTO UFS (UF,DESCRIPTION,COUNTRIES) VALUES ('RO','RONDONIA','105');
INSERT INTO UFS (UF,DESCRIPTION,COUNTRIES) VALUES ('AC','ACRE','105');
INSERT INTO UFS (UF,DESCRIPTION,COUNTRIES) VALUES ('AM','AMAZONAS','105');
INSERT INTO UFS (UF,DESCRIPTION,COUNTRIES) VALUES ('RR','RORAIMA','105');
INSERT INTO UFS (UF,DESCRIPTION,COUNTRIES) VALUES ('PA','PARA','105');
INSERT INTO UFS (UF,DESCRIPTION,COUNTRIES) VALUES ('AP','AMAPA','105');
INSERT INTO UFS (UF,DESCRIPTION,COUNTRIES) VALUES ('TO','TOCANTINS','105');
INSERT INTO UFS (UF,DESCRIPTION,COUNTRIES) VALUES ('MA','MARANHAO','105');
INSERT INTO UFS (UF,DESCRIPTION,COUNTRIES) VALUES ('PI','PIAUI','105');
INSERT INTO UFS (UF,DESCRIPTION,COUNTRIES) VALUES ('CE','CEARA','105');
INSERT INTO UFS (UF,DESCRIPTION,COUNTRIES) VALUES ('RN','RIO GRANDE DO NORTE','105');
INSERT INTO UFS (UF,DESCRIPTION,COUNTRIES) VALUES ('PB','PARAIBA','105');
INSERT INTO UFS (UF,DESCRIPTION,COUNTRIES) VALUES ('PE','PERNAMBUCO','105');
INSERT INTO UFS (UF,DESCRIPTION,COUNTRIES) VALUES ('AL','ALAGOAS','105');
INSERT INTO UFS (UF,DESCRIPTION,COUNTRIES) VALUES ('SE','SERGIPE','105');
INSERT INTO UFS (UF,DESCRIPTION,COUNTRIES) VALUES ('BA','BAHIA','105');
INSERT INTO UFS (UF,DESCRIPTION,COUNTRIES) VALUES ('MG','MINAS GERAIS','105');
INSERT INTO UFS (UF,DESCRIPTION,COUNTRIES) VALUES ('ES','ESPIRITO SANTO','105');
INSERT INTO UFS (UF,DESCRIPTION,COUNTRIES) VALUES ('RJ','RIO DE JANEIRO','105');
INSERT INTO UFS (UF,DESCRIPTION,COUNTRIES) VALUES ('SP','SAO PAULO','105');
INSERT INTO UFS (UF,DESCRIPTION,COUNTRIES) VALUES ('PR','PARANA','105');
INSERT INTO UFS (UF,DESCRIPTION,COUNTRIES) VALUES ('SC','SANTA CATARINA','105');
INSERT INTO UFS (UF,DESCRIPTION,COUNTRIES) VALUES ('RS','RIO GRANDE DO SUL','105');
INSERT INTO UFS (UF,DESCRIPTION,COUNTRIES) VALUES ('MS','MATO GROSSO DO SUL','105');
INSERT INTO UFS (UF,DESCRIPTION,COUNTRIES) VALUES ('MT','MATO GROSSO','105');
INSERT INTO UFS (UF,DESCRIPTION,COUNTRIES) VALUES ('GO','GOIAS','105');
INSERT INTO UFS (UF,DESCRIPTION,COUNTRIES) VALUES ('DF','DISTRITO FEDERAL','105');
INSERT INTO UFS (UF,DESCRIPTION,COUNTRIES) VALUES ('N','Não Informado','105');

COMMIT;
