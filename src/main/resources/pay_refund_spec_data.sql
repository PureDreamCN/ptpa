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
  is '主键';
comment on column PTPA.T_BOOK.TRAIN_ID
  is '车次详情ID，来源车次详情';
comment on column PTPA.T_BOOK.START_DATE
  is '开行日期';
comment on column PTPA.T_BOOK.PT_TICKE_INCOMING
  is '客运部票价收入，精确到小数点后两位';
comment on column PTPA.T_BOOK.PT_PERSON_COUNT
  is '客运部发送人数';
comment on column PTPA.T_BOOK.DR_TICKE_INCOMING
  is '发改部票价收入，精确到小数点后两位';
comment on column PTPA.T_BOOK.DR_PERSON_COUNT
  is '发改部发送人数';
comment on column PTPA.T_BOOK.PT_TICKET_SERVICE_COST
  is '客运部售票服务成本，精确到小数点后两位';
comment on column PTPA.T_BOOK.PT_STATION_SERVICE_COST
  is '客运部车站服务成本，精确到小数点后两位';
comment on column PTPA.T_BOOK.DR_TICKET_SERVICE_COST
  is '发改部售票服务成本，精确到小数点后两位';
comment on column PTPA.T_BOOK.DR_STATION_SERVICE_COST
  is '发改部车站服务成本，精确到小数点后两位';
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
  is '路局代码，即电报码';
comment on column PTPA.T_DIC_BUREAU.NAME
  is '全称';
comment on column PTPA.T_DIC_BUREAU.SHORT_NAME
  is '简称';
comment on column PTPA.T_DIC_BUREAU.CODE
  is '编码';
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
  is '线路代码';
comment on column PTPA.T_DIC_RAILWAY.NAME
  is '线路名称';
comment on column PTPA.T_DIC_RAILWAY.BEGIN_CZDM
  is '起点站车站代码，来源”客运营业站“';
comment on column PTPA.T_DIC_RAILWAY.END_CZDM
  is '讫点站车站代码，来源”客运营业站“';
comment on column PTPA.T_DIC_RAILWAY.MILEAGE
  is '里程，单位km，精确到个位';
comment on column PTPA.T_DIC_RAILWAY.LINE_PRICE_LEVEL_CODE
  is '线路清算等级CODE，来源系统字典”线路清算等级“';
comment on column PTPA.T_DIC_RAILWAY.LINE_PRICE_LEVEL_NAME
  is '线路清算等级NAME，来源系统字典”线路清算等级“';
comment on column PTPA.T_DIC_RAILWAY.PROPERTY_RIGHT
  is '产权';
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
  is '车站代码，即电报码';
comment on column PTPA.T_DIC_STATION.NAME
  is '站名';
comment on column PTPA.T_DIC_STATION.LJDM
  is '所属铁路局代码';
comment on column PTPA.T_DIC_STATION.PINYIN
  is '拼音';
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
  is '主键';
comment on column PTPA.T_DR_TRAINPS.JL_CODE
  is '交路号';
comment on column PTPA.T_DR_TRAINPS.STATISTIC_DATE
  is '日期';
comment on column PTPA.T_DR_TRAINPS.CC
  is '车次';
comment on column PTPA.T_DR_TRAINPS.PASSENGER_VOLUME
  is '旅客发送量（人）';
comment on column PTPA.T_DR_TRAINPS.PASSENGER_MILEAGE
  is '全程周转量（人公里）';
comment on column PTPA.T_DR_TRAINPS.FARE_SUM
  is '票价合计（元）';
comment on column PTPA.T_DR_TRAINPS.LJDM
  is '路局';
comment on column PTPA.T_DR_TRAINPS.CREATED_BY
  is '创建人';
comment on column PTPA.T_DR_TRAINPS.CREATED_AT
  is '创建时间';
comment on column PTPA.T_DR_TRAINPS.LAST_MODIFIED_BY
  is '上次修改人';
comment on column PTPA.T_DR_TRAINPS.LAST_MODIFIED_AT
  is '上次修改时间';
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
  is '主键';
comment on column PTPA.T_DR_TRAINSTATISTIC.CC
  is '上报车次';
comment on column PTPA.T_DR_TRAINSTATISTIC.DDJMC
  is '担当局名称';
comment on column PTPA.T_DR_TRAINSTATISTIC.LINE_CODE
  is '区段代码';
comment on column PTPA.T_DR_TRAINSTATISTIC.BEGIN_END
  is '区段起讫点';
comment on column PTPA.T_DR_TRAINSTATISTIC.MILEAGE
  is '区段里程';
comment on column PTPA.T_DR_TRAINSTATISTIC.RAILWAY_NAME
  is '线路名';
comment on column PTPA.T_DR_TRAINSTATISTIC.RAILWAY_LEVEL
  is '线路等级';
comment on column PTPA.T_DR_TRAINSTATISTIC.RAILWAY_SSJMC
  is '线路所属局名称';
comment on column PTPA.T_DR_TRAINSTATISTIC.LOCOMOTIVE_TYPE
  is '机车种类';
comment on column PTPA.T_DR_TRAINSTATISTIC.LOCOMOTIVE_PSJMC
  is '机车配属局名称';
comment on column PTPA.T_DR_TRAINSTATISTIC.TRAIN_MILEAGE
  is '列车公里';
comment on column PTPA.T_DR_TRAINSTATISTIC.TRAIN_VEHICLE_MILEAGE_SUM
  is '客车车辆公里合计';
