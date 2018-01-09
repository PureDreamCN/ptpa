---------------------------------------------
-- Export file for user PTPA               --
-- Created by sunchao on 2018/1/9, 9:39:15 --
---------------------------------------------

spool pay_refund_spec_data.log

prompt
prompt Creating table T_BOOK
prompt =====================
prompt
create table PTPA.T_BOOK
(
  ID                      NUMBER(11) not null,
  TRAIN_ID                NUMBER(11),
  START_DATE              DATE,
  PT_TICKE_INCOMING       NUMBER(13,2),
  PT_PERSON_COUNT         NUMBER(4),
  DR_TICKE_INCOMING       NUMBER(13,2),
  DR_PERSON_COUNT         NUMBER(4),
  PT_TICKET_SERVICE_COST  NUMBER(13,2),
  PT_STATION_SERVICE_COST NUMBER(13,2),
  DR_TICKET_SERVICE_COST  NUMBER(13,2),
  DR_STATION_SERVICE_COST NUMBER(13,2)
)
tablespace PTPA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column PTPA.T_BOOK.ID
  is '����';
comment on column PTPA.T_BOOK.TRAIN_ID
  is '��������ID����Դ��������';
comment on column PTPA.T_BOOK.START_DATE
  is '��������';
comment on column PTPA.T_BOOK.PT_TICKE_INCOMING
  is '���˲�Ʊ�����룬��ȷ��С�������λ';
comment on column PTPA.T_BOOK.PT_PERSON_COUNT
  is '���˲���������';
comment on column PTPA.T_BOOK.DR_TICKE_INCOMING
  is '���Ĳ�Ʊ�����룬��ȷ��С�������λ';
comment on column PTPA.T_BOOK.DR_PERSON_COUNT
  is '���Ĳ���������';
comment on column PTPA.T_BOOK.PT_TICKET_SERVICE_COST
  is '���˲���Ʊ����ɱ�����ȷ��С�������λ';
comment on column PTPA.T_BOOK.PT_STATION_SERVICE_COST
  is '���˲���վ����ɱ�����ȷ��С�������λ';
comment on column PTPA.T_BOOK.DR_TICKET_SERVICE_COST
  is '���Ĳ���Ʊ����ɱ�����ȷ��С�������λ';
comment on column PTPA.T_BOOK.DR_STATION_SERVICE_COST
  is '���Ĳ���վ����ɱ�����ȷ��С�������λ';
alter table PTPA.T_BOOK
  add constraint PK_T_BOOK primary key (ID)
  using index 
  tablespace PTPA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index PTPA.IDX_T_BOOK on PTPA.T_BOOK (START_DATE)
  tablespace PTPA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_DIC_BUREAU
prompt ===========================
prompt
create table PTPA.T_DIC_BUREAU
(
  LJDM       VARCHAR2(2) not null,
  NAME       VARCHAR2(20),
  SHORT_NAME VARCHAR2(2),
  CODE       NUMBER(2) not null
)
tablespace PTPA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column PTPA.T_DIC_BUREAU.LJDM
  is '·�ִ��룬���籨��';
comment on column PTPA.T_DIC_BUREAU.NAME
  is 'ȫ��';
comment on column PTPA.T_DIC_BUREAU.SHORT_NAME
  is '���';
comment on column PTPA.T_DIC_BUREAU.CODE
  is '����';
alter table PTPA.T_DIC_BUREAU
  add constraint PK_T_DIC_BUREAU primary key (LJDM)
  using index 
  tablespace PTPA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_DIC_RAILWAY
prompt ============================
prompt
create table PTPA.T_DIC_RAILWAY
(
  XLDM                  VARCHAR2(20) not null,
  NAME                  VARCHAR2(30),
  BEGIN_CZDM            VARCHAR2(20),
  END_CZDM              VARCHAR2(20),
  MILEAGE               NUMBER(6),
  LINE_PRICE_LEVEL_CODE VARCHAR2(20),
  LINE_PRICE_LEVEL_NAME VARCHAR2(20),
  PROPERTY_RIGHT        VARCHAR2(20)
)
tablespace PTPA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column PTPA.T_DIC_RAILWAY.XLDM
  is '��·����';
comment on column PTPA.T_DIC_RAILWAY.NAME
  is '��·����';
comment on column PTPA.T_DIC_RAILWAY.BEGIN_CZDM
  is '���վ��վ���룬��Դ������Ӫҵվ��';
comment on column PTPA.T_DIC_RAILWAY.END_CZDM
  is '����վ��վ���룬��Դ������Ӫҵվ��';
comment on column PTPA.T_DIC_RAILWAY.MILEAGE
  is '��̣���λkm����ȷ����λ';
comment on column PTPA.T_DIC_RAILWAY.LINE_PRICE_LEVEL_CODE
  is '��·����ȼ�CODE����Դϵͳ�ֵ䡱��·����ȼ���';
comment on column PTPA.T_DIC_RAILWAY.LINE_PRICE_LEVEL_NAME
  is '��·����ȼ�NAME����Դϵͳ�ֵ䡱��·����ȼ���';
comment on column PTPA.T_DIC_RAILWAY.PROPERTY_RIGHT
  is '��Ȩ';
alter table PTPA.T_DIC_RAILWAY
  add constraint PK_T_DIC_RAILWAY primary key (XLDM)
  using index 
  tablespace PTPA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_DIC_STATION
prompt ============================
prompt
create table PTPA.T_DIC_STATION
(
  CZDM   VARCHAR2(20) not null,
  NAME   VARCHAR2(20),
  LJDM   VARCHAR2(2),
  PINYIN VARCHAR2(20)
)
tablespace PTPA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column PTPA.T_DIC_STATION.CZDM
  is '��վ���룬���籨��';
comment on column PTPA.T_DIC_STATION.NAME
  is 'վ��';
comment on column PTPA.T_DIC_STATION.LJDM
  is '������·�ִ���';
comment on column PTPA.T_DIC_STATION.PINYIN
  is 'ƴ��';
alter table PTPA.T_DIC_STATION
  add constraint PK_T_DIC_STATION primary key (CZDM)
  using index 
  tablespace PTPA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_DR_TRAINPS
prompt ===========================
prompt
create table PTPA.T_DR_TRAINPS
(
  ID                NUMBER(11) not null,
  JL_CODE           NUMBER(11),
  STATISTIC_DATE    DATE,
  CC                VARCHAR2(20),
  PASSENGER_VOLUME  NUMBER(4),
  PASSENGER_MILEAGE NUMBER(11),
  FARE_SUM          NUMBER(13,2),
  LJDM              VARCHAR2(2),
  CREATED_BY        VARCHAR2(20),
  CREATED_AT        DATE,
  LAST_MODIFIED_BY  VARCHAR2(20),
  LAST_MODIFIED_AT  DATE
)
tablespace PTPA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column PTPA.T_DR_TRAINPS.ID
  is '����';
comment on column PTPA.T_DR_TRAINPS.JL_CODE
  is '��·��';
comment on column PTPA.T_DR_TRAINPS.STATISTIC_DATE
  is '����';
comment on column PTPA.T_DR_TRAINPS.CC
  is '����';
comment on column PTPA.T_DR_TRAINPS.PASSENGER_VOLUME
  is '�ÿͷ��������ˣ�';
comment on column PTPA.T_DR_TRAINPS.PASSENGER_MILEAGE
  is 'ȫ����ת�����˹��';
comment on column PTPA.T_DR_TRAINPS.FARE_SUM
  is 'Ʊ�ۺϼƣ�Ԫ��';
comment on column PTPA.T_DR_TRAINPS.LJDM
  is '·��';
comment on column PTPA.T_DR_TRAINPS.CREATED_BY
  is '������';
comment on column PTPA.T_DR_TRAINPS.CREATED_AT
  is '����ʱ��';
comment on column PTPA.T_DR_TRAINPS.LAST_MODIFIED_BY
  is '�ϴ��޸���';
comment on column PTPA.T_DR_TRAINPS.LAST_MODIFIED_AT
  is '�ϴ��޸�ʱ��';
alter table PTPA.T_DR_TRAINPS
  add constraint PK_T_DR_TRAINSTATISTIC primary key (ID)
  using index 
  tablespace PTPA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_DR_TRAINSTATISTIC
prompt ==================================
prompt
create table PTPA.T_DR_TRAINSTATISTIC
(
  ID                        NUMBER(11) not null,
  CC                        VARCHAR2(20),
  DDJMC                     VARCHAR2(20),
  LINE_CODE                 VARCHAR2(10),
  BEGIN_END                 VARCHAR2(30),
  MILEAGE                   NUMBER(3),
  RAILWAY_NAME              VARCHAR2(100),
  RAILWAY_LEVEL             VARCHAR2(2),
  RAILWAY_SSJMC             VARCHAR2(20),
  LOCOMOTIVE_TYPE           VARCHAR2(20),
  LOCOMOTIVE_PSJMC          VARCHAR2(20),
  TRAIN_MILEAGE             NUMBER(13,2),
  TRAIN_VEHICLE_MILEAGE_SUM NUMBER(13,2),
  CREATED_BY                VARCHAR2(20),
  CREATED_AT                DATE,
  LAST_MODIFIED_BY          VARCHAR2(20),
  LAST_MODIFIED_AT          DATE
)
tablespace PTPA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column PTPA.T_DR_TRAINSTATISTIC.ID
  is '����';
comment on column PTPA.T_DR_TRAINSTATISTIC.CC
  is '�ϱ�����';
comment on column PTPA.T_DR_TRAINSTATISTIC.DDJMC
  is '����������';
comment on column PTPA.T_DR_TRAINSTATISTIC.LINE_CODE
  is '���δ���';
comment on column PTPA.T_DR_TRAINSTATISTIC.BEGIN_END
  is '����������';
comment on column PTPA.T_DR_TRAINSTATISTIC.MILEAGE
  is '�������';
comment on column PTPA.T_DR_TRAINSTATISTIC.RAILWAY_NAME
  is '��·��';
comment on column PTPA.T_DR_TRAINSTATISTIC.RAILWAY_LEVEL
  is '��·�ȼ�';
comment on column PTPA.T_DR_TRAINSTATISTIC.RAILWAY_SSJMC
  is '��·����������';
comment on column PTPA.T_DR_TRAINSTATISTIC.LOCOMOTIVE_TYPE
  is '��������';
comment on column PTPA.T_DR_TRAINSTATISTIC.LOCOMOTIVE_PSJMC
  is '��������������';
comment on column PTPA.T_DR_TRAINSTATISTIC.TRAIN_MILEAGE
  is '�г�����';
comment on column PTPA.T_DR_TRAINSTATISTIC.TRAIN_VEHICLE_MILEAGE_SUM
  is '�ͳ���������ϼ�';
comment on column PTPA.T_DR_TRAINSTATISTIC.CREATED_BY
  is '������';
comment on column PTPA.T_DR_TRAINSTATISTIC.CREATED_AT
  is '����ʱ��';
comment on column PTPA.T_DR_TRAINSTATISTIC.LAST_MODIFIED_BY
  is '�ϴ��޸���';
