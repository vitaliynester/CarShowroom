create table account (
   login                VARCHAR(100)         not null,
   password             VARCHAR(250)         not null,
   phone_number         VARCHAR(11)          not null,
   constraint PK_ACCOUNT primary key (login)
);

create unique index account_PK on account (
login
);

create table car (
   car_id               SERIAL not null,
   equipment_id         INT4                 not null,
   VIN                  VARCHAR(17)          not null,
   constraint PK_CAR primary key (car_id)
);

create unique index car_PK on car (
car_id
);

create  index have_equipment_FK on car (
equipment_id
);

create table client (
   client_id            SERIAL not null,
   login                VARCHAR(100)         not null,
   client_name          VARCHAR(200)         not null,
   client_email         VARCHAR(250)         null,
   client_birthday      DATE                 not null,
   client_address       VARCHAR(500)         null,
   client_passport      VARCHAR(10)          not null,
   client_driver_license VARCHAR(10)          not null,
   client_first_license_date DATE                 not null,
   constraint PK_CLIENT primary key (client_id)
);

create unique index client_PK on client (
client_id
);

create  index have_client_FK on client (
login
);

create table employee (
   employee_id          SERIAL not null,
   login                VARCHAR(100)         not null,
   employee_name        VARCHAR(200)         not null,
   employee_position    VARCHAR(100)         not null,
   constraint PK_EMPLOYEE primary key (employee_id)
);

create unique index employee_PK on employee (
employee_id
);

create  index have_employee_FK on employee (
login
);

create table equipment (
   equipment_id         SERIAL not null,
   model_id             INT4                 not null,
   equipment_name       VARCHAR(200)         not null,
   equipment_price      MONEY                not null,
   equipment_engine     VARCHAR(500)         not null,
   equipment_drives     VARCHAR(100)         not null,
   equipment_color      VARCHAR(100)         not null,
   equipment_salon      VARCHAR(200)         not null,
   constraint PK_EQUIPMENT primary key (equipment_id)
);

create unique index equipment_PK on equipment (
equipment_id
);

create  index have_FK on equipment (
model_id
);

create table model (
   model_id             SERIAL not null,
   model_name           VARCHAR(200)         not null,
   model_mark           VARCHAR(200)         not null,
   constraint PK_MODEL primary key (model_id)
);

create unique index model_PK on model (
model_id
);

create table orders (
   order_id             SERIAL not null,
   client_id            INT4                 not null,
   car_id               INT4                 not null,
   employee_id          INT4                 not null,
   order_date           DATE                 not null,
   order_clear_price    MONEY                not null,
   order_price          MONEY                not null,
   constraint PK_ORDERS primary key (order_id)
);

create unique index orders_PK on orders (
order_id
);

create  index create_FK on orders (
client_id
);

create  index include_FK on orders (
car_id
);

create  index draw_FK on orders (
employee_id
);

create table score (
   score_id             SERIAL not null,
   order_id             INT4                 not null,
   score_sum            MONEY                not null,
   score_status         INT4                 not null,
   score_date           DATE                 not null,
   constraint PK_SCORE primary key (score_id)
);

create unique index score_PK on score (
score_id
);

create  index pay_FK on score (
order_id
);

create table test_drive (
   test_drive_id        SERIAL not null,
   car_id               INT4                 not null,
   employee_id          INT4                 not null,
   client_id            INT4                 not null,
   test_drive_date      DATE                 not null,
   test_drive_price     MONEY                not null,
   test_drive_status    INT4                 not null,
   test_drive_hours     INT4                 not null,
   constraint PK_TEST_DRIVE primary key (test_drive_id)
);

create unique index test_drive_PK on test_drive (
test_drive_id
);

create  index going_FK on test_drive (
car_id
);

create  index have_part_FK on test_drive (
employee_id
);

create  index to_order_FK on test_drive (
client_id
);

alter table car
   add constraint FK_CAR_HAVE_EQUI_EQUIPMEN foreign key (equipment_id)
      references equipment (equipment_id)
      on delete restrict on update restrict;

alter table client
   add constraint FK_CLIENT_HAVE_CLIE_ACCOUNT foreign key (login)
      references account (login)
      on delete restrict on update restrict;

alter table employee
   add constraint FK_EMPLOYEE_HAVE_EMPL_ACCOUNT foreign key (login)
      references account (login)
      on delete restrict on update restrict;

alter table equipment
   add constraint FK_EQUIPMEN_HAVE_MODEL foreign key (model_id)
      references model (model_id)
      on delete restrict on update restrict;

alter table orders
   add constraint FK_ORDERS_CREATE_CLIENT foreign key (client_id)
      references client (client_id)
      on delete restrict on update restrict;

alter table orders
   add constraint FK_ORDERS_DRAW_EMPLOYEE foreign key (employee_id)
      references employee (employee_id)
      on delete restrict on update restrict;

alter table orders
   add constraint FK_ORDERS_INCLUDE_CAR foreign key (car_id)
      references car (car_id)
      on delete restrict on update restrict;

alter table score
   add constraint FK_SCORE_PAY_ORDERS foreign key (order_id)
      references orders (order_id)
      on delete restrict on update restrict;

alter table test_drive
   add constraint FK_TEST_DRI_GOING_CAR foreign key (car_id)
      references car (car_id)
      on delete restrict on update restrict;

alter table test_drive
   add constraint FK_TEST_DRI_HAVE_PART_EMPLOYEE foreign key (employee_id)
      references employee (employee_id)
      on delete restrict on update restrict;

alter table test_drive
   add constraint FK_TEST_DRI_TO_ORDER_CLIENT foreign key (client_id)
      references client (client_id)
      on delete restrict on update restrict;