comment on column PTPA.T_DR_TRAINSTATISTIC.CREATED_BY
  is '创建人';
comment on column PTPA.T_DR_TRAINSTATISTIC.CREATED_AT
  is '创建时间';
comment on column PTPA.T_DR_TRAINSTATISTIC.LAST_MODIFIED_BY
  is '上次修改人';
comment on column PTPA.T_DR_TRAINSTATISTIC.LAST_MODIFIED_AT
  is '上次修改时间';
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
  is '主键';
comment on column PTPA.T_LV_CDJL.NAME
  is '车底交路名称';
comment on column PTPA.T_LV_CDJL.CC
  is '车底交路车次，车次间用“-”分割';
comment on column PTPA.T_LV_CDJL.LJDM
  is '配属局代码，来源铁路局';
comment on column PTPA.T_LV_CDJL.SPEED_LEVEL
  is '速度等级，表示为：”200-250“';
comment on column PTPA.T_LV_CDJL.TRAIN_TYPE_CODE
  is '客运列车类型名称，来源系统字典“客运列车类型”';
comment on column PTPA.T_LV_CDJL.TRAIN_TYPE_NAME
  is '客运列车类型代码，来源系统字典“客运列车类型”';
comment on column PTPA.T_LV_CDJL.LINE
  is '交路运行区段';
comment on column PTPA.T_LV_CDJL.MILEAGE
  is '交路总里程';
comment on column PTPA.T_LV_CDJL.GROUP_COUNT
  is '车底组数';
comment on column PTPA.T_LV_CDJL.TIME_COST
  is '交路总时间，表示为：“小时：分钟”';
comment on column PTPA.T_LV_CDJL.CREATED_BY
  is '创建人';
comment on column PTPA.T_LV_CDJL.CREATED_AT
  is '创建时间';
comment on column PTPA.T_LV_CDJL.LAST_MODIFIED_BY
  is '上次修改人';
comment on column PTPA.T_LV_CDJL.LAST_MODIFIED_AT
  is '上次修改时间';
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
  is '主键';
comment on column PTPA.T_LV_CDJLCC.CDJL_ID
  is '机辆部车底交路ID，来源“机辆部车底交路”';
comment on column PTPA.T_LV_CDJLCC.CC
  is '车次';
comment on column PTPA.T_LV_CDJLCC.MILEAGE
  is '车次里程';
comment on column PTPA.T_LV_CDJLCC.START_END
  is '运行区段';
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
  is '主键';
comment on column PTPA.T_LV_CDJLCL.CDJL_ID
  is '机辆部车底交路ID，来源“机辆部车底交路”';
comment on column PTPA.T_LV_CDJLCL.CX_CODE
  is '车型编码：来源于系统字典"车型"';
comment on column PTPA.T_LV_CDJLCL.CX_NAME
  is '车型名称：来源于系统字典"车型"';
comment on column PTPA.T_LV_CDJLCL.CZ_CODE
  is '车种编码：来源于系统字典"车种"';
comment on column PTPA.T_LV_CDJLCL.CZ_NAME
  is '车种名称：来源于系统字典"车种"';
comment on column PTPA.T_LV_CDJLCL.CAPACITY
  is '定员';
comment on column PTPA.T_LV_CDJLCL.ORDER_INDEX
  is '排序';
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
接触网和电费清算单价';
comment on column PTPA.T_PRICE_CE.ID
  is '主键';
comment on column PTPA.T_PRICE_CE.PSE_CODE
  is '客专企业代码，来源系统字典“客专企业”';
comment on column PTPA.T_PRICE_CE.PSE_NAME
  is '客专企业名称，来源系统字典“客专企业”';
comment on column PTPA.T_PRICE_CE.LJDM
  is '铁路局代码，来源"铁路局"';
comment on column PTPA.T_PRICE_CE.CATENARY_PRICE
  is '接触网清算单价，单位：元/吨公里，精确到小数点后2位';
comment on column PTPA.T_PRICE_CE.ELECTRICITY_PRICE
  is '电费清算单价，单位：元/吨公里，精确到小数点后2位';
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
  is '主键';
comment on column PTPA.T_PRICE_HUMANRESOURCE.HUMAN_RESOURCE_TYPE_CODE
  is '人力类型代码，来源系统字典“人力资源类型”';
comment on column PTPA.T_PRICE_HUMANRESOURCE.HUMAN_RESOURCE_TYPE_NAME
  is '人力类型名称，来源系统字典“人力资源类型”';
comment on column PTPA.T_PRICE_HUMANRESOURCE.LJDM
  is '铁路局代码，来源"铁路局"';
comment on column PTPA.T_PRICE_HUMANRESOURCE.PRICE
  is '平均人力支出，单位：元/人年，精确到小数点后2位';
comment on column PTPA.T_PRICE_HUMANRESOURCE.RATE
  is '每列车每公里人员配置数，单位：人/列公里，精确到小数点后9位';
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
  is '主键';
comment on column PTPA.T_PRICE_LINE.LINE_PRICE_LEVEL_CODE
  is '线路清算等级CODE，来源系统字典”线路清算等级“';
comment on column PTPA.T_PRICE_LINE.LINE_PRICE_LEVEL_NAME
  is '线路清算等级NAME，来源系统字典”线路清算等级“';
comment on column PTPA.T_PRICE_LINE.TRAIN_TYPE_CODE
  is '列车类型编码，来源系统字典“列车类型”';
