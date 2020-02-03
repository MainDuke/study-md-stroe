--DROP
DROP TABLE IF EXISTS tb_inspection_inspector;
DROP TABLE IF EXISTS tb_inspection_device;
DROP TABLE IF EXISTS tb_inspection_license;
DROP TABLE IF EXISTS tb_inspection_check_result;
DROP TABLE IF EXISTS tb_inspection_character_result;
DROP TABLE IF EXISTS tb_inspection_report;
DROP TABLE IF EXISTS tc_inspection_character;
DROP TABLE IF EXISTS tc_inspection_check_s;
DROP TABLE IF EXISTS tc_inspection_check_m;
DROP TABLE IF EXISTS tc_inspection_check_mapping;
DROP TABLE IF EXISTS tc_inspection_check_l;

CREATE TABLE tb_inspection_character_result
(
  character_value char(20) NULL ,
  device_id char(20) NULL ,
  report_id text NOT NULL ,
  equip_id char(20) NULL ,
  character_seq integer NOT NULL
);

ALTER TABLE tb_inspection_character_result
	ADD CONSTRAINT XPK시설별_고유속성_결과 PRIMARY KEY (report_id,character_seq);

CREATE TABLE tb_inspection_check_result
(
  checkcontent_result char(20) NULL ,
  device_id char(20) NULL ,
  report_id text NOT NULL ,
  equip_id char(20) NULL ,
  checkcontent_poor char(20) NULL ,
  checkcontent_action char(20) NULL ,
  checkcontent_legalbasis char(20) NULL ,
  check_image1 char(20) NULL ,
  check_image2 char(20) NULL ,
  check_image3 char(20) NULL ,
  checkcontent_title char(20) NULL ,
  checkcontent_code char(20) NULL
);

ALTER TABLE tb_inspection_check_result
	ADD CONSTRAINT XPK점검결과 PRIMARY KEY (report_id);

CREATE TABLE tb_inspection_device
(
  device_id character varying(20) NOT NULL ,
  producer character varying(20) NULL ,
  model_num character varying(20) NULL ,
  serial_num character varying(20) NULL ,
  use_yn character varying(20) NULL ,
  create_date date NULL ,
  create_user_id character varying(20) NULL ,
  update_date date NULL ,
  update_user_id character varying(20) NULL
);

ALTER TABLE tb_inspection_device
	ADD CONSTRAINT XPK단말기 PRIMARY KEY (device_id);

CREATE TABLE tb_inspection_inspector
(
  inspector_type character varying(20) NULL ,
  inspector_name character varying(20) NULL ,
  license_type character varying(20) NULL ,
  license_num character varying(20) NULL ,
  inspection_start date NULL ,
  inspection_end date NULL ,
  inspector_id char(20) NOT NULL ,
  report_id character varying(20) NOT NULL
);

ALTER TABLE tb_inspection_inspector
	ADD CONSTRAINT XPK점검자 PRIMARY KEY (report_id,inspector_id);

CREATE TABLE tb_inspection_license
(
  user_id char(20) NULL ,
  license_seq char(20) NULL ,
  license_type char(20) NULL ,
  license_num char(20) NULL ,
  license_date date NULL
);

CREATE TABLE tb_inspection_report
(
  report_id character varying(20) NOT NULL ,
  build_mng_no character varying(20) NULL ,
  report_type character varying(20) NULL ,
  report_date date NULL
);

ALTER TABLE tb_inspection_report
	ADD CONSTRAINT XPK보고서 PRIMARY KEY (report_id);

CREATE TABLE tc_inspection_character
(
  character_code char(20) NULL ,
  character_title char(20) NULL ,
  equip_type_code char(20) NULL ,
  character_seq integer NOT NULL ,
  data_type_code char(20) NULL ,
  unit_code char(20) NULL ,
  use_yn char(20) NULL
);

ALTER TABLE tc_inspection_character
	ADD CONSTRAINT XPK분류별_고유속성 PRIMARY KEY (character_seq);

CREATE TABLE tc_inspection_check_l
(
  check_large_code char(20) NOT NULL ,
  check_type char(20) NULL ,
  check_large_name char(20) NULL ,
  use_yn char(20) NULL
);

ALTER TABLE tc_inspection_check_l
	ADD CONSTRAINT XPK점검항목_대분류 PRIMARY KEY (check_large_code);

CREATE TABLE tc_inspection_check_m
(
  check_medium_code char(20) NOT NULL ,
  check_large_code char(20) NOT NULL ,
  check_medium_name char(20) NULL ,
  use_yn char(20) NULL
);

ALTER TABLE tc_inspection_check_m
	ADD CONSTRAINT XPK점검항목_중분류 PRIMARY KEY (check_medium_code);

CREATE TABLE tc_inspection_check_mapping
(
  equip_type_code char(20) NOT NULL ,
  check_large_code char(20) NOT NULL
);

ALTER TABLE tc_inspection_check_mapping
	ADD CONSTRAINT XPK시설별_점검항목_연결 PRIMARY KEY (check_large_code,equip_type_code);