comment on column PTPA.T_DR_TRAINSTATISTIC.LAST_MODIFIED_AT
  is '�ϴ��޸�ʱ��';
alter table PTPA.T_DR_TRAINSTATISTIC
  add constraint PK_T_DR_TRAIN primary key (ID)
  using index 
  tablespace PTPA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_LV_CDJL
prompt ========================
prompt
create table PTPA.T_LV_CDJL
(
  ID               NUMBER(11) not null,
  NAME             VARCHAR2(20),
  CC               VARCHAR2(300),
  LJDM             VARCHAR2(2),
  SPEED_LEVEL      VARCHAR2(10),
  TRAIN_TYPE_CODE  VARCHAR2(20),
  TRAIN_TYPE_NAME  VARCHAR2(20),
  LINE             VARCHAR2(300),
  MILEAGE          NUMBER(5),
  GROUP_COUNT      NUMBER(2),
  TIME_COST        VARCHAR2(10),
  CREATED_BY       VARCHAR2(20),
  CREATED_AT       DATE,
  LAST_MODIFIED_BY VARCHAR2(20),
  LAST_MODIFIED_AT DATE
)
tablespace PTPA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column PTPA.T_LV_CDJL.ID
  is '����';
comment on column PTPA.T_LV_CDJL.NAME
  is '���׽�·����';
comment on column PTPA.T_LV_CDJL.CC
  is '���׽�·���Σ����μ��á�-���ָ�';
comment on column PTPA.T_LV_CDJL.LJDM
  is '�����ִ��룬��Դ��·��';
comment on column PTPA.T_LV_CDJL.SPEED_LEVEL
  is '�ٶȵȼ�����ʾΪ����200-250��';
comment on column PTPA.T_LV_CDJL.TRAIN_TYPE_CODE
  is '�����г��������ƣ���Դϵͳ�ֵ䡰�����г����͡�';
comment on column PTPA.T_LV_CDJL.TRAIN_TYPE_NAME
  is '�����г����ʹ��룬��Դϵͳ�ֵ䡰�����г����͡�';
comment on column PTPA.T_LV_CDJL.LINE
  is '��·��������';
comment on column PTPA.T_LV_CDJL.MILEAGE
  is '��·�����';
comment on column PTPA.T_LV_CDJL.GROUP_COUNT
  is '��������';
comment on column PTPA.T_LV_CDJL.TIME_COST
  is '��·��ʱ�䣬��ʾΪ����Сʱ�����ӡ�';
comment on column PTPA.T_LV_CDJL.CREATED_BY
  is '������';
comment on column PTPA.T_LV_CDJL.CREATED_AT
  is '����ʱ��';
comment on column PTPA.T_LV_CDJL.LAST_MODIFIED_BY
  is '�ϴ��޸���';
comment on column PTPA.T_LV_CDJL.LAST_MODIFIED_AT
  is '�ϴ��޸�ʱ��';
alter table PTPA.T_LV_CDJL
  add constraint PK_T_LV_CDJL primary key (ID)
  using index 
  tablespace PTPA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_LV_CDJLCC
prompt ==========================
prompt
create table PTPA.T_LV_CDJLCC
(
  ID        NUMBER(11) not null,
  CDJL_ID   NUMBER(11),
  CC        VARCHAR2(20),
  MILEAGE   NUMBER(5),
  START_END VARCHAR2(50)
)
tablespace PTPA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column PTPA.T_LV_CDJLCC.ID
  is '����';
comment on column PTPA.T_LV_CDJLCC.CDJL_ID
  is '���������׽�·ID����Դ�����������׽�·��';
comment on column PTPA.T_LV_CDJLCC.CC
  is '����';
comment on column PTPA.T_LV_CDJLCC.MILEAGE
  is '�������';
comment on column PTPA.T_LV_CDJLCC.START_END
  is '��������';
alter table PTPA.T_LV_CDJLCC
  add constraint PK_T_LV_CDJLCC primary key (ID)
  using index 
  tablespace PTPA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index PTPA.IDX_T_LV_CDJLCC on PTPA.T_LV_CDJLCC (CDJL_ID)
  tablespace PTPA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_LV_CDJLCL
prompt ==========================
prompt
create table PTPA.T_LV_CDJLCL
(
  ID          NUMBER(11) not null,
  CDJL_ID     NUMBER(11),
  CX_CODE     VARCHAR2(20),
  CX_NAME     VARCHAR2(20),
  CZ_CODE     VARCHAR2(20),
  CZ_NAME     VARCHAR2(20),
  CAPACITY    NUMBER(3),
  ORDER_INDEX NUMBER(6)
)
tablespace PTPA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column PTPA.T_LV_CDJLCL.ID
  is '����';
comment on column PTPA.T_LV_CDJLCL.CDJL_ID
  is '���������׽�·ID����Դ�����������׽�·��';
comment on column PTPA.T_LV_CDJLCL.CX_CODE
  is '���ͱ��룺��Դ��ϵͳ�ֵ�"����"';
comment on column PTPA.T_LV_CDJLCL.CX_NAME
  is '�������ƣ���Դ��ϵͳ�ֵ�"����"';
comment on column PTPA.T_LV_CDJLCL.CZ_CODE
  is '���ֱ��룺��Դ��ϵͳ�ֵ�"����"';
comment on column PTPA.T_LV_CDJLCL.CZ_NAME
  is '�������ƣ���Դ��ϵͳ�ֵ�"����"';
comment on column PTPA.T_LV_CDJLCL.CAPACITY
  is '��Ա';
comment on column PTPA.T_LV_CDJLCL.ORDER_INDEX
  is '����';
alter table PTPA.T_LV_CDJLCL
  add constraint PK_T_LV_CDJLCL primary key (ID)
  using index 
  tablespace PTPA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index PTPA.IDX_T_LV_CDJLCL on PTPA.T_LV_CDJLCL (CDJL_ID)
  tablespace PTPA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_PRICE_CE
prompt =========================
prompt
create table PTPA.T_PRICE_CE
(
  ID                NUMBER(11) not null,
  PSE_CODE          VARCHAR2(20),
  PSE_NAME          VARCHAR2(40),
  LJDM              VARCHAR2(2),
  CATENARY_PRICE    NUMBER(13,2),
  ELECTRICITY_PRICE NUMBER(13,2)
)
tablespace PTPA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table PTPA.T_PRICE_CE
  is 'CATENARY and ELECTRICITY
�Ӵ����͵�����㵥��';
comment on column PTPA.T_PRICE_CE.ID
  is '����';
comment on column PTPA.T_PRICE_CE.PSE_CODE
  is '��ר��ҵ���룬��Դϵͳ�ֵ䡰��ר��ҵ��';
comment on column PTPA.T_PRICE_CE.PSE_NAME
  is '��ר��ҵ���ƣ���Դϵͳ�ֵ䡰��ר��ҵ��';
comment on column PTPA.T_PRICE_CE.LJDM
  is '��·�ִ��룬��Դ"��·��"';
comment on column PTPA.T_PRICE_CE.CATENARY_PRICE
  is '�Ӵ������㵥�ۣ���λ��Ԫ/�ֹ����ȷ��С�����2λ';
comment on column PTPA.T_PRICE_CE.ELECTRICITY_PRICE
  is '������㵥�ۣ���λ��Ԫ/�ֹ����ȷ��С�����2λ';
alter table PTPA.T_PRICE_CE
  add constraint PK_T_PRICE_CE primary key (ID)
  using index 
  tablespace PTPA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_PRICE_HUMANRESOURCE
prompt ====================================
prompt
create table PTPA.T_PRICE_HUMANRESOURCE
(
  ID                       NUMBER(11) not null,
  HUMAN_RESOURCE_TYPE_CODE VARCHAR2(20),
  HUMAN_RESOURCE_TYPE_NAME VARCHAR2(20),
  LJDM                     VARCHAR2(2),
  PRICE                    NUMBER(13,2),
  RATE                     NUMBER(13,9)
)
tablespace PTPA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column PTPA.T_PRICE_HUMANRESOURCE.ID
  is '����';
comment on column PTPA.T_PRICE_HUMANRESOURCE.HUMAN_RESOURCE_TYPE_CODE
  is '�������ʹ��룬��Դϵͳ�ֵ䡰������Դ���͡�';
comment on column PTPA.T_PRICE_HUMANRESOURCE.HUMAN_RESOURCE_TYPE_NAME
  is '�����������ƣ���Դϵͳ�ֵ䡰������Դ���͡�';
comment on column PTPA.T_PRICE_HUMANRESOURCE.LJDM
  is '��·�ִ��룬��Դ"��·��"';
comment on column PTPA.T_PRICE_HUMANRESOURCE.PRICE
  is 'ƽ������֧������λ��Ԫ/���꣬��ȷ��С�����2λ';
comment on column PTPA.T_PRICE_HUMANRESOURCE.RATE
  is 'ÿ�г�ÿ������Ա����������λ����/�й����ȷ��С�����9λ';
alter table PTPA.T_PRICE_HUMANRESOURCE
  add constraint PK_T_PRICE_HUMANRESOURCE primary key (ID)
  using index 
  tablespace PTPA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_PRICE_LINE
prompt ===========================
prompt
create table PTPA.T_PRICE_LINE
(
  ID                          NUMBER(11) not null,
  LINE_PRICE_LEVEL_CODE       VARCHAR2(20),
  LINE_PRICE_LEVEL_NAME       VARCHAR2(20),
  TRAIN_TYPE_CODE             VARCHAR2(20),
  TRAIN_TYPE_NAME             VARCHAR2(20),
  TRAIN_MARSHALLING_TYPE_CODE VARCHAR2(20),
  TRAIN_MARSHALLING_TYPE_NAME VARCHAR2(20),
  LINE_BUSY_LEVEL_CODE        VARCHAR2(20),
  LINE_BUSY_LEVEL_NAME        VARCHAR2(20),
  BEFORE_DAWN                 NUMBER(4),
  BEFORE_DAWN_RATE            NUMBER(5,2),
  PRICE                       NUMBER(13,2)
)
tablespace PTPA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column PTPA.T_PRICE_LINE.ID
  is '����';
comment on column PTPA.T_PRICE_LINE.LINE_PRICE_LEVEL_CODE
  is '��·����ȼ�CODE����Դϵͳ�ֵ䡱��·����ȼ���';
comment on column PTPA.T_PRICE_LINE.LINE_PRICE_LEVEL_NAME
  is '��·����ȼ�NAME����Դϵͳ�ֵ䡱��·����ȼ���';
comment on column PTPA.T_PRICE_LINE.TRAIN_TYPE_CODE
  is '�г����ͱ��룬��Դϵͳ�ֵ䡰�г����͡�';
comment on column PTPA.T_PRICE_LINE.TRAIN_TYPE_NAME
  is '�г��������ƣ���Դϵͳ�ֵ䡰�г����͡�';
comment on column PTPA.T_PRICE_LINE.TRAIN_MARSHALLING_TYPE_CODE
  is '�г��������ͱ��룬��Դϵͳ�ֵ䡰�г��������͡�';