comment on column PTPA.T_PRICE_LINE.TRAIN_TYPE_NAME
  is '列车类型名称，来源系统字典“列车类型”';
comment on column PTPA.T_PRICE_LINE.TRAIN_MARSHALLING_TYPE_CODE
  is '列车编组类型编码，来源系统字典“列车编组类型”';
comment on column PTPA.T_PRICE_LINE.TRAIN_MARSHALLING_TYPE_NAME
  is '列车编组类型名称，来源系统字典“列车编组类型”';
comment on column PTPA.T_PRICE_LINE.LINE_BUSY_LEVEL_CODE
  is '线路繁忙程度编码，来源系统字典“线路繁忙程度”';
comment on column PTPA.T_PRICE_LINE.LINE_BUSY_LEVEL_NAME
  is '线路繁忙程度名称，来源系统字典“线路繁忙程度”';
comment on column PTPA.T_PRICE_LINE.BEFORE_DAWN
  is '是否在22时至次日6时运行0：否，1：是';
comment on column PTPA.T_PRICE_LINE.BEFORE_DAWN_RATE
  is '在22时至次日6时运行折算比例，精确到小数点后两位';
comment on column PTPA.T_PRICE_LINE.PRICE
  is '清算单价，单位是元/列车公里，精确到分';
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
  is '主键';
comment on column PTPA.T_PRICE_PART.LJDM
  is '铁路局代码，来源"铁路局"';
comment on column PTPA.T_PRICE_PART.PRICE
  is '清算单价，单位：元/列公里，精确到小数点后2位';
comment on column PTPA.T_PRICE_PART.TRAIN_TYPE_CODE
  is '客运列车类型代码，来源系统字典“客运列车类型”';
comment on column PTPA.T_PRICE_PART.TRAIN_TYPE_NAME
  is '客运列车类型名称，来源系统字典“客运列车类型”';
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
  is '服务费用清算单价包含的服务：
进藏服务
轮渡服务

软票费
卧定费
空调费
售票代理费
车站旅客服务费
上水服务费';
comment on column PTPA.T_PRICE_SERVICE.ID
  is '主键';
comment on column PTPA.T_PRICE_SERVICE.SERVICE_CODE
  is '服务代码，来源系统字典“服务”';
comment on column PTPA.T_PRICE_SERVICE.SERVICE_NAME
  is '服务名称，来源系统字典“服务”';
comment on column PTPA.T_PRICE_SERVICE.LJDM
  is '铁路局代码，来源"铁路局"';
comment on column PTPA.T_PRICE_SERVICE.UNIT
  is '服务计量单位';
comment on column PTPA.T_PRICE_SERVICE.PRICE
  is '清算单价，单位：元/计量单位，精确到小数点后2位';
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
  is '主键';
comment on column PTPA.T_PRICE_STATIONSERVICE.STATION_SERVICE_TYPE_CODE
  is '车站旅客服务类别编码，来源系统字典“车站旅客服务类别”';
comment on column PTPA.T_PRICE_STATIONSERVICE.STATION_SERVICE_TYPE_NAME
  is '车站旅客服务类别名称，来源系统字典“车站旅客服务类别"';
comment on column PTPA.T_PRICE_STATIONSERVICE.PRICE
  is '清算单价，单位：元/人';
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
  is '主键';
comment on column PTPA.T_PRICE_TRACTION.TRACTION_TYPE_CODE
  is '牵引类型编码，来源系统字典“牵引类型”';
comment on column PTPA.T_PRICE_TRACTION.TRACTION_TYPE_NAME
  is '牵引类型名称，来源系统字典“牵引类型”';
comment on column PTPA.T_PRICE_TRACTION.LJDM
  is '铁路局代码，来源"铁路局"';
comment on column PTPA.T_PRICE_TRACTION.LOCOMOTIVE_PRICE
  is '机车清算单价，精确到小数点后2位';
comment on column PTPA.T_PRICE_TRACTION.CE_PRICE
  is '电力机车使用接触网和电费清算单价，精确到小数点后2位';
comment on column PTPA.T_PRICE_TRACTION.PRICE
  is '清算单价，单位：元/吨公里，精确到小数点后2位，机车清算单价和电力机车使用接触网清算单价之和';
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
  is '主键，从SEQ_T_SYS_DEPARTMENT生成';
comment on column PTPA.T_SYS_DEPARTMENT.NAME
  is '名称';
comment on column PTPA.T_SYS_DEPARTMENT.PARENT_ID
  is '上级节点，对应本表ID';
comment on column PTPA.T_SYS_DEPARTMENT.TYPE
  is '部门类型，从字典取，比如1路局2客运段3车辆段';
comment on column PTPA.T_SYS_DEPARTMENT.CODE
  is '部门编码';
comment on column PTPA.T_SYS_DEPARTMENT.DISPLAY_ORDER
  is '排序';
comment on column PTPA.T_SYS_DEPARTMENT.NOTE
  is '备注';
comment on column PTPA.T_SYS_DEPARTMENT.CREATED_BY
  is '创建人';
comment on column PTPA.T_SYS_DEPARTMENT.CREATED_AT
  is '创建时间';
comment on column PTPA.T_SYS_DEPARTMENT.LAST_MODIFIED_BY
  is '上次修改人';
comment on column PTPA.T_SYS_DEPARTMENT.LAST_MODIFIED_AT
  is '上次修改时间';
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
  is '主键，从SEQ_T_SYS_DIC生成';
