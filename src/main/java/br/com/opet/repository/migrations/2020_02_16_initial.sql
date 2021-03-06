drop table q_timeline;
drop table q_history;
drop table q_user;
drop sequence seq_q_timeline;
drop sequence seq_q_history;
drop sequence seq_q_user;

create sequence seq_q_user;
create sequence seq_q_history;
create sequence seq_q_timeline;

CREATE TABLE Q_USER (
    ID NUMBER NOT NULL,
	NAME VARCHAR2(50),
	LAST_NAME VARCHAR2(50),
	NICKNAME VARCHAR2(50),
	MAIL VARCHAR2(50),
	PASSWORD VARCHAR2(50),
	GENDER VARCHAR2(20),
	CHARISMA NUMBER(3,0),
	TYPE_USER NUMBER(3,0),
    CONSTRAINT pk_id_q_user PRIMARY KEY (ID)
);

CREATE TABLE Q_HISTORY (
    ID NUMBER NOT NULL, 
	TITLE VARCHAR2(100), 
	SUBTITLE VARCHAR2(100), 
    RESUME VARCHAR2(100),
    AUTHOR NUMBER NOT NULL,
    CONSTRAINT pk_id_q_history PRIMARY KEY (ID),
    CONSTRAINT fk_q_history_q_user FOREIGN KEY (AUTHOR) REFERENCES q_user (id) ON DELETE CASCADE
);

CREATE TABLE Q_TIMELINE (
    ID NUMBER NOT NULL,
	IMAGELINK BLOB NOT NULL,
	VARIANT VARCHAR2(30) NOT NULL,
	PERIOD NUMBER NOT NULL,
	ORDINATION_POSITION NUMBER NOT NULL,
	QUESTION VARCHAR2(500),
	REPLY_LABEL_1 VARCHAR2(500),
	REPLY_LABEL_2 VARCHAR2(500),
	REPLY_1 NUMBER,
	REPLY_2 NUMBER,
    CONSTRAINT pk_id_q_timeline PRIMARY KEY (ID),
    CONSTRAINT fk_q_timeline_q_history FOREIGN KEY (id) REFERENCES q_user (id) ON DELETE CASCADE
);

insert into q_user(id, name, last_name, nickname, mail, password, gender, charisma, type_user) values(SEQ_Q_USER.nextval, 'n','ln', 'nn', 'm','p','g',100,0);
select * from q_user;