comment on column PTPA.T_PRICE_LINE.TRAIN_MARSHALLING_TYPE_NAME
  is '�г������������ƣ���Դϵͳ�ֵ䡰�г��������͡�';
comment on column PTPA.T_PRICE_LINE.LINE_BUSY_LEVEL_CODE
  is '��·��æ�̶ȱ��룬��Դϵͳ�ֵ䡰��·��æ�̶ȡ�';
comment on column PTPA.T_PRICE_LINE.LINE_BUSY_LEVEL_NAME
  is '��·��æ�̶����ƣ���Դϵͳ�ֵ䡰��·��æ�̶ȡ�';
comment on column PTPA.T_PRICE_LINE.BEFORE_DAWN
  is '�Ƿ���22ʱ������6ʱ����0����1����';
comment on column PTPA.T_PRICE_LINE.BEFORE_DAWN_RATE
  is '��22ʱ������6ʱ���������������ȷ��С�������λ';
comment on column PTPA.T_PRICE_LINE.PRICE
  is '���㵥�ۣ���λ��Ԫ/�г������ȷ����';
alter table PTPA.T_PRICE_LINE
  add constraint PK_T_PRICE_LINE primary key (ID)
  using index 
  tablespace PTPA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_PRICE_PART
prompt ===========================
prompt
create table PTPA.T_PRICE_PART
(
  ID              NUMBER(11) not null,
  LJDM            VARCHAR2(2),
  PRICE           NUMBER(13,2),
  TRAIN_TYPE_CODE VARCHAR2(20),
  TRAIN_TYPE_NAME VARCHAR2(20)
)
tablespace PTPA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column PTPA.T_PRICE_PART.ID
  is '����';
comment on column PTPA.T_PRICE_PART.LJDM
  is '��·�ִ��룬��Դ"��·��"';
comment on column PTPA.T_PRICE_PART.PRICE
  is '���㵥�ۣ���λ��Ԫ/�й����ȷ��С�����2λ';
comment on column PTPA.T_PRICE_PART.TRAIN_TYPE_CODE
  is '�����г����ʹ��룬��Դϵͳ�ֵ䡰�����г����͡�';
comment on column PTPA.T_PRICE_PART.TRAIN_TYPE_NAME
  is '�����г��������ƣ���Դϵͳ�ֵ䡰�����г����͡�';
alter table PTPA.T_PRICE_PART
  add constraint PK_T_PRICE_PART primary key (ID)
  using index 
  tablespace PTPA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_PRICE_SERVICE
prompt ==============================
prompt
create table PTPA.T_PRICE_SERVICE
(
  ID           NUMBER(11) not null,
  SERVICE_CODE VARCHAR2(20),
  SERVICE_NAME VARCHAR2(20),
  LJDM         VARCHAR2(2),
  UNIT         VARCHAR2(20),
  PRICE        NUMBER(13,2)
)
tablespace PTPA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table PTPA.T_PRICE_SERVICE
  is '����������㵥�۰����ķ���
���ط���
�ֶɷ���

��Ʊ��
�Զ���
�յ���
��Ʊ�����
��վ�ÿͷ����
��ˮ�����';
comment on column PTPA.T_PRICE_SERVICE.ID
  is '����';
comment on column PTPA.T_PRICE_SERVICE.SERVICE_CODE
  is '������룬��Դϵͳ�ֵ䡰����';
comment on column PTPA.T_PRICE_SERVICE.SERVICE_NAME
  is '�������ƣ���Դϵͳ�ֵ䡰����';
comment on column PTPA.T_PRICE_SERVICE.LJDM
  is '��·�ִ��룬��Դ"��·��"';
comment on column PTPA.T_PRICE_SERVICE.UNIT
  is '���������λ';
comment on column PTPA.T_PRICE_SERVICE.PRICE
  is '���㵥�ۣ���λ��Ԫ/������λ����ȷ��С�����2λ';
alter table PTPA.T_PRICE_SERVICE
  add constraint PK_T_PRICE_SERVICE primary key (ID)
  using index 
  tablespace PTPA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_PRICE_STATIONSERVICE
prompt =====================================
prompt
create table PTPA.T_PRICE_STATIONSERVICE
(
  ID                        NUMBER(11) not null,
  STATION_SERVICE_TYPE_CODE VARCHAR2(20),
  STATION_SERVICE_TYPE_NAME VARCHAR2(50),
  PRICE                     NUMBER(2)
)
tablespace PTPA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column PTPA.T_PRICE_STATIONSERVICE.ID
  is '����';
comment on column PTPA.T_PRICE_STATIONSERVICE.STATION_SERVICE_TYPE_CODE
  is '��վ�ÿͷ��������룬��Դϵͳ�ֵ䡰��վ�ÿͷ������';
comment on column PTPA.T_PRICE_STATIONSERVICE.STATION_SERVICE_TYPE_NAME
  is '��վ�ÿͷ���������ƣ���Դϵͳ�ֵ䡰��վ�ÿͷ������"';
comment on column PTPA.T_PRICE_STATIONSERVICE.PRICE
  is '���㵥�ۣ���λ��Ԫ/��';
alter table PTPA.T_PRICE_STATIONSERVICE
  add constraint PK_T_PRICE_STATIONSERVICE primary key (ID)
  using index 
  tablespace PTPA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_PRICE_TRACTION
prompt ===============================
prompt
create table PTPA.T_PRICE_TRACTION
(
  ID                 NUMBER(11) not null,
  TRACTION_TYPE_CODE VARCHAR2(20),
  TRACTION_TYPE_NAME VARCHAR2(20),
  LJDM               VARCHAR2(2),
  LOCOMOTIVE_PRICE   NUMBER(13,2),
  CE_PRICE           NUMBER(13,2),
  PRICE              NUMBER(13,2)
)
tablespace PTPA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column PTPA.T_PRICE_TRACTION.ID
  is '����';
comment on column PTPA.T_PRICE_TRACTION.TRACTION_TYPE_CODE
  is 'ǣ�����ͱ��룬��Դϵͳ�ֵ䡰ǣ�����͡�';
comment on column PTPA.T_PRICE_TRACTION.TRACTION_TYPE_NAME
  is 'ǣ���������ƣ���Դϵͳ�ֵ䡰ǣ�����͡�';
comment on column PTPA.T_PRICE_TRACTION.LJDM
  is '��·�ִ��룬��Դ"��·��"';
comment on column PTPA.T_PRICE_TRACTION.LOCOMOTIVE_PRICE
  is '�������㵥�ۣ���ȷ��С�����2λ';
comment on column PTPA.T_PRICE_TRACTION.CE_PRICE
  is '��������ʹ�ýӴ����͵�����㵥�ۣ���ȷ��С�����2λ';
comment on column PTPA.T_PRICE_TRACTION.PRICE
  is '���㵥�ۣ���λ��Ԫ/�ֹ����ȷ��С�����2λ���������㵥�ۺ͵�������ʹ�ýӴ������㵥��֮��';
alter table PTPA.T_PRICE_TRACTION
  add constraint PK_T_PRICE_TRACTION primary key (ID)
  using index 
  tablespace PTPA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_SYS_DEPARTMENT