comment on column PTPA.T_SYS_DIC.CATEGORY
  is '分类：01民族02政治面貌03教育程度04职务05职称
06部门类型
';
comment on column PTPA.T_SYS_DIC.CATEGORY_NAME
  is '分类名称';
comment on column PTPA.T_SYS_DIC.CODE
  is '字典代码';
comment on column PTPA.T_SYS_DIC.NAME
  is '字典名称';
comment on column PTPA.T_SYS_DIC.DISPLAY_ORDER
  is '排序';
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
  is '主键，从序列SEQ_T_SYS_ RELEASE获取';
comment on column PTPA.T_SYS_RELEASE.NAME
  is '系统名称';
comment on column PTPA.T_SYS_RELEASE.VERSION
  is '版本号';
comment on column PTPA.T_SYS_RELEASE.RELEASE_DATE
  is '发布日期：Yyyy-mm-dd';
comment on column PTPA.T_SYS_RELEASE.RELEASE_CONTENT
  is '发布内容文件地址';
comment on column PTPA.T_SYS_RELEASE.RELEASE_BY
  is '发布人';
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
  is '系统资源表';
comment on column PTPA.T_SYS_RESOURCE.ID
  is '主键，从序列SEQ_T_SYS_RESOURCE获取';
comment on column PTPA.T_SYS_RESOURCE.NAME
  is '资源名称';
comment on column PTPA.T_SYS_RESOURCE.CODE
  is '资源代码';
comment on column PTPA.T_SYS_RESOURCE.PARENT_ID
  is '上级节点';
comment on column PTPA.T_SYS_RESOURCE.URL
  is '链接';
comment on column PTPA.T_SYS_RESOURCE.TARGET
  is '链接目标';
comment on column PTPA.T_SYS_RESOURCE.ICONIMG
  is '图标';
comment on column PTPA.T_SYS_RESOURCE.DISPLAY_ORDER
  is '排序值';
comment on column PTPA.T_SYS_RESOURCE.TYPE
  is '资源类型,1模块，2操作';
comment on column PTPA.T_SYS_RESOURCE.DESCRIPTION
  is '描述';
comment on column PTPA.T_SYS_RESOURCE.RESOURCE_LEVEL
  is '资源等级:1仅限系统管理，2所有人';
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
  is '主键，从序列SEQ_T_SYS_ROLE获取';
comment on column PTPA.T_SYS_ROLE.NAME
  is '角色名称';
comment on column PTPA.T_SYS_ROLE.DESCRIPTION
  is '描述';
comment on column PTPA.T_SYS_ROLE.DISPLAY_ORDER
  is '排序值';
comment on column PTPA.T_SYS_ROLE.CREATED_AT
  is '创建人';
comment on column PTPA.T_SYS_ROLE.CREATED_BY
  is '创建时间';
comment on column PTPA.T_SYS_ROLE.LAST_MODIFIED_BY
  is '上次修改人';
comment on column PTPA.T_SYS_ROLE.LAST_MODIFIED_AT
  is '上次修改时间';
comment on column PTPA.T_SYS_ROLE.IS_DELETE
  is '标记角色是否可以被删除。0:不可以被删除；1：可以被删除。默认为1';
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
  is '角色资源表';
comment on column PTPA.T_SYS_ROLERESOURCE.ID
  is '主键，从序列SEQ_T_SYS_ROLRESOURCE获取';
comment on column PTPA.T_SYS_ROLERESOURCE.ROLE_ID
  is '角色id';
comment on column PTPA.T_SYS_ROLERESOURCE.RESOURCE_ID
  is '资源id';
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
  is '系统用户表';
comment on column PTPA.T_SYS_USER.ID
  is '主键，从序列SEQ_T_SYS_USER获取';
comment on column PTPA.T_SYS_USER.USERNAME
  is '登录账号';
comment on column PTPA.T_SYS_USER.PASSWORD
  is '密码';
comment on column PTPA.T_SYS_USER.RANDOMCODE
  is '随机数';
comment on column PTPA.T_SYS_USER.STATUS
  is '状态，1正常，2锁定';
comment on column PTPA.T_SYS_USER.REALNAME
  is '真实姓名';
comment on column PTPA.T_SYS_USER.MOBILE
  is '手机号';
comment on column PTPA.T_SYS_USER.CREATED_AT
  is '创建时间';
comment on column PTPA.T_SYS_USER.CREATED_BY
  is '创建人';
comment on column PTPA.T_SYS_USER.ROLE_ID
  is '角色id';
comment on column PTPA.T_SYS_USER.LAST_MODIFIED_BY
  is '上次修改人';
comment on column PTPA.T_SYS_USER.LAST_MODIFIED_AT
  is '上次修改时间';
comment on column PTPA.T_SYS_USER.AVATAR
  is '头像';
comment on column PTPA.T_SYS_USER.DEPARTMENT_ID
  is '关联T_SYS_DEPARTMENT的id';
comment on column PTPA.T_SYS_USER.IS_ADMIN
  is '是否管理员：0否1是，默认0
管理员开放所有权限。只有系统初始化时admin是管理员，其余用户改不了改标识
';
comment on column PTPA.T_SYS_USER.IS_CHECK
  is '是否审核：1是，0否，内部新增用户默认为1
预留字段
';
comment on column PTPA.T_SYS_USER.PINYIN
  is '根据姓名自动生成简写';
comment on column PTPA.T_SYS_USER.EMAIL
  is '邮箱';
comment on column PTPA.T_SYS_USER.GENDER
  is '性别';