CREATE TABLE tc_inspection_check_s
(
  check_small_code char(20) NOT NULL ,
  check_medium_code char(20) NOT NULL ,
  check_small_name char(20) NULL ,
  check_note char(20) NULL ,
  use_yn char(20) NULL
);

ALTER TABLE tc_inspection_check_s
	ADD CONSTRAINT XPK점검항목_소분류 PRIMARY KEY (check_small_code);


ALTER TABLE tb_inspection_character_result
	ADD CONSTRAINT R_21 FOREIGN KEY (character_seq) REFERENCES tc_inspection_character(character_seq)
ON UPDATE RESTRICT
		ON
DELETE RESTRICT;

ALTER TABLE tb_inspection_character_result
	ADD CONSTRAINT R_28 FOREIGN KEY (report_id) REFERENCES tb_inspection_report(report_id)
ON UPDATE RESTRICT
		ON
DELETE RESTRICT;


ALTER TABLE tb_inspection_check_result
	ADD CONSTRAINT R_29 FOREIGN KEY (report_id) REFERENCES tb_inspection_report(report_id)
ON UPDATE RESTRICT
		ON
DELETE RESTRICT;


ALTER TABLE tb_inspection_inspector
	ADD CONSTRAINT R_33 FOREIGN KEY (report_id) REFERENCES tb_inspection_report(report_id)
ON UPDATE RESTRICT
		ON
DELETE RESTRICT;


ALTER TABLE tc_inspection_check_m
	ADD CONSTRAINT R_30 FOREIGN KEY (check_large_code) REFERENCES tc_inspection_check_l(check_large_code)
ON UPDATE RESTRICT
		ON
DELETE RESTRICT;


ALTER TABLE tc_inspection_check_mapping
	ADD CONSTRAINT R_34 FOREIGN KEY (check_large_code) REFERENCES tc_inspection_check_l(check_large_code)
ON UPDATE RESTRICT
		ON
DELETE RESTRICT;


ALTER TABLE tc_inspection_check_s
	ADD CONSTRAINT R_31 FOREIGN KEY (check_medium_code) REFERENCES tc_inspection_check_m(check_medium_code)
ON UPDATE RESTRICT
		ON
DELETE RESTRICT;