prompt ===============================
prompt
create table PTPA.T_SYS_DEPARTMENT
(
  ID               NUMBER(11) not null,
  NAME             VARCHAR2(40) not null,
  PARENT_ID        NUMBER(11),
  TYPE             NUMBER(2) not null,
  CODE             VARCHAR2(20),
  DISPLAY_ORDER    NUMBER(6) not null,
  NOTE             VARCHAR2(200),
  CREATED_BY       VARCHAR2(20),
  CREATED_AT       DATE,
  LAST_MODIFIED_BY VARCHAR2(20),
  LAST_MODIFIED_AT DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column PTPA.T_SYS_DEPARTMENT.ID
  is '��������SEQ_T_SYS_DEPARTMENT����';
comment on column PTPA.T_SYS_DEPARTMENT.NAME
  is '����';
comment on column PTPA.T_SYS_DEPARTMENT.PARENT_ID
  is '�ϼ��ڵ㣬��Ӧ����ID';
comment on column PTPA.T_SYS_DEPARTMENT.TYPE
  is '�������ͣ����ֵ�ȡ������1·��2���˶�3������';
comment on column PTPA.T_SYS_DEPARTMENT.CODE
  is '���ű���';
comment on column PTPA.T_SYS_DEPARTMENT.DISPLAY_ORDER
  is '����';
comment on column PTPA.T_SYS_DEPARTMENT.NOTE
  is '��ע';
comment on column PTPA.T_SYS_DEPARTMENT.CREATED_BY
  is '������';
comment on column PTPA.T_SYS_DEPARTMENT.CREATED_AT
  is '����ʱ��';
comment on column PTPA.T_SYS_DEPARTMENT.LAST_MODIFIED_BY
  is '�ϴ��޸���';
comment on column PTPA.T_SYS_DEPARTMENT.LAST_MODIFIED_AT
  is '�ϴ��޸�ʱ��';
alter table PTPA.T_SYS_DEPARTMENT
  add constraint PK_T_SYS_DEPARTMENT primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_SYS_DIC
prompt ========================
prompt
create table PTPA.T_SYS_DIC
(
  ID            NUMBER(11) not null,
  CATEGORY      VARCHAR2(40),
  CATEGORY_NAME VARCHAR2(40),
  CODE          VARCHAR2(20),
  NAME          VARCHAR2(40),
  DISPLAY_ORDER NUMBER(6)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column PTPA.T_SYS_DIC.ID
  is '��������SEQ_T_SYS_DIC����';
comment on column PTPA.T_SYS_DIC.CATEGORY
  is '���ࣺ01����02������ò03�����̶�04ְ��05ְ��
06��������
';
comment on column PTPA.T_SYS_DIC.CATEGORY_NAME
  is '��������';
comment on column PTPA.T_SYS_DIC.CODE
  is '�ֵ����';
comment on column PTPA.T_SYS_DIC.NAME
  is '�ֵ�����';
comment on column PTPA.T_SYS_DIC.DISPLAY_ORDER
  is '����';
alter table PTPA.T_SYS_DIC
  add constraint PK_T_SYS_DIC primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_SYS_LOG
prompt ========================
prompt
create table PTPA.T_SYS_LOG
(
  ID           NUMBER not null,
  USER_ID      NUMBER,
  OPERA_DATE   DATE,
  OPERA_IP     VARCHAR2(20),
  MODULE_NAME  VARCHAR2(30),
  OPERA_NAME   VARCHAR2(20),
  OPERA_TYPE   NUMBER,
  OPERA_URL    VARCHAR2(100),
  OPERA_PARAMS VARCHAR2(1000)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 768K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PTPA.T_SYS_LOG
  add constraint PK_T_SYS_LOG primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index PTPA.IDX_T_SYS_LOG on PTPA.T_SYS_LOG (USER_ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_SYS_RELEASE
prompt ============================
prompt
create table PTPA.T_SYS_RELEASE
(
  ID              NUMBER(11) not null,
  NAME            VARCHAR2(50) not null,
  VERSION         VARCHAR2(10) not null,
  RELEASE_DATE    VARCHAR2(10) not null,
  RELEASE_CONTENT VARCHAR2(100) not null,
  RELEASE_BY      VARCHAR2(20) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column PTPA.T_SYS_RELEASE.ID
  is '������������SEQ_T_SYS_ RELEASE��ȡ';
comment on column PTPA.T_SYS_RELEASE.NAME
  is 'ϵͳ����';
comment on column PTPA.T_SYS_RELEASE.VERSION
  is '�汾��';
comment on column PTPA.T_SYS_RELEASE.RELEASE_DATE
  is '�������ڣ�Yyyy-mm-dd';
comment on column PTPA.T_SYS_RELEASE.RELEASE_CONTENT
  is '���������ļ���ַ';
comment on column PTPA.T_SYS_RELEASE.RELEASE_BY
  is '������';
alter table PTPA.T_SYS_RELEASE
  add constraint PK_T_SYS_RELEASE primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_SYS_RESOURCE
prompt =============================
prompt
create table PTPA.T_SYS_RESOURCE
(
  ID             NUMBER not null,
  NAME           VARCHAR2(40),
  CODE           VARCHAR2(40),
  PARENT_ID      NUMBER,
  URL            VARCHAR2(200),
  TARGET         VARCHAR2(20),
  ICONIMG        VARCHAR2(40),
  DISPLAY_ORDER  NUMBER,
  TYPE           NUMBER(2),
  DESCRIPTION    VARCHAR2(100),
  RESOURCE_LEVEL NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table PTPA.T_SYS_RESOURCE
  is 'ϵͳ��Դ��';
comment on column PTPA.T_SYS_RESOURCE.ID
  is '������������SEQ_T_SYS_RESOURCE��ȡ';
comment on column PTPA.T_SYS_RESOURCE.NAME
  is '��Դ����';
comment on column PTPA.T_SYS_RESOURCE.CODE
  is '��Դ����';
comment on column PTPA.T_SYS_RESOURCE.PARENT_ID
  is '�ϼ��ڵ�';
comment on column PTPA.T_SYS_RESOURCE.URL
  is '����';
comment on column PTPA.T_SYS_RESOURCE.TARGET
  is '����Ŀ��';
comment on column PTPA.T_SYS_RESOURCE.ICONIMG
  is 'ͼ��';
comment on column PTPA.T_SYS_RESOURCE.DISPLAY_ORDER
  is '����ֵ';
comment on column PTPA.T_SYS_RESOURCE.TYPE
  is '��Դ����,1ģ�飬2����';
comment on column PTPA.T_SYS_RESOURCE.DESCRIPTION
  is '����';
comment on column PTPA.T_SYS_RESOURCE.RESOURCE_LEVEL
  is '��Դ�ȼ�:1����ϵͳ����2������';
alter table PTPA.T_SYS_RESOURCE
  add constraint PK_T_SYS_MODULE primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index PTPA.IDX_T_SYS_RESOURCE1 on PTPA.T_SYS_RESOURCE (CODE)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_SYS_ROLE
prompt =========================
prompt
create table PTPA.T_SYS_ROLE
(
  ID               NUMBER not null,
  NAME             VARCHAR2(40),
  DESCRIPTION      VARCHAR2(100),
  DISPLAY_ORDER    NUMBER,
  CREATED_AT       DATE,
  CREATED_BY       VARCHAR2(20),
  LAST_MODIFIED_BY VARCHAR2(20),
  LAST_MODIFIED_AT DATE,
  IS_DELETE        NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column PTPA.T_SYS_ROLE.ID
  is '������������SEQ_T_SYS_ROLE��ȡ';
comment on column PTPA.T_SYS_ROLE.NAME
  is '��ɫ����';
comment on column PTPA.T_SYS_ROLE.DESCRIPTION
  is '����';
comment on column PTPA.T_SYS_ROLE.DISPLAY_ORDER
  is '����ֵ';
comment on column PTPA.T_SYS_ROLE.CREATED_AT
  is '������';
comment on column PTPA.T_SYS_ROLE.CREATED_BY
  is '����ʱ��';
comment on column PTPA.T_SYS_ROLE.LAST_MODIFIED_BY
  is '�ϴ��޸���';
comment on column PTPA.T_SYS_ROLE.LAST_MODIFIED_AT
  is '�ϴ��޸�ʱ��';
comment on column PTPA.T_SYS_ROLE.IS_DELETE
  is '��ǽ�ɫ�Ƿ���Ա�ɾ����0:�����Ա�ɾ����1�����Ա�ɾ����Ĭ��Ϊ1';
alter table PTPA.T_SYS_ROLE
  add constraint PK_T_SYS_ROLE primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_SYS_ROLERESOURCE
prompt =================================
prompt
create table PTPA.T_SYS_ROLERESOURCE
(
  ID          NUMBER not null,
  ROLE_ID     NUMBER,
  RESOURCE_ID NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table PTPA.T_SYS_ROLERESOURCE
  is '��ɫ��Դ��';
comment on column PTPA.T_SYS_ROLERESOURCE.ID
  is '������������SEQ_T_SYS_ROLRESOURCE��ȡ';
comment on column PTPA.T_SYS_ROLERESOURCE.ROLE_ID
  is '��ɫid';
comment on column PTPA.T_SYS_ROLERESOURCE.RESOURCE_ID
  is '��Դid';
alter table PTPA.T_SYS_ROLERESOURCE
  add constraint PK_T_SYS_ROLERESOURCE primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index PTPA.IDX_T_SYS_ROLERESOURCE1 on PTPA.T_SYS_ROLERESOURCE (ROLE_ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_SYS_USER
prompt =========================
prompt
create table PTPA.T_SYS_USER
(
  ID               NUMBER not null,
  USERNAME         VARCHAR2(30),
  PASSWORD         VARCHAR2(40),
  RANDOMCODE       VARCHAR2(6),
  STATUS           NUMBER(2),
  REALNAME         VARCHAR2(20),
  MOBILE           VARCHAR2(11),
  CREATED_AT       DATE,
  CREATED_BY       VARCHAR2(20),
  ROLE_ID          NUMBER,
  LAST_MODIFIED_BY VARCHAR2(20),
  LAST_MODIFIED_AT DATE,
  AVATAR           VARCHAR2(100),
  DEPARTMENT_ID    NUMBER,
  IS_ADMIN         NUMBER default 0,
  IS_CHECK         NUMBER,
  PINYIN           VARCHAR2(10),
  EMAIL            VARCHAR2(40),
  GENDER           VARCHAR2(4),
  NATION           VARCHAR2(20),
  POLITICAL        VARCHAR2(20),
  EDUCATION        VARCHAR2(20),
  GRADUATED_SCHOOL VARCHAR2(40),
  MAJOR            VARCHAR2(40),
  IDCARD           VARCHAR2(18),
  TELEPHONE        VARCHAR2(20),
  POST             VARCHAR2(20),
  JOB_TITLE        VARCHAR2(20),
  DISPLAY_ORDER    NUMBER,
  LAST_LOGIN_DATE  DATE,
  COMPLETION       NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table PTPA.T_SYS_USER
  is 'ϵͳ�û���';
comment on column PTPA.T_SYS_USER.ID
  is '������������SEQ_T_SYS_USER��ȡ';
comment on column PTPA.T_SYS_USER.USERNAME
  is '��¼�˺�';
comment on column PTPA.T_SYS_USER.PASSWORD
  is '����';
comment on column PTPA.T_SYS_USER.RANDOMCODE
  is '�����';
comment on column PTPA.T_SYS_USER.STATUS
  is '״̬��1������2����';
comment on column PTPA.T_SYS_USER.REALNAME
  is '��ʵ����';
comment on column PTPA.T_SYS_USER.MOBILE
  is '�ֻ���';
comment on column PTPA.T_SYS_USER.CREATED_AT
  is '����ʱ��';
comment on column PTPA.T_SYS_USER.CREATED_BY
  is '������';
comment on column PTPA.T_SYS_USER.ROLE_ID
  is '��ɫid';
comment on column PTPA.T_SYS_USER.LAST_MODIFIED_BY
  is '�ϴ��޸���';
comment on column PTPA.T_SYS_USER.LAST_MODIFIED_AT
  is '�ϴ��޸�ʱ��';
comment on column PTPA.T_SYS_USER.AVATAR
  is 'ͷ��';
comment on column PTPA.T_SYS_USER.DEPARTMENT_ID
  is '����T_SYS_DEPARTMENT��id';
comment on column PTPA.T_SYS_USER.IS_ADMIN
  is '�Ƿ����Ա��0��1�ǣ�Ĭ��0
����Ա��������Ȩ�ޡ�ֻ��ϵͳ��ʼ��ʱadmin�ǹ���Ա�������û��Ĳ��˸ı�ʶ
';
comment on column PTPA.T_SYS_USER.IS_CHECK
  is '�Ƿ���ˣ�1�ǣ�0���ڲ������û�Ĭ��Ϊ1
Ԥ���ֶ�
';
comment on column PTPA.T_SYS_USER.PINYIN
  is '���������Զ����ɼ�д';
comment on column PTPA.T_SYS_USER.EMAIL
  is '����';
comment on column PTPA.T_SYS_USER.GENDER
  is '�Ա�';
comment on column PTPA.T_SYS_USER.NATION
  is '������ֵ�ȡ';
comment on column PTPA.T_SYS_USER.POLITICAL
  is '������ò���ֵ�ȡ';
comment on column PTPA.T_SYS_USER.EDUCATION
  is '�����̶ȴ��ֵ�ȡ';
comment on column PTPA.T_SYS_USER.GRADUATED_SCHOOL
  is '��ҵԺУ';
comment on column PTPA.T_SYS_USER.MAJOR
  is 'רҵ';
comment on column PTPA.T_SYS_USER.IDCARD
  is '���֤��';
comment on column PTPA.T_SYS_USER.TELEPHONE
  is '����';
comment on column PTPA.T_SYS_USER.POST
  is 'ְ����ֵ�ȡ';
comment on column PTPA.T_SYS_USER.JOB_TITLE
  is 'ְ�ƴ��ֵ�ȡ';
comment on column PTPA.T_SYS_USER.DISPLAY_ORDER
  is '����';
comment on column PTPA.T_SYS_USER.LAST_LOGIN_DATE
  is '����¼ʱ�䣺��¼���޸ĸ��ֶ�';
comment on column PTPA.T_SYS_USER.COMPLETION
  is '�û���Ϣ�����ȣ�100Ϊ���������б�����Ϣռ51��������Ϣռ49��������Ϣ����һ��δ�������Ϣ������ȫΪ0�����û����������Ϊ49�������Ȳ���50���û���Ҫά��������Ϣ��';
alter table PTPA.T_SYS_USER
  add constraint PK_T_SYS_USER primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index PTPA.IDX_T_SYS_USER on PTPA.T_SYS_USER (USERNAME)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_SYS_USERLOGIN
prompt ==============================
prompt
create table PTPA.T_SYS_USERLOGIN
(
  ID              NUMBER not null,
  USER_ID         NUMBER,
  LOGIN_DATE      DATE,
  LOGIN_IP        VARCHAR2(20),
  TERMINAL        NUMBER(4),
  EXPLORERTYPE    VARCHAR2(40),
  EXPLORERVERSION VARCHAR2(40),
  SESSIONID       VARCHAR2(40)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 256K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table PTPA.T_SYS_USERLOGIN
  is '�û���¼��¼';
comment on column PTPA.T_SYS_USERLOGIN.ID
  is '������������SEQ_T_SYS_USERLOGIN��ȡ';
comment on column PTPA.T_SYS_USERLOGIN.USER_ID
  is '�û�id';
comment on column PTPA.T_SYS_USERLOGIN.LOGIN_DATE
  is '��¼ʱ��';
comment on column PTPA.T_SYS_USERLOGIN.LOGIN_IP
  is '��¼IP';
comment on column PTPA.T_SYS_USERLOGIN.TERMINAL
  is '��¼�նˣ�0:pc,1:wap,2:android,3:ios';
comment on column PTPA.T_SYS_USERLOGIN.EXPLORERTYPE
  is '���������';
comment on column PTPA.T_SYS_USERLOGIN.EXPLORERVERSION
  is '������汾';
comment on column PTPA.T_SYS_USERLOGIN.SESSIONID
  is 'session id';
alter table PTPA.T_SYS_USERLOGIN
  add constraint PK_T_SYS_USERLOGIN primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index PTPA.IDX_T_SYS_USERLOGIN on PTPA.T_SYS_USERLOGIN (USER_ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_TRAIN
prompt ======================
prompt
create table PTPA.T_TRAIN
(
  ID                          NUMBER(11) not null,
  NAME                        VARCHAR2(20),
  CC                          VARCHAR2(20),
  TRAIN_TYPE_CODE             VARCHAR2(20),
  TRAIN_TYPE_NAME             VARCHAR2(20),
  TRAIN_LEVEL_CODE            VARCHAR2(20),
  TRAIN_LEVEL_NAME            VARCHAR2(20),
  LJDM                        VARCHAR2(2),
  BEGIN_CZDM                  VARCHAR2(4),
  END_CZDM                    VARCHAR2(4),
  TRAIN_MARSHALLING_TYPE_CODE VARCHAR2(20),
  TRAIN_MARSHALLING_TYPE_NAME VARCHAR2(20),
  VEHICLE_GROUP_SIZE          NUMBER(2),
  VEHICLE_GROUP_RATE          NUMBER(5,2),
  LV_JL_ID                    NUMBER(11),
  CREATED_BY                  VARCHAR2(20),
  CREATED_AT                  DATE,
  LAST_MODIFIED_BY            VARCHAR2(20),
  LAST_MODIFIED_AT            DATE,
  LV_JL_MILEAGE               NUMBER(5),
  LV_JL_MILEAGE_CC            NUMBER(5),
  PART_PRICE                  NUMBER(13,2),
  LINE_COST                   NUMBER(13,2),
  TRACTION_COST               NUMBER(13,2),
  CE_COST                     NUMBER(13,2),
  DEPRECIATION_COST           NUMBER(13,2),
  MAINTAIN_ADVANCE_COST       NUMBER(13,2),
  MAINTAIN_NORMAL_COST        NUMBER(13,2),
  HUMAN_RESOURCE_COST         NUMBER(13,2),
  PART_COST                   NUMBER(13,2),
  SERVICE_COST                NUMBER(13,2),
  STATION_SERVICE_TYPE_CODE   VARCHAR2(20),
  STATION_SERVICE_TYPE_NAME   VARCHAR2(50),
  STATION_SERVICE_PRICE       NUMBER(2),
  BEGIN_CZDM_NAME             VARCHAR2(20),
  END_CZDM_NAME               VARCHAR2(20),
  DS                          NUMBER(13,2)
)
tablespace PTPA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column PTPA.T_TRAIN.ID
  is '����';
comment on column PTPA.T_TRAIN.NAME
  is '������������';
comment on column PTPA.T_TRAIN.CC
  is '����';
comment on column PTPA.T_TRAIN.TRAIN_TYPE_CODE
  is '�����г����ʹ��룬��Դϵͳ�ֵ䡰�����г����͡�';
comment on column PTPA.T_TRAIN.TRAIN_TYPE_NAME
  is '�����г��������ƣ���Դϵͳ�ֵ䡰�����г����͡�';
comment on column PTPA.T_TRAIN.TRAIN_LEVEL_CODE
  is '�����г��ȼ����룬��Դϵͳ�ֵ䡰�����г��ȼ���';
comment on column PTPA.T_TRAIN.TRAIN_LEVEL_NAME
  is '�����г��ȼ����ƣ���Դϵͳ�ֵ䡰�����г��ȼ���';
comment on column PTPA.T_TRAIN.LJDM
  is '�����ִ��룬��Դ��·��';
comment on column PTPA.T_TRAIN.BEGIN_CZDM
  is 'ʼ��վ���룬��Դ����Ӫҵվ';
comment on column PTPA.T_TRAIN.END_CZDM
  is '�յ�վ���룬��Դ����Ӫҵվ';
comment on column PTPA.T_TRAIN.TRAIN_MARSHALLING_TYPE_CODE
  is '�ͳ��������ʹ��룬��Դϵͳ�ֵ䡰�ͳ��������͡�';
comment on column PTPA.T_TRAIN.TRAIN_MARSHALLING_TYPE_NAME
  is '�ͳ������������ƣ���Դϵͳ�ֵ䡰�ͳ��������͡�';
comment on column PTPA.T_TRAIN.VEHICLE_GROUP_SIZE
  is '��������';
comment on column PTPA.T_TRAIN.VEHICLE_GROUP_RATE
  is '����ռ�ñ���';
comment on column PTPA.T_TRAIN.LV_JL_ID
  is '���������׽�·ID';
comment on column PTPA.T_TRAIN.CREATED_BY
  is '������';
comment on column PTPA.T_TRAIN.CREATED_AT
  is '����ʱ��';
comment on column PTPA.T_TRAIN.LAST_MODIFIED_BY
  is '�ϴ��޸���';
comment on column PTPA.T_TRAIN.LAST_MODIFIED_AT
  is '�ϴ��޸�ʱ��';
comment on column PTPA.T_TRAIN.LV_JL_MILEAGE
  is '���������׽�·��·����̣���Դ���������׽�·';
comment on column PTPA.T_TRAIN.LV_JL_MILEAGE_CC
  is '���������׽�·��·����̣���Դ���������׽�·';
comment on column PTPA.T_TRAIN.PART_PRICE
  is '��Ʒ���㵥�ۣ���λ��Ԫ/�й����ȷ��С�����2λ';
comment on column PTPA.T_TRAIN.LINE_COST
  is '��·�ɱ�����ȷ��С�������λ';
comment on column PTPA.T_TRAIN.TRACTION_COST
  is 'ǣ���ɱ�����ȷ��С�������λ';
comment on column PTPA.T_TRAIN.CE_COST
  is '�Ӵ����͵�ѳɱ�����ȷ��С�������λ';
comment on column PTPA.T_TRAIN.DEPRECIATION_COST
  is '�����۾ɷѣ���ȷ��С�������λ';
comment on column PTPA.T_TRAIN.MAINTAIN_ADVANCE_COST
  is '�������޷ѣ���ȷ��С�������λ';
comment on column PTPA.T_TRAIN.MAINTAIN_NORMAL_COST
  is '�����ճ��޷ѣ���ȷ��С�������λ';
comment on column PTPA.T_TRAIN.HUMAN_RESOURCE_COST
  is '�����ɱ�����ȷ��С�������λ';
comment on column PTPA.T_TRAIN.PART_COST
  is '��Ʒ�ɱ�����ȷ��С�������λ';
comment on column PTPA.T_TRAIN.SERVICE_COST
  is '����ɱ�����ȷ��С�������λ';
comment on column PTPA.T_TRAIN.STATION_SERVICE_TYPE_CODE
  is '��վ�ÿͷ��������룬��Դϵͳ�ֵ䡰��վ�ÿͷ������';
comment on column PTPA.T_TRAIN.STATION_SERVICE_TYPE_NAME
  is '��վ�ÿͷ���������ƣ���Դϵͳ�ֵ䡰��վ�ÿͷ������';
comment on column PTPA.T_TRAIN.STATION_SERVICE_PRICE
  is '��վ�ÿͷ������㵥�ۣ���λ��Ԫ/��';
comment on column PTPA.T_TRAIN.DS
  is '��������ȷ��С�������λ';
alter table PTPA.T_TRAIN
  add constraint PK_T_TRAIN primary key (ID)
  using index 
  tablespace PTPA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index PTPA.IDX_T_TRAIN on PTPA.T_TRAIN (CC)
  tablespace PTPA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_TRAIN_CE
prompt =========================
prompt
create table PTPA.T_TRAIN_CE
(
  ID                NUMBER(11) not null,
  TRAIN_ID          VARCHAR2(20),
  XLDM              VARCHAR2(20),
  XLDM_NAME         VARCHAR2(200),
  BEGIN_CZDM        VARCHAR2(20),
  BEGIN_CZDM_NAME   VARCHAR2(20),
  END_CZDM          VARCHAR2(20),
  END_CZDM_NAME     VARCHAR2(20),
  PSE_CODE          VARCHAR2(20),
  PSE_NAME          VARCHAR2(20),
  LJDM              VARCHAR2(2),
  MILEAGE           NUMBER(4),
  CATENARY_PRICE    NUMBER(13,2),
  ELECTRICITY_PRICE NUMBER(13,2),
  ORDER_INDEX       NUMBER(6)
)
tablespace PTPA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column PTPA.T_TRAIN_CE.ID
  is '����';
comment on column PTPA.T_TRAIN_CE.TRAIN_ID
  is '��������ID����Դ��������';
comment on column PTPA.T_TRAIN_CE.XLDM
  is '��·���룬��Դ��������·��';
comment on column PTPA.T_TRAIN_CE.XLDM_NAME
  is '��·���ƣ���Դ��������·��';
comment on column PTPA.T_TRAIN_CE.BEGIN_CZDM
  is '�������վ���룬��Դ������Ӫҵվ��';
comment on column PTPA.T_TRAIN_CE.BEGIN_CZDM_NAME
  is '�������վ���ƣ���Դ������Ӫҵվ��';
comment on column PTPA.T_TRAIN_CE.END_CZDM
  is '��������վ���룬��Դ������Ӫҵվ��';
comment on column PTPA.T_TRAIN_CE.END_CZDM_NAME
  is '��������վ���ƣ���Դ������Ӫҵվ��';
comment on column PTPA.T_TRAIN_CE.PSE_CODE
  is '��ר��ҵ���룬��Դϵͳ�ֵ䡰��ר��ҵ��';
comment on column PTPA.T_TRAIN_CE.PSE_NAME
  is '��ר��ҵ���ƣ���Դϵͳ�ֵ䡰��ר��ҵ��';
comment on column PTPA.T_TRAIN_CE.LJDM
  is '��·�ִ��룬��Դ"��·��"';
comment on column PTPA.T_TRAIN_CE.MILEAGE
  is '�Ӵ���������̣���λ��km����ȷ����λ';
comment on column PTPA.T_TRAIN_CE.CATENARY_PRICE
  is '�Ӵ������㵥�ۣ���λ��Ԫ/�ֹ����ȷ��С�����4λ';
comment on column PTPA.T_TRAIN_CE.ELECTRICITY_PRICE
  is '������㵥�ۣ���λ��Ԫ/�ֹ����ȷ��С�����4λ';
comment on column PTPA.T_TRAIN_CE.ORDER_INDEX
  is '����';
alter table PTPA.T_TRAIN_CE
  add constraint PK_T_TRAIN_CE primary key (ID)
  using index 
  tablespace PTPA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index PTPA.IDX_T_TRAIN_CE on PTPA.T_TRAIN_CE (TRAIN_ID)
  tablespace PTPA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_TRAIN_HUMANRESOURCE
prompt ====================================
prompt
create table PTPA.T_TRAIN_HUMANRESOURCE
(
  ID                       NUMBER(11) not null,
  TRAIN_ID                 NUMBER(11),
  HUMAN_RESOURCE_TYPE_CODE VARCHAR2(20),
  HUMAN_RESOURCE_TYPE_NAME VARCHAR2(20),
  LJDM                     VARCHAR2(2),
  PRICE                    NUMBER(13,2),
  RATE                     NUMBER(13,9)
)
tablespace PTPA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column PTPA.T_TRAIN_HUMANRESOURCE.ID
  is '����';
comment on column PTPA.T_TRAIN_HUMANRESOURCE.TRAIN_ID
  is '��������ID';
comment on column PTPA.T_TRAIN_HUMANRESOURCE.HUMAN_RESOURCE_TYPE_CODE
  is '�������ʹ��룬��Դϵͳ�ֵ䡰������Դ���͡�';
comment on column PTPA.T_TRAIN_HUMANRESOURCE.HUMAN_RESOURCE_TYPE_NAME
  is '�����������ƣ���Դϵͳ�ֵ䡰������Դ���͡�';
comment on column PTPA.T_TRAIN_HUMANRESOURCE.LJDM
  is '��·�ִ��룬��Դ"��·��"';
comment on column PTPA.T_TRAIN_HUMANRESOURCE.PRICE
  is 'ƽ������֧������λ��Ԫ/���꣬��ȷ��С�����2λ';
comment on column PTPA.T_TRAIN_HUMANRESOURCE.RATE
  is 'ÿ�г�ÿ������Ա����������λ����/�й����ȷ��С�����9λ';
alter table PTPA.T_TRAIN_HUMANRESOURCE
  add constraint PK_T_TRAIN_HUMANRESOURCE primary key (ID)
  using index 
  tablespace PTPA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index PTPA.IDX_T_TRAIN_HUMANRESOURCE on PTPA.T_TRAIN_HUMANRESOURCE (TRAIN_ID)
  tablespace PTPA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_TRAIN_LINE
prompt ===========================
prompt
create table PTPA.T_TRAIN_LINE
(
  ID                          NUMBER(11) not null,
  TRAIN_ID                    NUMBER(11),
  XLDM                        VARCHAR2(20),
  XLDM_NAME                   VARCHAR2(200),
  BEGIN_CZDM                  VARCHAR2(20),
  BEGIN_CZDM_NAME             VARCHAR2(20),
  END_CZDM                    VARCHAR2(20),
  END_CZDM_NAME               VARCHAR2(20),
  MILEAGE                     NUMBER(4),
  LINE_PRICE_LEVEL_CODE       VARCHAR2(20),
  LINE_PRICE_LEVEL_NAME       VARCHAR2(20),
  TRAIN_TYPE_CODE             VARCHAR2(20),
  TRAIN_TYPE_NAME             VARCHAR2(20),
  TRAIN_MARSHALLING_TYPE_CODE VARCHAR2(20),
  TRAIN_MARSHALLING_TYPE_NAME VARCHAR2(20),
  LINE_BUSY_LEVEL_CODE        VARCHAR2(20),
  LINE_BUSY_LEVEL_NAME        VARCHAR2(20),
  BEFORE_DAWN                 NUMBER(4),
  BEFORE_DAWN_RATE            NUMBER(5,2),
  PRICE                       NUMBER(13,2),
  ORDER_INDEX                 NUMBER(6)
)
tablespace PTPA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column PTPA.T_TRAIN_LINE.ID
  is '����';
comment on column PTPA.T_TRAIN_LINE.TRAIN_ID
  is '��������ID����Դ��������';
comment on column PTPA.T_TRAIN_LINE.XLDM
  is '��·���룬��Դ��������·��';
comment on column PTPA.T_TRAIN_LINE.XLDM_NAME
  is '��·���ƣ���Դ��������·��';
comment on column PTPA.T_TRAIN_LINE.BEGIN_CZDM
  is '�������վ���룬��Դ������Ӫҵվ��';
comment on column PTPA.T_TRAIN_LINE.BEGIN_CZDM_NAME
  is '�������վ���ƣ���Դ������Ӫҵվ��';
comment on column PTPA.T_TRAIN_LINE.END_CZDM
  is '��������վ���룬��Դ������Ӫҵվ��';
comment on column PTPA.T_TRAIN_LINE.END_CZDM_NAME
  is '��������վ���ƣ���Դ������Ӫҵվ��';
comment on column PTPA.T_TRAIN_LINE.MILEAGE
  is '������·��̣���λ��km����ȷ����λ';
comment on column PTPA.T_TRAIN_LINE.LINE_PRICE_LEVEL_CODE
  is '��·����ȼ�CODE����Դϵͳ�ֵ䡱��·����ȼ���';
comment on column PTPA.T_TRAIN_LINE.LINE_PRICE_LEVEL_NAME
  is '��·����ȼ�NAME����Դϵͳ�ֵ䡱��·����ȼ���';
comment on column PTPA.T_TRAIN_LINE.TRAIN_TYPE_CODE
  is '�г����ͱ��룬��Դϵͳ�ֵ䡰�г����͡�';
comment on column PTPA.T_TRAIN_LINE.TRAIN_TYPE_NAME
  is '�г��������ƣ���Դϵͳ�ֵ䡰�г����͡�';
comment on column PTPA.T_TRAIN_LINE.TRAIN_MARSHALLING_TYPE_CODE
  is '�г��������ͱ��룬��Դϵͳ�ֵ䡰�г��������͡�';
comment on column PTPA.T_TRAIN_LINE.TRAIN_MARSHALLING_TYPE_NAME
  is '�г������������ƣ���Դϵͳ�ֵ䡰�г��������͡�';
comment on column PTPA.T_TRAIN_LINE.LINE_BUSY_LEVEL_CODE
  is '��·��æ�̶ȱ��룬��Դϵͳ�ֵ䡰��·��æ�̶ȡ�';
comment on column PTPA.T_TRAIN_LINE.LINE_BUSY_LEVEL_NAME
  is '��·��æ�̶����ƣ���Դϵͳ�ֵ䡰��·��æ�̶ȡ�';
comment on column PTPA.T_TRAIN_LINE.BEFORE_DAWN
  is '�Ƿ���22ʱ������6ʱ����0����1����';
comment on column PTPA.T_TRAIN_LINE.BEFORE_DAWN_RATE
  is '��22ʱ������6ʱ���������������ȷ��С�������λ';
comment on column PTPA.T_TRAIN_LINE.PRICE
  is '���㵥�ۣ���λ��Ԫ/�����ȷ����';
comment on column PTPA.T_TRAIN_LINE.ORDER_INDEX
  is '����';
alter table PTPA.T_TRAIN_LINE
  add constraint PK_T_TRAIN_LINE primary key (ID)
  using index 
  tablespace PTPA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index PTPA.IDX_T_TRAIN_LINE on PTPA.T_TRAIN_LINE (TRAIN_ID)
  tablespace PTPA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_TRAIN_SERVICE
prompt ==============================
prompt
create table PTPA.T_TRAIN_SERVICE
(
  ID           NUMBER(11) not null,
  TRAIN_ID     NUMBER(11),
  SERVICE_CODE VARCHAR2(20),
  SERVICE_NAME VARCHAR2(20),
  LJDM         VARCHAR2(2),
  UNIT         VARCHAR2(20),
  PRICE        NUMBER(13,2),
  ORDER_INDEX  NUMBER(6),
  COUNT        NUMBER(5,1)
)
tablespace PTPA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column PTPA.T_TRAIN_SERVICE.ID
  is '����';
comment on column PTPA.T_TRAIN_SERVICE.TRAIN_ID
  is '��������ID';
comment on column PTPA.T_TRAIN_SERVICE.SERVICE_CODE
  is '������룬��Դϵͳ�ֵ䡰����';
comment on column PTPA.T_TRAIN_SERVICE.SERVICE_NAME
  is '�������ƣ���Դϵͳ�ֵ䡰����';
comment on column PTPA.T_TRAIN_SERVICE.LJDM
  is '��·�ִ��룬��Դ"��·��"';
comment on column PTPA.T_TRAIN_SERVICE.UNIT
  is '���������λ';
comment on column PTPA.T_TRAIN_SERVICE.PRICE
  is '���㵥�ۣ���λ��Ԫ/������λ����ȷ��С�����2λ';
comment on column PTPA.T_TRAIN_SERVICE.ORDER_INDEX
  is '����';
comment on column PTPA.T_TRAIN_SERVICE.COUNT
  is '�����������ȷ��С�����1λ';
alter table PTPA.T_TRAIN_SERVICE
  add constraint PK_T_TRAIN_SERVICE primary key (ID)
  using index 
  tablespace PTPA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index PTPA.IDX_T_TRAIN_SERVICE on PTPA.T_TRAIN_SERVICE (TRAIN_ID)
  tablespace PTPA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_TRAIN_TICKETPRICE
prompt ==================================
prompt
create table PTPA.T_TRAIN_TICKETPRICE
(
  ID             NUMBER(11) not null,
  TRAIN_ID       NUMBER(11),
  SEAT_TYPE_CODE VARCHAR2(20),
  SEAT_TYPE_NAME VARCHAR2(20),
  PRICE          NUMBER(6,2),
  ORDER_INDEX    NUMBER(6)
)
tablespace PTPA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column PTPA.T_TRAIN_TICKETPRICE.ID
  is '����';
comment on column PTPA.T_TRAIN_TICKETPRICE.TRAIN_ID
  is '��������ID';
comment on column PTPA.T_TRAIN_TICKETPRICE.SEAT_TYPE_CODE
  is 'ϯ����룺��Դ��ϵͳ�ֵ�"ϯ��"';
comment on column PTPA.T_TRAIN_TICKETPRICE.SEAT_TYPE_NAME
  is 'ϯ�����ƣ���Դ��ϵͳ�ֵ�"ϯ��"';
comment on column PTPA.T_TRAIN_TICKETPRICE.PRICE
  is 'ȫ�����㵥�ۣ���λ��Ԫ/�ţ���ȷ��С�����2λ';
comment on column PTPA.T_TRAIN_TICKETPRICE.ORDER_INDEX
  is '����';
alter table PTPA.T_TRAIN_TICKETPRICE
  add constraint PK_T_TRAIN_TICKETPRICE primary key (ID)
  using index 
  tablespace PTPA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index PTPA.IDX_T_TRAIN_TICKETPRICE on PTPA.T_TRAIN_TICKETPRICE (TRAIN_ID)
  tablespace PTPA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_TRAIN_TRACTION
prompt ===============================
prompt
create table PTPA.T_TRAIN_TRACTION
(
  ID                 NUMBER(11) not null,
  TRAIN_ID           VARCHAR2(20),
  XLDM               VARCHAR2(20),
  XLDM_NAME          VARCHAR2(200),
  BEGIN_CZDM         VARCHAR2(20),
  BEGIN_CZDM_NAME    VARCHAR2(20),
  END_CZDM           VARCHAR2(20),
  END_CZDM_NAME      VARCHAR2(20),
  TRACTION_TYPE_CODE VARCHAR2(20),
  TRACTION_TYPE_NAME VARCHAR2(20),
  MILEAGE            NUMBER(4),
  LOCOMOTIVE_PRICE   NUMBER(13,2),
  CE_PRICE           NUMBER(13,2),
  ORDER_INDEX        NUMBER(6),
  LJDM               VARCHAR2(2)
)
tablespace PTPA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column PTPA.T_TRAIN_TRACTION.ID
  is '����';
comment on column PTPA.T_TRAIN_TRACTION.TRAIN_ID
  is '��������ID����Դ��������';
comment on column PTPA.T_TRAIN_TRACTION.XLDM
  is '��·���룬��Դ��������·��';
comment on column PTPA.T_TRAIN_TRACTION.XLDM_NAME
  is '��·���ƣ���Դ��������·��';
comment on column PTPA.T_TRAIN_TRACTION.BEGIN_CZDM
  is '�������վ���룬��Դ������Ӫҵվ��';
comment on column PTPA.T_TRAIN_TRACTION.BEGIN_CZDM_NAME
  is '�������վ���ƣ���Դ������Ӫҵվ��';
comment on column PTPA.T_TRAIN_TRACTION.END_CZDM
  is '��������վ���룬��Դ������Ӫҵվ��';
comment on column PTPA.T_TRAIN_TRACTION.END_CZDM_NAME
  is '��������վ���ƣ���Դ������Ӫҵվ��';
comment on column PTPA.T_TRAIN_TRACTION.TRACTION_TYPE_CODE
  is 'ǣ�����ʹ��룬��Դϵͳ�ֵ䡰ǣ�����͡�';
comment on column PTPA.T_TRAIN_TRACTION.TRACTION_TYPE_NAME
  is 'ǣ���������ƣ���Դϵͳ�ֵ䡰ǣ�����͡�';
comment on column PTPA.T_TRAIN_TRACTION.MILEAGE
  is 'ǣ��������̣���λ��km����ȷ����λ';
comment on column PTPA.T_TRAIN_TRACTION.LOCOMOTIVE_PRICE
  is '�������㵥�ۣ���ȷ��С�����2λ';
comment on column PTPA.T_TRAIN_TRACTION.CE_PRICE
  is '��������ʹ�ýӴ����͵�����㵥�ۣ���ȷ��С�����2λ';
comment on column PTPA.T_TRAIN_TRACTION.ORDER_INDEX
  is '����';
comment on column PTPA.T_TRAIN_TRACTION.LJDM
  is '��·�ִ��룬��Դ����·�֡�';
alter table PTPA.T_TRAIN_TRACTION
  add constraint PK_T_TRAIN_TRACTION primary key (ID)
  using index 
  tablespace PTPA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index PTPA.IDX_T_TRAIN_TRACTION on PTPA.T_TRAIN_TRACTION (TRAIN_ID)
  tablespace PTPA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_TRAIN_VEHICLE
prompt ==============================
prompt
create table PTPA.T_TRAIN_VEHICLE
(
  ID                         NUMBER(11) not null,
  TRAIN_ID                   VARCHAR2(20),
  CX_CODE                    VARCHAR2(20),
  CX_NAME                    VARCHAR2(20),
  CZ_CODE                    VARCHAR2(20),
  CZ_NAME                    VARCHAR2(20),
  LX_CODE                    VARCHAR2(20),
  LX_NAME                    VARCHAR2(20),
  PURCHASE_PRICE             NUMBER(13,2),
  AVERAGE_KILOMETER          NUMBER(7),
  DEPRECIATION_PERIOD        NUMBER(2),
  DEPERCIATION_RESIDUAL_RATE NUMBER(5,2),
  DEPERCIATION_RATE          NUMBER(5,4),
  DEPERCIATION_PK_RATE       NUMBER(13,10),
  DEPERCIATION_PRICE         NUMBER(13,2),
  ORDER_INDEX                NUMBER(6),
  MAINTAIN_ADVANCE_PRICE     NUMBER(13,2),
  MAINTAIN_NORMAL_PRICE      NUMBER(13,2)
)
tablespace PTPA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column PTPA.T_TRAIN_VEHICLE.ID
  is '����';
comment on column PTPA.T_TRAIN_VEHICLE.TRAIN_ID
  is '��������ID����Դ��������';
comment on column PTPA.T_TRAIN_VEHICLE.CX_CODE
  is '���ͱ��룺��Դ��ϵͳ�ֵ�"����"';
comment on column PTPA.T_TRAIN_VEHICLE.CX_NAME
  is '�������ƣ���Դ��ϵͳ�ֵ�"����"';
comment on column PTPA.T_TRAIN_VEHICLE.CZ_CODE
  is '���ֱ��룺��Դ��ϵͳ�ֵ�"����"';
comment on column PTPA.T_TRAIN_VEHICLE.CZ_NAME
  is '�������ƣ���Դ��ϵͳ�ֵ�"����"';
comment on column PTPA.T_TRAIN_VEHICLE.LX_CODE
  is '���ͱ��룬��Դϵͳ�ֵ䡱���͡�';
comment on column PTPA.T_TRAIN_VEHICLE.LX_NAME
  is '�������ƣ���Դϵͳ�ֵ䡱���͡�';
comment on column PTPA.T_TRAIN_VEHICLE.PURCHASE_PRICE
  is '���óɱ�����ԪΪ��λ����ȷ����';
comment on column PTPA.T_TRAIN_VEHICLE.AVERAGE_KILOMETER
  is 'ƽ�������й����λ������/�꣬��ȷ����λ';
comment on column PTPA.T_TRAIN_VEHICLE.DEPRECIATION_PERIOD
  is '�۾����ޣ���λ���꣬��ȷ����λ';
comment on column PTPA.T_TRAIN_VEHICLE.DEPERCIATION_RESIDUAL_RATE
  is '�۾ɲ�ֵ�ʣ���ȷ��С�������λ';
comment on column PTPA.T_TRAIN_VEHICLE.DEPERCIATION_RATE
  is '���۾��ʣ�ֻ������ȷ��С�����4λ';
comment on column PTPA.T_TRAIN_VEHICLE.DEPERCIATION_PK_RATE
  is 'ÿ�����۾��ʣ�ֻ������ȷ��С�����10λ';
comment on column PTPA.T_TRAIN_VEHICLE.DEPERCIATION_PRICE
  is '�۾����㵥�ۣ���λ��Ԫ/�������ȷ��С�����2λ';
comment on column PTPA.T_TRAIN_VEHICLE.ORDER_INDEX
  is '����';
comment on column PTPA.T_TRAIN_VEHICLE.MAINTAIN_ADVANCE_PRICE
  is '�������㵥�ۣ������޳����㵥��֮�ͣ���λ��Ԫ/�������ȷ��С�������λ';
comment on column PTPA.T_TRAIN_VEHICLE.MAINTAIN_NORMAL_PRICE
  is '�ճ������㵥�ۣ������޳����㵥��֮�ͣ���λ��Ԫ/�������ȷ��С�������λ';
alter table PTPA.T_TRAIN_VEHICLE
  add constraint PK_T_TRAIN_VEHICLE primary key (ID)
  using index 
  tablespace PTPA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index PTPA.IDX_T_TRAIN_VEHICLE on PTPA.T_TRAIN_VEHICLE (TRAIN_ID)
  tablespace PTPA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_TRAIN_VEHICLESEAT
prompt ==================================
prompt
create table PTPA.T_TRAIN_VEHICLESEAT
(
  ID               NUMBER(11) not null,
  TRAIN_VEHICLE_ID NUMBER(11),
  SEAT_TYPE_CODE   VARCHAR2(20),
  SEAT_TYPE_NAME   VARCHAR2(20),
  CAPACITY         NUMBER(4),
  ORDER_INDEX      NUMBER(6)
)
tablespace PTPA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column PTPA.T_TRAIN_VEHICLESEAT.ID
  is '����';
comment on column PTPA.T_TRAIN_VEHICLESEAT.TRAIN_VEHICLE_ID
  is '���α��鳵��ID����Դ���α��鳵��';
comment on column PTPA.T_TRAIN_VEHICLESEAT.SEAT_TYPE_CODE
  is 'ϯ����룺��Դ��ϵͳ�ֵ�"ϯ��"';
comment on column PTPA.T_TRAIN_VEHICLESEAT.SEAT_TYPE_NAME
  is 'ϯ�����ƣ���Դ��ϵͳ�ֵ�"ϯ��"';
comment on column PTPA.T_TRAIN_VEHICLESEAT.CAPACITY
  is '��Ա';
comment on column PTPA.T_TRAIN_VEHICLESEAT.ORDER_INDEX
  is '����';
alter table PTPA.T_TRAIN_VEHICLESEAT
  add constraint PK_T_TRAIN_VEHICLESEAT primary key (ID)
  using index 
  tablespace PTPA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index PTPA.IDX_T_TRAIN_VEHICLESEAT on PTPA.T_TRAIN_VEHICLESEAT (TRAIN_VEHICLE_ID)
  tablespace PTPA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_VEHICLE
prompt ========================
prompt
create table PTPA.T_VEHICLE
(
  ID                         NUMBER(11) not null,
  CX_CODE                    VARCHAR2(20),
  CX_NAME                    VARCHAR2(20),
  CZ_CODE                    VARCHAR2(20),
  CZ_NAME                    VARCHAR2(20),
  LX_CODE                    VARCHAR2(20),
  LX_NAME                    VARCHAR2(20),
  PURCHASE_PRICE             NUMBER(13,2),
  AVERAGE_KILOMETER          NUMBER(7),
  DEPRECIATION_PERIOD        NUMBER(2),
  DEPERCIATION_RESIDUAL_RATE NUMBER(5,2),
  DEPERCIATION_RATE          NUMBER(5,4),
  DEPERCIATION_PK_RATE       NUMBER(13,10),
  DEPERCIATION_PRICE         NUMBER(13,2),
  MAINTAIN_ADVANCE_PRICE     NUMBER(13,2),
  MAINTAIN_NORMAL_PRICE      NUMBER(13,2)
)
tablespace PTPA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column PTPA.T_VEHICLE.ID
  is '����';
comment on column PTPA.T_VEHICLE.CX_CODE
  is '���ͱ��룺��Դ��ϵͳ�ֵ�"����"';
comment on column PTPA.T_VEHICLE.CX_NAME
  is '�������ƣ���Դ��ϵͳ�ֵ�"����"';
comment on column PTPA.T_VEHICLE.CZ_CODE
  is '���ֱ��룺��Դ��ϵͳ�ֵ�"����"';
comment on column PTPA.T_VEHICLE.CZ_NAME
  is '�������ƣ���Դ��ϵͳ�ֵ�"����"';
comment on column PTPA.T_VEHICLE.LX_CODE
  is '���ͱ��룬��Դϵͳ�ֵ䡱���͡�';
comment on column PTPA.T_VEHICLE.LX_NAME
  is '�������ƣ���Դϵͳ�ֵ䡱���͡�';
comment on column PTPA.T_VEHICLE.PURCHASE_PRICE
  is '���óɱ�����ԪΪ��λ����ȷ����';
comment on column PTPA.T_VEHICLE.AVERAGE_KILOMETER
  is 'ƽ�������й����λ������/�꣬��ȷ����λ';
comment on column PTPA.T_VEHICLE.DEPRECIATION_PERIOD
  is '�۾����ޣ���λ���꣬��ȷ����λ';
comment on column PTPA.T_VEHICLE.DEPERCIATION_RESIDUAL_RATE
  is '�۾ɲ�ֵ�ʣ���ȷ��С�������λ';
comment on column PTPA.T_VEHICLE.DEPERCIATION_RATE
  is '���۾��ʣ�ֻ������ȷ��С�����4λ';
comment on column PTPA.T_VEHICLE.DEPERCIATION_PK_RATE
  is 'ÿ�����۾��ʣ�ֻ������ȷ��С�����10λ';
comment on column PTPA.T_VEHICLE.DEPERCIATION_PRICE
  is '�۾����㵥�ۣ���λ��Ԫ/�������ȷ��С�����2λ';
comment on column PTPA.T_VEHICLE.MAINTAIN_ADVANCE_PRICE
  is '�������㵥�ۣ������޳����㵥��֮�ͣ���λ��Ԫ/�������ȷ��С�������λ';
comment on column PTPA.T_VEHICLE.MAINTAIN_NORMAL_PRICE
  is '�ճ������㵥�ۣ������޳����㵥��֮�ͣ���λ��Ԫ/�������ȷ��С�������λ';
alter table PTPA.T_VEHICLE
  add constraint PK_T_VEHICLE primary key (ID)
  using index 
  tablespace PTPA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_VEHICLE_SEAT
prompt =============================
prompt
create table PTPA.T_VEHICLE_SEAT
(
  ID             NUMBER(11) not null,
  VEHICLE_ID     NUMBER(11),
  SEAT_TYPE_CODE VARCHAR2(20),
  SEAT_TYPE_NAME VARCHAR2(20),
  CAPACITY       NUMBER(4),
  ORDER_INDEX    NUMBER(6)
)
tablespace PTPA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column PTPA.T_VEHICLE_SEAT.ID
  is '����';
comment on column PTPA.T_VEHICLE_SEAT.VEHICLE_ID
  is '��������ID����Դ��������';
comment on column PTPA.T_VEHICLE_SEAT.SEAT_TYPE_CODE
  is 'ϯ����룺��Դ��ϵͳ�ֵ�"ϯ��"';
comment on column PTPA.T_VEHICLE_SEAT.SEAT_TYPE_NAME
  is 'ϯ�����ƣ���Դ��ϵͳ�ֵ�"ϯ��"';
comment on column PTPA.T_VEHICLE_SEAT.CAPACITY
  is '��Ա';
comment on column PTPA.T_VEHICLE_SEAT.ORDER_INDEX
  is '����';
alter table PTPA.T_VEHICLE_SEAT
  add constraint PK_T_VEHICLE_SEAT primary key (ID)
  using index 
  tablespace PTPA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index PTPA.IDX_T_VEHICLE_SEAT on PTPA.T_VEHICLE_SEAT (VEHICLE_ID)
  tablespace PTPA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating sequence SEQ_T_BOOK
prompt ============================
prompt
create sequence PTPA.SEQ_T_BOOK
minvalue 1
maxvalue 9999999999999999999999999999
start with 541
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_DIC_RAILWAY
prompt ===================================
prompt
create sequence PTPA.SEQ_T_DIC_RAILWAY
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_DR_TRAINPS
prompt ==================================
prompt
create sequence PTPA.SEQ_T_DR_TRAINPS
minvalue 1
maxvalue 9999999999999999999999999999
start with 3542
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_DR_TRAINSTATISTIC
prompt =========================================
prompt
create sequence PTPA.SEQ_T_DR_TRAINSTATISTIC
minvalue 1
maxvalue 9999999999999999999999999999
start with 65536
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_LV_CDJL
prompt ===============================
prompt
create sequence PTPA.SEQ_T_LV_CDJL
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_LV_CDJLCC
prompt =================================
prompt
create sequence PTPA.SEQ_T_LV_CDJLCC
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_LV_CDJLCL
prompt =================================
prompt
create sequence PTPA.SEQ_T_LV_CDJLCL
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_PRICE_CE
prompt ================================
prompt
create sequence PTPA.SEQ_T_PRICE_CE
minvalue 1
maxvalue 9999999999999999999999999999
start with 122
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_PRICE_HUMANRESOURCE
prompt ===========================================
prompt
create sequence PTPA.SEQ_T_PRICE_HUMANRESOURCE
minvalue 1
maxvalue 9999999999999999999999999999
start with 681
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_PRICE_LINE
prompt ==================================
prompt
create sequence PTPA.SEQ_T_PRICE_LINE
minvalue 1
maxvalue 9999999999999999999999999999
start with 95
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_PRICE_PART
prompt ==================================
prompt
create sequence PTPA.SEQ_T_PRICE_PART
minvalue 1
maxvalue 9999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_PRICE_SERVICE
prompt =====================================
prompt
create sequence PTPA.SEQ_T_PRICE_SERVICE
minvalue 1
maxvalue 9999999999999999999999999999
start with 341
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_PRICE_STATIONSERVICE
prompt ============================================
prompt
create sequence PTPA.SEQ_T_PRICE_STATIONSERVICE
minvalue 1
maxvalue 9999999999999999999999999999
start with 27
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_PRICE_TRACTION
prompt ======================================
prompt
create sequence PTPA.SEQ_T_PRICE_TRACTION
minvalue 1
maxvalue 9999999999999999999999999999
start with 30
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_SYS_ RELEASE
prompt ====================================
prompt
create sequence PTPA.SEQ_T_SYS_ RELEASE
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_SYS_DEPARTMENT
prompt ======================================
prompt
create sequence PTPA.SEQ_T_SYS_DEPARTMENT
minvalue 1
maxvalue 9999999999999999999999999999
start with 141
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_SYS_DIC
prompt ===============================
prompt
create sequence PTPA.SEQ_T_SYS_DIC
minvalue 1
maxvalue 9999999999999999999999999999
start with 472
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_SYS_ILLUSTRATE
prompt ======================================
prompt
create sequence PTPA.SEQ_T_SYS_ILLUSTRATE
minvalue 1
maxvalue 9999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_SYS_LOG
prompt ===============================
prompt
create sequence PTPA.SEQ_T_SYS_LOG
minvalue 1
maxvalue 9999999999999999999999999999
start with 3901
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_SYS_ORGANIZATION
prompt ========================================
prompt
create sequence PTPA.SEQ_T_SYS_ORGANIZATION
minvalue 1
maxvalue 9999999999999999999999999999
start with 61
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_SYS_RELEASE
prompt ===================================
prompt
create sequence PTPA.SEQ_T_SYS_RELEASE
minvalue 1
maxvalue 9999999999999999999999999999
start with 34
increment by 1
nocache;

prompt
prompt Creating sequence SEQ_T_SYS_RESOURCE
prompt ====================================
prompt
create sequence PTPA.SEQ_T_SYS_RESOURCE
minvalue 1
maxvalue 9999999999999999999999999999
start with 7541
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_SYS_ROLE
prompt ================================
prompt
create sequence PTPA.SEQ_T_SYS_ROLE
minvalue 1
maxvalue 9999999999999999999999999999
start with 181
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_SYS_ROLERESOURCE
prompt ========================================
prompt
create sequence PTPA.SEQ_T_SYS_ROLERESOURCE
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_SYS_UI
prompt ==============================
prompt
create sequence PTPA.SEQ_T_SYS_UI
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_SYS_USER
prompt ================================
prompt
create sequence PTPA.SEQ_T_SYS_USER
minvalue 1
maxvalue 9999999999999999999999999999
start with 201
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_SYS_USERLOGIN
prompt =====================================
prompt
create sequence PTPA.SEQ_T_SYS_USERLOGIN
minvalue 1
maxvalue 9999999999999999999999999999
start with 4981
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_TRAIN
prompt =============================
prompt
create sequence PTPA.SEQ_T_TRAIN
minvalue 1
maxvalue 9999999999999999999999999999
start with 2361
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_TRAIN_CE
prompt ================================
prompt
create sequence PTPA.SEQ_T_TRAIN_CE
minvalue 1
maxvalue 9999999999999999999999999999
start with 4081
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_TRAIN_HUMANRESOURCE
prompt ===========================================
prompt
create sequence PTPA.SEQ_T_TRAIN_HUMANRESOURCE
minvalue 1
maxvalue 9999999999999999999999999999
start with 121
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_TRAIN_LINE
prompt ==================================
prompt
create sequence PTPA.SEQ_T_TRAIN_LINE
minvalue 1
maxvalue 9999999999999999999999999999
start with 4081
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_TRAIN_SERVICE
prompt =====================================
prompt
create sequence PTPA.SEQ_T_TRAIN_SERVICE
minvalue 1
maxvalue 9999999999999999999999999999
start with 121
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_TRAIN_TICKETPRICE
prompt =========================================
prompt
create sequence PTPA.SEQ_T_TRAIN_TICKETPRICE
minvalue 1
maxvalue 9999999999999999999999999999
start with 260
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_TRAIN_TRACTION
prompt ======================================
prompt
create sequence PTPA.SEQ_T_TRAIN_TRACTION
minvalue 1
maxvalue 9999999999999999999999999999
start with 4170
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_TRAIN_VEHICLE
prompt =====================================
prompt
create sequence PTPA.SEQ_T_TRAIN_VEHICLE
minvalue 1
maxvalue 9999999999999999999999999999
start with 9261
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_TRAIN_VEHICLESEAT
prompt =========================================
prompt
create sequence PTPA.SEQ_T_TRAIN_VEHICLESEAT
minvalue 1
maxvalue 9999999999999999999999999999
start with 521
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_VEHICLE
prompt ===============================
prompt
create sequence PTPA.SEQ_T_VEHICLE
minvalue 1
maxvalue 9999999999999999999999999999
start with 140
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_VEHICLE_SEAT
prompt ====================================
prompt
create sequence PTPA.SEQ_T_VEHICLE_SEAT
minvalue 1
maxvalue 9999999999999999999999999999
start with 201
increment by 1
cache 20;


spool off