comment on column PTPA.T_SYS_USER.NATION
  is '民族从字典取';
comment on column PTPA.T_SYS_USER.POLITICAL
  is '政治面貌从字典取';
comment on column PTPA.T_SYS_USER.EDUCATION
  is '教育程度从字典取';
comment on column PTPA.T_SYS_USER.GRADUATED_SCHOOL
  is '毕业院校';
comment on column PTPA.T_SYS_USER.MAJOR
  is '专业';
comment on column PTPA.T_SYS_USER.IDCARD
  is '身份证号';
comment on column PTPA.T_SYS_USER.TELEPHONE
  is '座机';
comment on column PTPA.T_SYS_USER.POST
  is '职务从字典取';
comment on column PTPA.T_SYS_USER.JOB_TITLE
  is '职称从字典取';
comment on column PTPA.T_SYS_USER.DISPLAY_ORDER
  is '排序';
comment on column PTPA.T_SYS_USER.LAST_LOGIN_DATE
  is '最后登录时间：登录后修改该字段';
comment on column PTPA.T_SYS_USER.COMPLETION
  is '用户信息完整度，100为完整，其中必填信息占51，其他信息占49。必填信息的任一项未填，必填信息完整度全为0，则用户完整度最高为49。完整度不足50的用户需要维护必填信息。';
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
  is '用户登录记录';
comment on column PTPA.T_SYS_USERLOGIN.ID
  is '主键，从序列SEQ_T_SYS_USERLOGIN获取';
comment on column PTPA.T_SYS_USERLOGIN.USER_ID
  is '用户id';
comment on column PTPA.T_SYS_USERLOGIN.LOGIN_DATE
  is '登录时间';
comment on column PTPA.T_SYS_USERLOGIN.LOGIN_IP
  is '登录IP';
comment on column PTPA.T_SYS_USERLOGIN.TERMINAL
  is '登录终端，0:pc,1:wap,2:android,3:ios';
comment on column PTPA.T_SYS_USERLOGIN.EXPLORERTYPE
  is '浏览器类型';
comment on column PTPA.T_SYS_USERLOGIN.EXPLORERVERSION
  is '浏览器版本';
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
  is '主键';
comment on column PTPA.T_TRAIN.NAME
  is '车次详情名称';
comment on column PTPA.T_TRAIN.CC
  is '车次';
comment on column PTPA.T_TRAIN.TRAIN_TYPE_CODE
  is '客运列车类型代码，来源系统字典“客运列车类型”';
comment on column PTPA.T_TRAIN.TRAIN_TYPE_NAME
  is '客运列车类型名称，来源系统字典“客运列车类型”';
comment on column PTPA.T_TRAIN.TRAIN_LEVEL_CODE
  is '客运列车等级代码，来源系统字典“客运列车等级”';
comment on column PTPA.T_TRAIN.TRAIN_LEVEL_NAME
  is '客运列车等级名称，来源系统字典“客运列车等级”';
comment on column PTPA.T_TRAIN.LJDM
  is '担当局代码，来源铁路局';
comment on column PTPA.T_TRAIN.BEGIN_CZDM
  is '始发站代码，来源客运营业站';
comment on column PTPA.T_TRAIN.END_CZDM
  is '终到站代码，来源客运营业站';
comment on column PTPA.T_TRAIN.TRAIN_MARSHALLING_TYPE_CODE
  is '客车编组类型代码，来源系统字典“客车编组类型”';
comment on column PTPA.T_TRAIN.TRAIN_MARSHALLING_TYPE_NAME
  is '客车编组类型名称，来源系统字典“客车编组类型”';
comment on column PTPA.T_TRAIN.VEHICLE_GROUP_SIZE
  is '车底组数';
comment on column PTPA.T_TRAIN.VEHICLE_GROUP_RATE
  is '车底占用比例';
comment on column PTPA.T_TRAIN.LV_JL_ID
  is '机辆部车底交路ID';
comment on column PTPA.T_TRAIN.CREATED_BY
  is '创建人';
comment on column PTPA.T_TRAIN.CREATED_AT
  is '创建时间';
comment on column PTPA.T_TRAIN.LAST_MODIFIED_BY
  is '上次修改人';
comment on column PTPA.T_TRAIN.LAST_MODIFIED_AT
  is '上次修改时间';
comment on column PTPA.T_TRAIN.LV_JL_MILEAGE
  is '机辆部车底交路交路总里程，来源机辆部车底交路';
comment on column PTPA.T_TRAIN.LV_JL_MILEAGE_CC
  is '机辆部车底交路交路总里程，来源机辆部车底交路';
comment on column PTPA.T_TRAIN.PART_PRICE
  is '备品清算单价，单位：元/列公里，精确到小数点后2位';
comment on column PTPA.T_TRAIN.LINE_COST
  is '线路成本，精确到小数点后两位';
comment on column PTPA.T_TRAIN.TRACTION_COST
  is '牵引成本，精确到小数点后两位';
comment on column PTPA.T_TRAIN.CE_COST
  is '接触网和电费成本，精确到小数点后两位';
comment on column PTPA.T_TRAIN.DEPRECIATION_COST
  is '车辆折旧费，精确到小数点后两位';
comment on column PTPA.T_TRAIN.MAINTAIN_ADVANCE_COST
  is '车辆大修费，精确到小数点后两位';
comment on column PTPA.T_TRAIN.MAINTAIN_NORMAL_COST
  is '车辆日常修费，精确到小数点后两位';