CREATE OR REPLACE FUNCTION before_insert_I_tb_inspection_character_res
() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* tb_inspection_report  tb_inspection_character_result on child insert restrict */
  /* ERWIN_RELATION CHECKSUM="000262b9", PARENT_OWNER="", PARENT_TABLE="tb_inspection_report"
    CHILD_OWNER="", CHILD_TABLE="tb_inspection_character_result"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_28", FK_COLUMNS="report_id" */
  SELECT count(*)
  INTO NUMROWS
  FROM tb_inspection_report
  WHERE
        /* %JoinFKPK( %New,tb_inspection_report," = "," AND") */
         new.report_id = tb_inspection_report.report_id;
  IF (
      /* %NotnullFK( %New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
RAISE EXCEPTION 'Cannot insert tb_inspection_character_result because tb_inspection_report does not exist.';
END
IF;

     * erwin Builtin Trigger * 
     * tc_inspection_character  tb_inspection_character_result on child
insert restrict * 
     *
ERWIN_RELATION
CHECKSUM
="00000000", PARENT_OWNER="", PARENT_TABLE="tc_inspection_character"
    CHILD_OWNER="", CHILD_TABLE="tb_inspection_character_result"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_21", FK_COLUMNS="character_seq" *
SELECT count(*)
INTO NUMROWS
FROM tc_inspection_character
WHERE
         * %JoinFKPK
( %New,tc_inspection_character," = "," AND") * 
         new.character_seq = tc_inspection_character.character_seq;
IF (
       * %NotnullFK
( %New," IS NOT NULL AND") * 
      
      NUMROWS = 0
    )
    THEN
      raise_application_error
(
        -20002,
        'Cannot insert tb_inspection_character_result because tc_inspection_character does not exist.'
      );
END
IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tI_tb_inspection_character_res BEFORE
INSERT ON public.
"tb_inspection_character_result"
for
each
row
EXECUTE PROCEDURE before_insert_I_tb_inspection_character_res
();


CREATE OR REPLACE FUNCTION aft_update_U_tb_inspection_character_res
() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* tb_inspection_report  tb_inspection_character_result on child update restrict */
  /* ERWIN_RELATION CHECKSUM="000273e4", PARENT_OWNER="", PARENT_TABLE="tb_inspection_report"
    CHILD_OWNER="", CHILD_TABLE="tb_inspection_character_result"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_28", FK_COLUMNS="report_id" */
  SELECT count(*)
  INTO NUMROWS
  FROM tb_inspection_report
  WHERE
      /* %JoinFKPK( %New,tb_inspection_report," = "," AND") */
       new.report_id = tb_inspection_report.report_id;
  IF (
    /* %NotnullFK( %New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
RAISE EXCEPTION 'Cannot update tb_inspection_character_result because tb_inspection_report does not exist.';
END
IF;

   * erwin Builtin Trigger * 
   * tc_inspection_character  tb_inspection_character_result on child
update restrict * 
   * ERWIN_RELATION CHECKSUM
="00000000", PARENT_OWNER="", PARENT_TABLE="tc_inspection_character"
    CHILD_OWNER="", CHILD_TABLE="tb_inspection_character_result"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_21", FK_COLUMNS="character_seq" *
SELECT count(*)
INTO NUMROWS
FROM tc_inspection_character
WHERE
       * %JoinFKPK
( %New,tc_inspection_character," = "," AND") * 
       new.character_seq = tc_inspection_character.character_seq;
IF (
     * %NotnullFK
( %New," IS NOT NULL AND") * 
    
    NUMROWS = 0
  )
  THEN
    raise_application_error
(
      -20007,
      'Cannot update tb_inspection_character_result because tc_inspection_character does not exist.'
    );
END
IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_tb_inspection_character_res AFTER
UPDATE ON public."tb_inspection_character_result" for each row
EXECUTE PROCEDURE aft_update_U_tb_inspection_character_res
();



CREATE OR REPLACE FUNCTION before_insert_I_tb_inspection_check_result
() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* tb_inspection_report  tb_inspection_check_result on child insert restrict */
  /* ERWIN_RELATION CHECKSUM="00011792", PARENT_OWNER="", PARENT_TABLE="tb_inspection_report"
    CHILD_OWNER="", CHILD_TABLE="tb_inspection_check_result"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_29", FK_COLUMNS="report_id" */
  SELECT count(*)
  INTO NUMROWS
  FROM tb_inspection_report
  WHERE
        /* %JoinFKPK( %New,tb_inspection_report," = "," AND") */
         new.report_id = tb_inspection_report.report_id;
  IF (
      /* %NotnullFK( %New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
RAISE EXCEPTION 'Cannot insert tb_inspection_check_result because tb_inspection_report does not exist.';
END
IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tI_tb_inspection_check_result BEFORE
INSERT ON public.
"tb_inspection_check_result"
for
each
row
EXECUTE PROCEDURE before_insert_I_tb_inspection_check_result
();


CREATE OR REPLACE FUNCTION aft_update_U_tb_inspection_check_result
() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* tb_inspection_report  tb_inspection_check_result on child update restrict */
  /* ERWIN_RELATION CHECKSUM="00011c88", PARENT_OWNER="", PARENT_TABLE="tb_inspection_report"
    CHILD_OWNER="", CHILD_TABLE="tb_inspection_check_result"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_29", FK_COLUMNS="report_id" */
  SELECT count(*)
  INTO NUMROWS
  FROM tb_inspection_report
  WHERE
      /* %JoinFKPK( %New,tb_inspection_report," = "," AND") */
       new.report_id = tb_inspection_report.report_id;
  IF (
    /* %NotnullFK( %New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
RAISE EXCEPTION 'Cannot update tb_inspection_check_result because tb_inspection_report does not exist.';
END
IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_tb_inspection_check_result AFTER
UPDATE ON public."tb_inspection_check_result" for each row
EXECUTE PROCEDURE aft_update_U_tb_inspection_check_result
();



CREATE OR REPLACE FUNCTION before_insert_I_tb_inspection_inspector
() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* tb_inspection_report  tb_inspection_inspector on child insert restrict */
  /* ERWIN_RELATION CHECKSUM="0001141d", PARENT_OWNER="", PARENT_TABLE="tb_inspection_report"
    CHILD_OWNER="", CHILD_TABLE="tb_inspection_inspector"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_33", FK_COLUMNS="report_id" */
  SELECT count(*)
  INTO NUMROWS
  FROM tb_inspection_report
  WHERE
        /* %JoinFKPK( %New,tb_inspection_report," = "," AND") */
         new.report_id = tb_inspection_report.report_id;
  IF (
      /* %NotnullFK( %New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
RAISE EXCEPTION 'Cannot insert tb_inspection_inspector because tb_inspection_report does not exist.';
END
IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tI_tb_inspection_inspector BEFORE
INSERT ON public.
"tb_inspection_inspector"
for
each
row
EXECUTE PROCEDURE before_insert_I_tb_inspection_inspector
();


CREATE OR REPLACE FUNCTION aft_update_U_tb_inspection_inspector
() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* tb_inspection_report  tb_inspection_inspector on child update restrict */
  /* ERWIN_RELATION CHECKSUM="0001116e", PARENT_OWNER="", PARENT_TABLE="tb_inspection_report"
    CHILD_OWNER="", CHILD_TABLE="tb_inspection_inspector"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_33", FK_COLUMNS="report_id" */
  SELECT count(*)
  INTO NUMROWS
  FROM tb_inspection_report
  WHERE
      /* %JoinFKPK( %New,tb_inspection_report," = "," AND") */
       new.report_id = tb_inspection_report.report_id;
  IF (
    /* %NotnullFK( %New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
RAISE EXCEPTION 'Cannot update tb_inspection_inspector because tb_inspection_report does not exist.';
END
IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_tb_inspection_inspector AFTER
UPDATE ON public."tb_inspection_inspector" for each row
EXECUTE PROCEDURE aft_update_U_tb_inspection_inspector
();



CREATE OR REPLACE FUNCTION aft_delete_tD_tb_inspection_report
() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* tb_inspection_report  tb_inspection_inspector on parent delete restrict */
  /* ERWIN_RELATION CHECKSUM="0003806b", PARENT_OWNER="", PARENT_TABLE="tb_inspection_report"
    CHILD_OWNER="", CHILD_TABLE="tb_inspection_inspector"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_33", FK_COLUMNS="report_id" */
  SELECT count(*)
  INTO NUMROWS
  FROM tb_inspection_inspector
  WHERE
        /*  %JoinFKPK(tb_inspection_inspector, %Old," = "," AND") */
        tb_inspection_inspector.report_id =  old.report_id;
  IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot delete tb_inspection_report because tb_inspection_inspector exists.';
END
IF;

     * erwin Builtin Trigger * 
     * tb_inspection_report  tb_inspection_check_result on parent
delete restrict * 
     * ERWIN_RELATION CHECKSUM
="00000000", PARENT_OWNER="", PARENT_TABLE="tb_inspection_report"
    CHILD_OWNER="", CHILD_TABLE="tb_inspection_check_result"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_29", FK_COLUMNS="report_id" *
SELECT count(*)
INTO NUMROWS
FROM tb_inspection_check_result
WHERE
         *  %JoinFKPK
(tb_inspection_check_result, %Old," = "," AND") * 
        tb_inspection_check_result.report_id =  old.report_id;
IF (NUMROWS > 0)
    THEN
      raise_application_error
(
        -20001,
        'Cannot delete tb_inspection_report because tb_inspection_check_result exists.'
      );
END
IF;

     * erwin Builtin Trigger * 
     * tb_inspection_report  tb_inspection_character_result on parent
delete restrict * 
     * ERWIN_RELATION CHECKSUM
="00000000", PARENT_OWNER="", PARENT_TABLE="tb_inspection_report"
    CHILD_OWNER="", CHILD_TABLE="tb_inspection_character_result"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_28", FK_COLUMNS="report_id" *
SELECT count(*)
INTO NUMROWS
FROM tb_inspection_character_result
WHERE
         *  %JoinFKPK
(tb_inspection_character_result, %Old," = "," AND") * 
        tb_inspection_character_result.report_id =  old.report_id;
IF (NUMROWS > 0)
    THEN
      raise_application_error
(
        -20001,
        'Cannot delete tb_inspection_report because tb_inspection_character_result exists.'
      );
END
IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_tb_inspection_report AFTER
DELETE ON public."tb_inspection_report" for each
row
EXECUTE PROCEDURE aft_delete_tD_tb_inspection_report
();


CREATE OR REPLACE FUNCTION aft_update_U_tb_inspection_report
() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* tb_inspection_report  tb_inspection_inspector on parent update restrict */
  /* ERWIN_RELATION CHECKSUM="0003efd7", PARENT_OWNER="", PARENT_TABLE="tb_inspection_report"
    CHILD_OWNER="", CHILD_TABLE="tb_inspection_inspector"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_33", FK_COLUMNS="report_id" */
  IF
    /* %JoinPKPK( %Old, %New," <> "," OR ") */
     old.report_id <>  new.report_id
  THEN
  SELECT count(*)
  INTO NUMROWS
  FROM tb_inspection_inspector
  WHERE
        /*  %JoinFKPK(tb_inspection_inspector, %Old," = "," AND") */
        tb_inspection_inspector.report_id =  old.report_id;
  IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot update tb_inspection_report because tb_inspection_inspector exists.';
END
IF;
  END
IF;

   * erwin Builtin Trigger * 
   * tb_inspection_report  tb_inspection_check_result on parent
update restrict * 
   * ERWIN_RELATION CHECKSUM
="00000000", PARENT_OWNER="", PARENT_TABLE="tb_inspection_report"
    CHILD_OWNER="", CHILD_TABLE="tb_inspection_check_result"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_29", FK_COLUMNS="report_id" *
IF
     * %JoinPKPK
( %Old, %New," <> "," OR ") * 
     old.report_id <>  new.report_id
  THEN
SELECT count(*)
INTO NUMROWS
FROM tb_inspection_check_result
WHERE
         *  %JoinFKPK
(tb_inspection_check_result, %Old," = "," AND") * 
        tb_inspection_check_result.report_id =  old.report_id;
IF (NUMROWS > 0)
    THEN 
      raise_application_error
(
        -20005,
        'Cannot update tb_inspection_report because tb_inspection_check_result exists.'
      );
END
IF;
  END
IF;

   * erwin Builtin Trigger * 
   * tb_inspection_report  tb_inspection_character_result on parent
update restrict * 
   * ERWIN_RELATION CHECKSUM
="00000000", PARENT_OWNER="", PARENT_TABLE="tb_inspection_report"
    CHILD_OWNER="", CHILD_TABLE="tb_inspection_character_result"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_28", FK_COLUMNS="report_id" *
IF
     * %JoinPKPK
( %Old, %New," <> "," OR ") * 
     old.report_id <>  new.report_id
  THEN
SELECT count(*)
INTO NUMROWS
FROM tb_inspection_character_result
WHERE
         *  %JoinFKPK
(tb_inspection_character_result, %Old," = "," AND") * 
        tb_inspection_character_result.report_id =  old.report_id;
IF (NUMROWS > 0)
    THEN 
      raise_application_error
(
        -20005,
        'Cannot update tb_inspection_report because tb_inspection_character_result exists.'
      );
END
IF;
  END
IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_tb_inspection_report AFTER
UPDATE ON public."tb_inspection_report" for each row
EXECUTE PROCEDURE aft_update_U_tb_inspection_report
();



CREATE OR REPLACE FUNCTION aft_delete_tD_tc_inspection_character
() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* tc_inspection_character  tb_inspection_character_result on parent delete restrict */
  /* ERWIN_RELATION CHECKSUM="0001241e", PARENT_OWNER="", PARENT_TABLE="tc_inspection_character"
    CHILD_OWNER="", CHILD_TABLE="tb_inspection_character_result"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_21", FK_COLUMNS="character_seq" */
  SELECT count(*)
  INTO NUMROWS
  FROM tb_inspection_character_result
  WHERE
        /*  %JoinFKPK(tb_inspection_character_result, %Old," = "," AND") */
        tb_inspection_character_result.character_seq =  old.character_seq;
  IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot delete tc_inspection_character because tb_inspection_character_result exists.';
END
IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_tc_inspection_character AFTER
DELETE ON public."tc_inspection_character" for each
row
EXECUTE PROCEDURE aft_delete_tD_tc_inspection_character
();


CREATE OR REPLACE FUNCTION aft_update_U_tc_inspection_character
() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* tc_inspection_character  tb_inspection_character_result on parent update restrict */
  /* ERWIN_RELATION CHECKSUM="000152b9", PARENT_OWNER="", PARENT_TABLE="tc_inspection_character"
    CHILD_OWNER="", CHILD_TABLE="tb_inspection_character_result"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_21", FK_COLUMNS="character_seq" */
  IF
    /* %JoinPKPK( %Old, %New," <> "," OR ") */
     old.character_seq <>  new.character_seq
  THEN
  SELECT count(*)
  INTO NUMROWS
  FROM tb_inspection_character_result
  WHERE
        /*  %JoinFKPK(tb_inspection_character_result, %Old," = "," AND") */
        tb_inspection_character_result.character_seq =  old.character_seq;
  IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot update tc_inspection_character because tb_inspection_character_result exists.';
END
IF;
  END
IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_tc_inspection_character AFTER
UPDATE ON public."tc_inspection_character" for each row
EXECUTE PROCEDURE aft_update_U_tc_inspection_character
();



CREATE OR REPLACE FUNCTION aft_delete_tD_tc_inspection_check_l
() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* tc_inspection_check_l  tc_inspection_check_mapping on parent delete restrict */
  /* ERWIN_RELATION CHECKSUM="00025270", PARENT_OWNER="", PARENT_TABLE="tc_inspection_check_l"
    CHILD_OWNER="", CHILD_TABLE="tc_inspection_check_mapping"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_34", FK_COLUMNS="check_large_code" */
  SELECT count(*)
  INTO NUMROWS
  FROM tc_inspection_check_mapping
  WHERE
        /*  %JoinFKPK(tc_inspection_check_mapping, %Old," = "," AND") */
        tc_inspection_check_mapping.check_large_code =  old.check_large_code;
  IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot delete tc_inspection_check_l because tc_inspection_check_mapping exists.';
END
IF;

     * erwin Builtin Trigger * 
     * tc_inspection_check_l  tc_inspection_check_m on parent
delete restrict * 
     * ERWIN_RELATION CHECKSUM
="00000000", PARENT_OWNER="", PARENT_TABLE="tc_inspection_check_l"
    CHILD_OWNER="", CHILD_TABLE="tc_inspection_check_m"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_30", FK_COLUMNS="check_large_code" *
SELECT count(*)
INTO NUMROWS
FROM tc_inspection_check_m
WHERE
         *  %JoinFKPK
(tc_inspection_check_m, %Old," = "," AND") * 
        tc_inspection_check_m.check_large_code =  old.check_large_code;
IF (NUMROWS > 0)
    THEN
      raise_application_error
(
        -20001,
        'Cannot delete tc_inspection_check_l because tc_inspection_check_m exists.'
      );
END
IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_tc_inspection_check_l AFTER
DELETE ON public."tc_inspection_check_l" for each
row
EXECUTE PROCEDURE aft_delete_tD_tc_inspection_check_l
();


CREATE OR REPLACE FUNCTION aft_update_U_tc_inspection_check_l
() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* tc_inspection_check_l  tc_inspection_check_mapping on parent update restrict */
  /* ERWIN_RELATION CHECKSUM="0002acab", PARENT_OWNER="", PARENT_TABLE="tc_inspection_check_l"
    CHILD_OWNER="", CHILD_TABLE="tc_inspection_check_mapping"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_34", FK_COLUMNS="check_large_code" */
  IF
    /* %JoinPKPK( %Old, %New," <> "," OR ") */
     old.check_large_code <>  new.check_large_code
  THEN
  SELECT count(*)
  INTO NUMROWS
  FROM tc_inspection_check_mapping
  WHERE
        /*  %JoinFKPK(tc_inspection_check_mapping, %Old," = "," AND") */
        tc_inspection_check_mapping.check_large_code =  old.check_large_code;
  IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot update tc_inspection_check_l because tc_inspection_check_mapping exists.';
END
IF;
  END
IF;

   * erwin Builtin Trigger * 
   * tc_inspection_check_l  tc_inspection_check_m on parent
update restrict * 
   * ERWIN_RELATION CHECKSUM
="00000000", PARENT_OWNER="", PARENT_TABLE="tc_inspection_check_l"
    CHILD_OWNER="", CHILD_TABLE="tc_inspection_check_m"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_30", FK_COLUMNS="check_large_code" *
IF
     * %JoinPKPK
( %Old, %New," <> "," OR ") * 
     old.check_large_code <>  new.check_large_code
  THEN
SELECT count(*)
INTO NUMROWS
FROM tc_inspection_check_m
WHERE
         *  %JoinFKPK
(tc_inspection_check_m, %Old," = "," AND") * 
        tc_inspection_check_m.check_large_code =  old.check_large_code;
IF (NUMROWS > 0)
    THEN 
      raise_application_error
(
        -20005,
        'Cannot update tc_inspection_check_l because tc_inspection_check_m exists.'
      );
END
IF;
  END
IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_tc_inspection_check_l AFTER
UPDATE ON public."tc_inspection_check_l" for each row
EXECUTE PROCEDURE aft_update_U_tc_inspection_check_l
();



CREATE OR REPLACE FUNCTION before_insert_tD_tc_inspection_check_m AFTER
DELETE ON public."tc_inspection_check_m" for each
row
EXECUTE PROCEDURE aft_delete_tD_tc_inspection_check_m
();

CREATE  TRIGGER tI_tc_inspection_check_m BEFORE
INSERT ON
tc_inspection_check_m
for
each
row
-- erwin Builtin Trigger
-- INSERT trigger on tc_inspection_check_m 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* tc_inspection_check_l  tc_inspection_check_m on child insert restrict */
  /* ERWIN_RELATION CHECKSUM="00011b57", PARENT_OWNER="", PARENT_TABLE="tc_inspection_check_l"
    CHILD_OWNER="", CHILD_TABLE="tc_inspection_check_m"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_30", FK_COLUMNS="check_large_code" */
  SELECT count(*)
  INTO NUMROWS
  FROM tc_inspection_check_l
  WHERE
        /* %JoinFKPK( %New,tc_inspection_check_l," = "," AND") */
         new.check_large_code = tc_inspection_check_l.check_large_code;
  IF (
      /* %NotnullFK( %New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error
  (
        -20002,
        'Cannot insert() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* tc_inspection_check_m  tc_inspection_check_s on parent delete restrict */
    /* ERWIN_RELATION CHECKSUM="00011954", PARENT_OWNER="", PARENT_TABLE="tc_inspection_check_m"
    CHILD_OWNER="", CHILD_TABLE="tc_inspection_check_s"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_31", FK_COLUMNS="check_medium_code" */
    SELECT count(*) INTO NUMROWS
      FROM tc_inspection_check_s
      WHERE
        /*  %JoinFKPK(tc_inspection_check_s, %Old," = "," AND") */
        tc_inspection_check_s.check_medium_code =  old.check_medium_code;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot
  delete tc_inspection_check_m because tc_inspection_check_s
  exists.';
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_tc_inspection_check_m AFTER DELETE ON public."tc_inspection_check_m" for each row
EXECUTE PROCEDURE aft_delete_tD_tc_inspection_check_m();

CREATE  TRIGGER tI_tc_inspection_check_m BEFORE INSERT ON tc_inspection_check_m for each row
-- erwin Builtin Trigger
-- INSERT trigger on tc_inspection_check_m 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* tc_inspection_check_l  tc_inspection_check_m on child insert restrict */
    /* ERWIN_RELATION CHECKSUM="00011b57", PARENT_OWNER="", PARENT_TABLE="tc_inspection_check_l"
    CHILD_OWNER="", CHILD_TABLE="tc_inspection_check_m"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_30", FK_COLUMNS="check_large_code" */
    SELECT count(*) INTO NUMROWS
      FROM tc_inspection_check_l
      WHERE
        /* %JoinFKPK( %New,tc_inspection_check_l," = "," AND") */
         new.check_large_code = tc_inspection_check_l.check_large_code;
    IF (
      /* %NotnullFK( %New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
RAISE EXCEPTION 'Cannot
  insert tc_inspection_check_m
  because
  tc_inspection_check_l
  does
  not exist.';

CREATE  TRIGGER tI_tc_inspection_check_m BEFORE INSERT ON tc_inspection_check_m for each row
-- erwin Builtin Trigger
-- INSERT trigger on tc_inspection_check_m 
DECLARE NUMROWS INTEGER;
BEGIN
     * erwin Builtin Trigger * 
     * tc_inspection_check_l  tc_inspection_check_m on child insert restrict * 
     * ERWIN_RELATION CHECKSUM="00011b57", PARENT_OWNER="", PARENT_TABLE="tc_inspection_check_l"
    CHILD_OWNER="", CHILD_TABLE="tc_inspection_check_m"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_30", FK_COLUMNS="check_large_code" * 
    SELECT count(*) INTO NUMROWS
      FROM tc_inspection_check_l
      WHERE
         * %JoinFKPK( %New,tc_inspection_check_l," = "," AND") * 
         new.check_large_code = tc_inspection_check_l.check_large_code;
    IF (
       * %NotnullFK( %New," IS NOT NULL AND") * 
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot
  insert tc_inspection_check_m
  because
  tc_inspection_check_l
  does
  not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION public."aft_delete_tD_tc_inspection_check_m() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* tc_inspection_check_m  tc_inspection_check_s on parent delete restrict */
    /* ERWIN_RELATION CHECKSUM="00011954", PARENT_OWNER="", PARENT_TABLE="tc_inspection_check_m"
    CHILD_OWNER="", CHILD_TABLE="tc_inspection_check_s"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_31", FK_COLUMNS="check_medium_code" */
    SELECT count(*) INTO NUMROWS
      FROM tc_inspection_check_s
      WHERE
        /*  %JoinFKPK(tc_inspection_check_s, %Old," = "," AND") */
        tc_inspection_check_s.check_medium_code =  old.check_medium_code;
    IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot
  delete tc_inspection_check_m because tc_inspection_check_s
  exists.';
    END IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER  tD_tc_inspection_check_m AFTER DELETE ON public."tc_inspection_check_m"" for each row
EXECUTE PROCEDURE before_insert_tD_tc_inspection_check_m AFTER DELETE ON public."tc_inspection_check_m" for each row
EXECUTE PROCEDURE aft_delete_tD_tc_inspection_check_m();

CREATE  TRIGGER tI_tc_inspection_check_m BEFORE INSERT ON tc_inspection_check_m for each row
-- erwin Builtin Trigger
-- INSERT trigger on tc_inspection_check_m 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* tc_inspection_check_l  tc_inspection_check_m on child insert restrict */
    /* ERWIN_RELATION CHECKSUM="00011b57", PARENT_OWNER="", PARENT_TABLE="tc_inspection_check_l"
    CHILD_OWNER="", CHILD_TABLE="tc_inspection_check_m"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_30", FK_COLUMNS="check_large_code" */
    SELECT count(*) INTO NUMROWS
      FROM tc_inspection_check_l
      WHERE
        /* %JoinFKPK( %New,tc_inspection_check_l," = "," AND") */
         new.check_large_code = tc_inspection_check_l.check_large_code;
    IF (
      /* %NotnullFK( %New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot
  insert()
  ;


  CREATE OR REPLACE FUNCTION aft_update_U_tc_inspection_check_m
  () 
RETURNS trigger AS
$$
  DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* tc_inspection_check_m  tc_inspection_check_s on parent update restrict */
  /* ERWIN_RELATION CHECKSUM="00028b9b", PARENT_OWNER="", PARENT_TABLE="tc_inspection_check_m"
    CHILD_OWNER="", CHILD_TABLE="tc_inspection_check_s"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_31", FK_COLUMNS="check_medium_code" */
  IF
    /* %JoinPKPK( %Old, %New," <> "," OR ") */
     old.check_medium_code <>  new.check_medium_code
  THEN
  SELECT count(*)
  INTO NUMROWS
  FROM tc_inspection_check_s
  WHERE
        /*  %JoinFKPK(tc_inspection_check_s, %Old," = "," AND") */
        tc_inspection_check_s.check_medium_code =  old.check_medium_code;
  IF (NUMROWS > 0)
    THEN
RAISE EXCEPTION 'Cannot update tc_inspection_check_m because tc_inspection_check_s exists.';
END
IF;
  END
IF;

   * erwin Builtin Trigger * 
   * tc_inspection_check_l  tc_inspection_check_m on child
update restrict * 
   * ERWIN_RELATION CHECKSUM
="00000000", PARENT_OWNER="", PARENT_TABLE="tc_inspection_check_l"
    CHILD_OWNER="", CHILD_TABLE="tc_inspection_check_m"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_30", FK_COLUMNS="check_large_code" *
SELECT count(*)
INTO NUMROWS
FROM tc_inspection_check_l
WHERE
       * %JoinFKPK
( %New,tc_inspection_check_l," = "," AND") * 
       new.check_large_code = tc_inspection_check_l.check_large_code;
IF (
     * %NotnullFK
( %New," IS NOT NULL AND") * 
    
    NUMROWS = 0
  )
  THEN
    raise_application_error
(
      -20007,
      'Cannot update tc_inspection_check_m because tc_inspection_check_l does not exist.'
    );
END
IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_tc_inspection_check_m AFTER
UPDATE ON public."tc_inspection_check_m" for each row
EXECUTE PROCEDURE aft_update_U_tc_inspection_check_m
();



CREATE OR REPLACE FUNCTION before_insert_I_tc_inspection_check_mapping
() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* tc_inspection_check_l  tc_inspection_check_mapping on child insert restrict */
  /* ERWIN_RELATION CHECKSUM="00012dfe", PARENT_OWNER="", PARENT_TABLE="tc_inspection_check_l"
    CHILD_OWNER="", CHILD_TABLE="tc_inspection_check_mapping"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_34", FK_COLUMNS="check_large_code" */
  SELECT count(*)
  INTO NUMROWS
  FROM tc_inspection_check_l
  WHERE
        /* %JoinFKPK( %New,tc_inspection_check_l," = "," AND") */
         new.check_large_code = tc_inspection_check_l.check_large_code;
  IF (
      /* %NotnullFK( %New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
RAISE EXCEPTION 'Cannot insert tc_inspection_check_mapping because tc_inspection_check_l does not exist.';
END
IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tI_tc_inspection_check_mapping BEFORE
INSERT ON public.
"tc_inspection_check_mapping"
for
each
row
EXECUTE PROCEDURE before_insert_I_tc_inspection_check_mapping
();


CREATE OR REPLACE FUNCTION aft_update_U_tc_inspection_check_mapping
() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* tc_inspection_check_l  tc_inspection_check_mapping on child update restrict */
  /* ERWIN_RELATION CHECKSUM="00012bc2", PARENT_OWNER="", PARENT_TABLE="tc_inspection_check_l"
    CHILD_OWNER="", CHILD_TABLE="tc_inspection_check_mapping"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_34", FK_COLUMNS="check_large_code" */
  SELECT count(*)
  INTO NUMROWS
  FROM tc_inspection_check_l
  WHERE
      /* %JoinFKPK( %New,tc_inspection_check_l," = "," AND") */
       new.check_large_code = tc_inspection_check_l.check_large_code;
  IF (
    /* %NotnullFK( %New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
RAISE EXCEPTION 'Cannot update tc_inspection_check_mapping because tc_inspection_check_l does not exist.';
END
IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_tc_inspection_check_mapping AFTER
UPDATE ON public."tc_inspection_check_mapping" for each row
EXECUTE PROCEDURE aft_update_U_tc_inspection_check_mapping
();



CREATE OR REPLACE FUNCTION before_insert_I_tc_inspection_check_s
() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* tc_inspection_check_m  tc_inspection_check_s on child insert restrict */
  /* ERWIN_RELATION CHECKSUM="00012277", PARENT_OWNER="", PARENT_TABLE="tc_inspection_check_m"
    CHILD_OWNER="", CHILD_TABLE="tc_inspection_check_s"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_31", FK_COLUMNS="check_medium_code" */
  SELECT count(*)
  INTO NUMROWS
  FROM tc_inspection_check_m
  WHERE
        /* %JoinFKPK( %New,tc_inspection_check_m," = "," AND") */
         new.check_medium_code = tc_inspection_check_m.check_medium_code;
  IF (
      /* %NotnullFK( %New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
RAISE EXCEPTION 'Cannot insert tc_inspection_check_s because tc_inspection_check_m does not exist.';
END
IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tI_tc_inspection_check_s BEFORE
INSERT ON public.
"tc_inspection_check_s"
for
each
row
EXECUTE PROCEDURE before_insert_I_tc_inspection_check_s
();


CREATE OR REPLACE FUNCTION aft_update_U_tc_inspection_check_s
() 
RETURNS trigger AS
$$
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* tc_inspection_check_m  tc_inspection_check_s on child update restrict */
  /* ERWIN_RELATION CHECKSUM="000121b1", PARENT_OWNER="", PARENT_TABLE="tc_inspection_check_m"
    CHILD_OWNER="", CHILD_TABLE="tc_inspection_check_s"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_31", FK_COLUMNS="check_medium_code" */
  SELECT count(*)
  INTO NUMROWS
  FROM tc_inspection_check_m
  WHERE
      /* %JoinFKPK( %New,tc_inspection_check_m," = "," AND") */
       new.check_medium_code = tc_inspection_check_m.check_medium_code;
  IF (
    /* %NotnullFK( %New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
RAISE EXCEPTION 'Cannot update tc_inspection_check_s because tc_inspection_check_m does not exist.';
END
IF;


-- erwin Builtin Trigger
END;
 
$$
LANGUAGE 'plpgsql';

CREATE  TRIGGER tU_tc_inspection_check_s AFTER
UPDATE ON public."tc_inspection_check_s" for each row
EXECUTE PROCEDURE aft_update_U_tc_inspection_check_s
();

