-- Unable to render TABLE DDL for object PRCQA.PRCBUILD_DR_ENV with DBMS_METADATA attempting internal generator.


--  Altering Table
ALTER TABLE PRCQA.PRCBUILD_DR_ENV
ADD CONSTRAINT SYS_C0080883 UNIQUE 
(
  ENV_NAME 
)
ENABLE


--  1.Creating Index
CREATE UNIQUE INDEX PRCQA.SYS_C0080882 ON PRCQA.PRCBUILD_DR_ENV (ID ASC)
LOGGING 
TABLESPACE "PRCQA" 
PCTFREE 10 
INITRANS 2 
STORAGE 
( 
  INITIAL 65536 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  BUFFER_POOL DEFAULT 
) 
NOPARALLEL

--  1.Creating Index
CREATE UNIQUE INDEX PRCQA.SYS_C0080883 ON PRCQA.PRCBUILD_DR_ENV (ENV_NAME ASC) 
LOGGING 
TABLESPACE "PRCQA" 
PCTFREE 10 
INITRANS 2 
STORAGE 
( 
  INITIAL 65536 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  BUFFER_POOL DEFAULT 
) 
NOPARALLEL

--  Creating Table
CREATE TABLE PRCQA.PRCBUILD_DR_ENV
(
  ID NUMBER(11, 0) NOT NULL 
, ENV_NAME NVARCHAR2(500) 
, ENV_RELEASE NVARCHAR2(500) 
, ENV_COMMENTS NVARCHAR2(500) 
, ENV_MONITOR NUMBER(1, 0) NOT NULL 
, LAST_UPDATED_BY NVARCHAR2(500) 
, LAST_UPDATED_DATE TIMESTAMP(6) NOT NULL 
, CREATED_BY NVARCHAR2(500) 
, CREATED_DATE TIMESTAMP(6) NOT NULL 
, ENV_DR_OBJECTIVE NUMBER(1, 0) 
, ENV_DR_OBJECTIVE_REQUIRED NUMBER(1, 0) 
, ENV_COLLECTION_ID NVARCHAR2(500) 
, ENV_ARCHIVE NUMBER(1, 0) 
, ARCHIVE_NOTIFICATION_EMAIL_ID VARCHAR2(1000 BYTE) 
, LAST_PURGE_DATE VARCHAR2(500 BYTE) 
, ENV_TYPE VARCHAR2(500 BYTE) 
, TOPO_ALIAS VARCHAR2(500 BYTE) 
, ORDER_INPUTFILE VARCHAR2(2000 BYTE) 
, PROVISIONING_PLAN VARCHAR2(2000 BYTE) 
, LO_NOTIFICATION_EMAIL_ID VARCHAR2(2000 BYTE) 
, LOG_LOCATION VARCHAR2(2000 BYTE) 
, FAAT_SERIES VARCHAR2(2000 BYTE) 
, BROWSER VARCHAR2(500 BYTE) 
, CONSTRAINT SYS_C0080882 PRIMARY KEY 
  (
    ID 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE "PRCQA" 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  BUFFER_POOL DEFAULT 
) 
NOCOMPRESS 
NOPARALLEL

--  Altering Table
ALTER TABLE PRCQA.PRCBUILD_DR_ENV
ADD CONSTRAINT SYS_C0080881 CHECK 
("ENV_MONITOR" IN (0,1))
ENABLE