comment on column PTPA.T_TRAIN.HUMAN_RESOURCE_COST
  is '人力成本，精确到小数点后两位';
comment on column PTPA.T_TRAIN.PART_COST
  is '备品成本，精确到小数点后两位';
comment on column PTPA.T_TRAIN.SERVICE_COST
  is '服务成本，精确到小数点后两位';
comment on column PTPA.T_TRAIN.STATION_SERVICE_TYPE_CODE
  is '车站旅客服务类别编码，来源系统字典“车站旅客服务类别”';
comment on column PTPA.T_TRAIN.STATION_SERVICE_TYPE_NAME
  is '车站旅客服务类别名称，来源系统字典“车站旅客服务类别';
comment on column PTPA.T_TRAIN.STATION_SERVICE_PRICE
  is '车站旅客服务清算单价，单位：元/人';
comment on column PTPA.T_TRAIN.DS
  is '吨数，精确到小数点后两位';
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
  is '主键';
comment on column PTPA.T_TRAIN_CE.TRAIN_ID
  is '所属车次ID，来源车次详情';
comment on column PTPA.T_TRAIN_CE.XLDM
  is '线路代码，来源“客运线路”';
comment on column PTPA.T_TRAIN_CE.XLDM_NAME
  is '线路名称，来源“客运线路”';
comment on column PTPA.T_TRAIN_CE.BEGIN_CZDM
  is '区段起点站代码，来源”客运营业站“';
comment on column PTPA.T_TRAIN_CE.BEGIN_CZDM_NAME
  is '区段起点站名称，来源”客运营业站“';
comment on column PTPA.T_TRAIN_CE.END_CZDM
  is '区段讫点站代码，来源”客运营业站“';
comment on column PTPA.T_TRAIN_CE.END_CZDM_NAME
  is '区段讫点站名称，来源”客运营业站“';
comment on column PTPA.T_TRAIN_CE.PSE_CODE
  is '客专企业代码，来源系统字典“客专企业”';
comment on column PTPA.T_TRAIN_CE.PSE_NAME
  is '客专企业名称，来源系统字典“客专企业”';
comment on column PTPA.T_TRAIN_CE.LJDM
  is '铁路局代码，来源"铁路局"';
comment on column PTPA.T_TRAIN_CE.MILEAGE
  is '接触网区段里程，单位是km，精确到个位';
comment on column PTPA.T_TRAIN_CE.CATENARY_PRICE
  is '接触网清算单价，单位：元/吨公里，精确到小数点后4位';
comment on column PTPA.T_TRAIN_CE.ELECTRICITY_PRICE
  is '电费清算单价，单位：元/吨公里，精确到小数点后4位';
comment on column PTPA.T_TRAIN_CE.ORDER_INDEX
  is '排序';
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
  is '主键';
comment on column PTPA.T_TRAIN_HUMANRESOURCE.TRAIN_ID
  is '所属车次ID';
comment on column PTPA.T_TRAIN_HUMANRESOURCE.HUMAN_RESOURCE_TYPE_CODE
  is '人力类型代码，来源系统字典“人力资源类型”';
comment on column PTPA.T_TRAIN_HUMANRESOURCE.HUMAN_RESOURCE_TYPE_NAME
  is '人力类型名称，来源系统字典“人力资源类型”';
comment on column PTPA.T_TRAIN_HUMANRESOURCE.LJDM
  is '铁路局代码，来源"铁路局"';
comment on column PTPA.T_TRAIN_HUMANRESOURCE.PRICE
  is '平均人力支出，单位：元/人年，精确到小数点后2位';
comment on column PTPA.T_TRAIN_HUMANRESOURCE.RATE
  is '每列车每公里人员配置数，单位：人/列公里，精确到小数点后9位';
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
  is '主键';
comment on column PTPA.T_TRAIN_LINE.TRAIN_ID
  is '所属车次ID，来源车次详情';
comment on column PTPA.T_TRAIN_LINE.XLDM
  is '线路代码，来源“客运线路”';
comment on column PTPA.T_TRAIN_LINE.XLDM_NAME
  is '线路名称，来源“客运线路”';
comment on column PTPA.T_TRAIN_LINE.BEGIN_CZDM
  is '区段起点站代码，来源”客运营业站“';
comment on column PTPA.T_TRAIN_LINE.BEGIN_CZDM_NAME
  is '区段起点站名称，来源”客运营业站“';
comment on column PTPA.T_TRAIN_LINE.END_CZDM
  is '区段讫点站代码，来源”客运营业站“';
comment on column PTPA.T_TRAIN_LINE.END_CZDM_NAME
  is '区段讫点站名称，来源”客运营业站“';
comment on column PTPA.T_TRAIN_LINE.MILEAGE
  is '区段线路里程，单位是km，精确到个位';
comment on column PTPA.T_TRAIN_LINE.LINE_PRICE_LEVEL_CODE
  is '线路清算等级CODE，来源系统字典”线路清算等级“';
comment on column PTPA.T_TRAIN_LINE.LINE_PRICE_LEVEL_NAME
  is '线路清算等级NAME，来源系统字典”线路清算等级“';
comment on column PTPA.T_TRAIN_LINE.TRAIN_TYPE_CODE
  is '列车类型编码，来源系统字典“列车类型”';
comment on column PTPA.T_TRAIN_LINE.TRAIN_TYPE_NAME
  is '列车类型名称，来源系统字典“列车类型”';
