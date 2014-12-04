/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  04/12/2014 22:52:21                      */
/*==============================================================*/


drop table if exists APPARTIENT;

drop table if exists CATEGORIE;

drop table if exists CHOIX_VOTE;

drop table if exists CITY;

drop table if exists COUNTRY;

drop table if exists LOCALISATION;

drop table if exists POST;

drop table if exists POST_TYPE;

drop table if exists USER;

drop table if exists USER_TYPE;

drop table if exists VOTE_POUR;

/*==============================================================*/
/* Table : APPARTIENT                                           */
/*==============================================================*/
create table APPARTIENT
(
   ID_USER              int not null,
   ID_POST              int not null,
   primary key (ID_USER, ID_POST)
);

/*==============================================================*/
/* Table : CATEGORIE                                            */
/*==============================================================*/
create table CATEGORIE
(
   ID_CATEGORIE         int not null,
   LIB_CATASTROPHE      text not null,
   primary key (ID_CATEGORIE)
);

/*==============================================================*/
/* Table : CHOIX_VOTE                                           */
/*==============================================================*/
create table CHOIX_VOTE
(
   ID_CHOIX             int not null,
   REPONSE              text not null,
   primary key (ID_CHOIX)
);

/*==============================================================*/
/* Table : CITY                                                 */
/*==============================================================*/
create table CITY
(
   ID_CITY              int not null,
   ID_COUNTRY           int not null,
   NOM                  text not null,
   primary key (ID_CITY)
);

/*==============================================================*/
/* Table : COUNTRY                                              */
/*==============================================================*/
create table COUNTRY
(
   ID_COUNTRY           int not null,
   NOM                  text not null,
   primary key (ID_COUNTRY)
);

/*==============================================================*/
/* Table : LOCALISATION                                         */
/*==============================================================*/
create table LOCALISATION
(
   ID_LOCALISATION      int not null,
   LATITUDE             decimal(10) not null,
   LONTITUDE            decimal(10) not null,
   primary key (ID_LOCALISATION)
);

/*==============================================================*/
/* Table : POST                                                 */
/*==============================================================*/
create table POST
(
   ID_POST              int not null,
   ID_LOCALISATION      int not null,
   ID_CATEGORIE         int not null,
   ID                   int not null,
   REPONSE              text not null,
   DESCRIPTION          text not null,
   DATE                 date not null,
   primary key (ID_POST)
);

/*==============================================================*/
/* Table : POST_TYPE                                            */
/*==============================================================*/
create table POST_TYPE
(
   ID                   int not null,
   "LABEL"              text not null,
   primary key (ID)
);

/*==============================================================*/
/* Table : USER                                                 */
/*==============================================================*/
create table USER
(
   ID_USER              int not null,
   ID_CITY              int not null,
   ID_USER_TYPE         int not null,
   NOM                  text not null,
   PRENOM               text not null,
   EMAIL                text not null,
   MDP                  text not null,
   primary key (ID_USER)
);

/*==============================================================*/
/* Table : USER_TYPE                                            */
/*==============================================================*/
create table USER_TYPE
(
   ID_USER_TYPE         int not null,
   LIB_USER_TYPE        text not null,
   primary key (ID_USER_TYPE)
);

/*==============================================================*/
/* Table : VOTE_POUR                                            */
/*==============================================================*/
create table VOTE_POUR
(
   ID_USER              int not null,
   ID_POST              int not null,
   ID_CHOIX             int not null,
   POIDS                int,
   primary key (ID_USER, ID_POST, ID_CHOIX)
);

alter table APPARTIENT add constraint FK_APPARTIENT foreign key (ID_USER)
      references USER (ID_USER) on delete restrict on update restrict;

alter table APPARTIENT add constraint FK_APPARTIENT2 foreign key (ID_POST)
      references POST (ID_POST) on delete restrict on update restrict;

alter table CITY add constraint FK_LOCALISE foreign key (ID_COUNTRY)
      references COUNTRY (ID_COUNTRY) on delete restrict on update restrict;

alter table POST add constraint FK_CONCERNE foreign key (ID_CATEGORIE)
      references CATEGORIE (ID_CATEGORIE) on delete restrict on update restrict;

alter table POST add constraint FK_EST_FAIT foreign key (ID_LOCALISATION)
      references LOCALISATION (ID_LOCALISATION) on delete restrict on update restrict;

alter table POST add constraint FK_EST_POST foreign key (ID)
      references POST_TYPE (ID) on delete restrict on update restrict;

alter table USER add constraint FK_EST_UN foreign key (ID_USER_TYPE)
      references USER_TYPE (ID_USER_TYPE) on delete restrict on update restrict;

alter table USER add constraint FK_VIE foreign key (ID_CITY)
      references CITY (ID_CITY) on delete restrict on update restrict;

alter table VOTE_POUR add constraint FK_VOTE_POUR foreign key (ID_USER)
      references USER (ID_USER) on delete restrict on update restrict;

alter table VOTE_POUR add constraint FK_VOTE_POUR2 foreign key (ID_POST)
      references POST (ID_POST) on delete restrict on update restrict;

alter table VOTE_POUR add constraint FK_VOTE_POUR3 foreign key (ID_CHOIX)
      references CHOIX_VOTE (ID_CHOIX) on delete restrict on update restrict;