comment on column PTPA.T_TRAIN_LINE.TRAIN_MARSHALLING_TYPE_CODE
  is '列车编组类型编码，来源系统字典“列车编组类型”';
comment on column PTPA.T_TRAIN_LINE.TRAIN_MARSHALLING_TYPE_NAME
  is '列车编组类型名称，来源系统字典“列车编组类型”';
comment on column PTPA.T_TRAIN_LINE.LINE_BUSY_LEVEL_CODE
  is '线路繁忙程度编码，来源系统字典“线路繁忙程度”';
comment on column PTPA.T_TRAIN_LINE.LINE_BUSY_LEVEL_NAME
  is '线路繁忙程度名称，来源系统字典“线路繁忙程度”';
comment on column PTPA.T_TRAIN_LINE.BEFORE_DAWN
  is '是否在22时至次日6时运行0：否，1：是';
comment on column PTPA.T_TRAIN_LINE.BEFORE_DAWN_RATE
  is '在22时至次日6时运行折算比例，精确到小数点后两位';
comment on column PTPA.T_TRAIN_LINE.PRICE
  is '清算单价，单位是元/公里，精确到分';
comment on column PTPA.T_TRAIN_LINE.ORDER_INDEX
  is '排序';
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
  is '主键';
comment on column PTPA.T_TRAIN_SERVICE.TRAIN_ID
  is '所属车次ID';
comment on column PTPA.T_TRAIN_SERVICE.SERVICE_CODE
  is '服务代码，来源系统字典“服务”';
comment on column PTPA.T_TRAIN_SERVICE.SERVICE_NAME
  is '服务名称，来源系统字典“服务”';
comment on column PTPA.T_TRAIN_SERVICE.LJDM
  is '铁路局代码，来源"铁路局"';
comment on column PTPA.T_TRAIN_SERVICE.UNIT
  is '服务计量单位';
comment on column PTPA.T_TRAIN_SERVICE.PRICE
  is '清算单价，单位：元/计量单位，精确到小数点后2位';
comment on column PTPA.T_TRAIN_SERVICE.ORDER_INDEX
  is '排序';
comment on column PTPA.T_TRAIN_SERVICE.COUNT
  is '服务次数，精确到小数点后1位';
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
  is '主键';
comment on column PTPA.T_TRAIN_TICKETPRICE.TRAIN_ID
  is '所属车次ID';
comment on column PTPA.T_TRAIN_TICKETPRICE.SEAT_TYPE_CODE
  is '席别编码：来源于系统字典"席别"';
comment on column PTPA.T_TRAIN_TICKETPRICE.SEAT_TYPE_NAME
  is '席别名称：来源于系统字典"席别"';
comment on column PTPA.T_TRAIN_TICKETPRICE.PRICE
  is '全程清算单价，单位：元/张，精确到小数点后2位';
comment on column PTPA.T_TRAIN_TICKETPRICE.ORDER_INDEX
  is '排序';
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
  is '主键';
comment on column PTPA.T_TRAIN_TRACTION.TRAIN_ID
  is '所属车次ID，来源车次详情';
comment on column PTPA.T_TRAIN_TRACTION.XLDM
  is '线路代码，来源“客运线路”';
comment on column PTPA.T_TRAIN_TRACTION.XLDM_NAME
  is '线路名称，来源“客运线路”';
comment on column PTPA.T_TRAIN_TRACTION.BEGIN_CZDM
  is '区段起点站代码，来源”客运营业站“';
comment on column PTPA.T_TRAIN_TRACTION.BEGIN_CZDM_NAME
  is '区段起点站名称，来源”客运营业站“';
comment on column PTPA.T_TRAIN_TRACTION.END_CZDM
  is '区段讫点站代码，来源”客运营业站“';
comment on column PTPA.T_TRAIN_TRACTION.END_CZDM_NAME
  is '区段讫点站名称，来源”客运营业站“';
comment on column PTPA.T_TRAIN_TRACTION.TRACTION_TYPE_CODE
  is '牵引类型代码，来源系统字典“牵引类型”';
comment on column PTPA.T_TRAIN_TRACTION.TRACTION_TYPE_NAME
  is '牵引类型名称，来源系统字典“牵引类型”';
comment on column PTPA.T_TRAIN_TRACTION.MILEAGE
  is '牵引区段里程，单位是km，精确到个位';
comment on column PTPA.T_TRAIN_TRACTION.LOCOMOTIVE_PRICE
  is '机车清算单价，精确到小数点后2位';
comment on column PTPA.T_TRAIN_TRACTION.CE_PRICE
  is '电力机车使用接触网和电费清算单价，精确到小数点后2位';
comment on column PTPA.T_TRAIN_TRACTION.ORDER_INDEX
  is '排序';
comment on column PTPA.T_TRAIN_TRACTION.LJDM
  is '铁路局代码，来源“铁路局”';
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
  is '主键';
comment on column PTPA.T_TRAIN_VEHICLE.TRAIN_ID
  is '所属车次ID，来源车次详情';
comment on column PTPA.T_TRAIN_VEHICLE.CX_CODE
  is '车型编码：来源于系统字典"车型"';
comment on column PTPA.T_TRAIN_VEHICLE.CX_NAME
  is '车型名称：来源于系统字典"车型"';
comment on column PTPA.T_TRAIN_VEHICLE.CZ_CODE
  is '车种编码：来源于系统字典"车种"';
comment on column PTPA.T_TRAIN_VEHICLE.CZ_NAME
  is '车种名称：来源于系统字典"车种"';
comment on column PTPA.T_TRAIN_VEHICLE.LX_CODE
  is '辆型编码，来源系统字典”辆型“';
comment on column PTPA.T_TRAIN_VEHICLE.LX_NAME
  is '辆型名称，来源系统字典”辆型“';
comment on column PTPA.T_TRAIN_VEHICLE.PURCHASE_PRICE
  is '购置成本，以元为单位，精确到分';
comment on column PTPA.T_TRAIN_VEHICLE.AVERAGE_KILOMETER
  is '平均年走行公里，单位：公里/年，精确到个位';
comment on column PTPA.T_TRAIN_VEHICLE.DEPRECIATION_PERIOD
  is '折旧年限，单位是年，精确到个位';
comment on column PTPA.T_TRAIN_VEHICLE.DEPERCIATION_RESIDUAL_RATE
  is '折旧残值率，精确到小数点后两位';
comment on column PTPA.T_TRAIN_VEHICLE.DEPERCIATION_RATE
  is '年折旧率，只读，精确到小数点后4位';
comment on column PTPA.T_TRAIN_VEHICLE.DEPERCIATION_PK_RATE
  is '每公里折旧率，只读，精确到小数点后10位';
comment on column PTPA.T_TRAIN_VEHICLE.DEPERCIATION_PRICE
  is '折旧清算单价，单位：元/辆公里，精确到小数点后2位';
comment on column PTPA.T_TRAIN_VEHICLE.ORDER_INDEX
  is '排序';
comment on column PTPA.T_TRAIN_VEHICLE.MAINTAIN_ADVANCE_PRICE
  is '大修清算单价，所有修程清算单价之和，单位：元/辆公里，精确到小数点后两位';
comment on column PTPA.T_TRAIN_VEHICLE.MAINTAIN_NORMAL_PRICE
  is '日常修清算单价，所有修程清算单价之和，单位：元/辆公里，精确到小数点后两位';
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
  is '主键';
comment on column PTPA.T_TRAIN_VEHICLESEAT.TRAIN_VEHICLE_ID
  is '车次编组车辆ID，来源车次编组车辆';
comment on column PTPA.T_TRAIN_VEHICLESEAT.SEAT_TYPE_CODE
  is '席别编码：来源于系统字典"席别"';
comment on column PTPA.T_TRAIN_VEHICLESEAT.SEAT_TYPE_NAME
  is '席别名称：来源于系统字典"席别"';
comment on column PTPA.T_TRAIN_VEHICLESEAT.CAPACITY
  is '定员';
comment on column PTPA.T_TRAIN_VEHICLESEAT.ORDER_INDEX
  is '排序';
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
  is '主键';
comment on column PTPA.T_VEHICLE.CX_CODE
  is '车型编码：来源于系统字典"车型"';
comment on column PTPA.T_VEHICLE.CX_NAME
  is '车型名称：来源于系统字典"车型"';
comment on column PTPA.T_VEHICLE.CZ_CODE
  is '车种编码：来源于系统字典"车种"';
comment on column PTPA.T_VEHICLE.CZ_NAME
  is '车种名称：来源于系统字典"车种"';
comment on column PTPA.T_VEHICLE.LX_CODE
  is '辆型编码，来源系统字典”辆型“';
comment on column PTPA.T_VEHICLE.LX_NAME
  is '辆型名称，来源系统字典”辆型“';
comment on column PTPA.T_VEHICLE.PURCHASE_PRICE
  is '购置成本，以元为单位，精确到分';
comment on column PTPA.T_VEHICLE.AVERAGE_KILOMETER
  is '平均年走行公里，单位：公里/年，精确到个位';
comment on column PTPA.T_VEHICLE.DEPRECIATION_PERIOD
  is '折旧年限，单位是年，精确到个位';
comment on column PTPA.T_VEHICLE.DEPERCIATION_RESIDUAL_RATE
  is '折旧残值率，精确到小数点后两位';
comment on column PTPA.T_VEHICLE.DEPERCIATION_RATE
  is '年折旧率，只读，精确到小数点后4位';
comment on column PTPA.T_VEHICLE.DEPERCIATION_PK_RATE
  is '每公里折旧率，只读，精确到小数点后10位';
comment on column PTPA.T_VEHICLE.DEPERCIATION_PRICE
  is '折旧清算单价，单位：元/辆公里，精确到小数点后2位';
comment on column PTPA.T_VEHICLE.MAINTAIN_ADVANCE_PRICE
  is '大修清算单价，所有修程清算单价之和，单位：元/辆公里，精确到小数点后两位';
comment on column PTPA.T_VEHICLE.MAINTAIN_NORMAL_PRICE
  is '日常修清算单价，所有修程清算单价之和，单位：元/辆公里，精确到小数点后两位';
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
  is '主键';
comment on column PTPA.T_VEHICLE_SEAT.VEHICLE_ID
  is '车辆类型ID，来源车辆类型';
comment on column PTPA.T_VEHICLE_SEAT.SEAT_TYPE_CODE
  is '席别编码：来源于系统字典"席别"';
comment on column PTPA.T_VEHICLE_SEAT.SEAT_TYPE_NAME
  is '席别名称：来源于系统字典"席别"';
comment on column PTPA.T_VEHICLE_SEAT.CAPACITY
  is '定员';
comment on column PTPA.T_VEHICLE_SEAT.ORDER_INDEX
  is '排序';
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
