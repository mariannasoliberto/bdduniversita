show databases;
drop database universita;

create database universita;
use universita;

create table Corso_laurea(
Codice varchar(10) primary key,
Nome varchar(30) unique,
Descrizione varchar(60)
);

create table studente(
Matricola numeric(6) primary key,
Corso_Laurea varchar(50),
Nome varchar(30) not null,
Cognome varchar(30) not null,
Data_nascita date not null,
Codice_Fiscale char(16) unique not null,
Foto Blob default null,
  Foreign key (Corso_Laurea) references corso_laurea(Nome)
);

create table sede(
    Codice varchar(10) primary key,
    Indirizzo varchar(30) unique not null,
    Citta varchar(30) not null
);

create table dipartimento(
    Codice varchar(10) primary key,
    Nome varchar(30) unique not null
);

create table sede_dipartimento(
Codice_sede varchar(10),
Codice_dipartimento varchar(10),
Note varchar(60),
Primary key(Codice_sede,Codice_dipartimento),
Foreign key (Codice_sede) references sede(Codice),
Foreign key (Codice_dipartimento) references dipartimento(Codice)
);

create table modulo(
Codice varchar(10) primary key,
Nome varchar(30) not null,
Descrizione varchar(60),
CFU int not null
);

create table docente(
Matricola numeric(6) primary key,
Dipartimento varchar(60),
Nome varchar(30) not null,
Cognome varchar(30) not null,
Data_nascita date not null,
Codice_Fiscale char(16) unique not null,
Foto Blob default null,
Foreign key (Dipartimento) references dipartimento(Nome)
);

create table esame(
Matricola_studente numeric(6),
Codice_Modulo varchar(10),
Matricola_docente numeric(6),
Data_esame date,
Voto smallint check (Voto>=18 and Voto<=30),
Lode char(4),
Note varchar(60),
check (Lode='' or Voto=30),
primary key (Matricola_studente,Codice_Modulo,Matricola_docente),
Foreign key (Matricola_studente) references studente(Matricola)
  						                          on delete cascade
                                        on update cascade,
Foreign key (Matricola_docente) references docente(Matricola),
Foreign key (Codice_Modulo) references modulo(Codice)
);


insert into Corso_laurea(Codice, Nome, Descrizione)
     values ('InF00','Informatica',null);
insert into Corso_laurea(Codice, Nome, Descrizione)
     values ('LeX01','Giurisprudenza',null);
insert into Corso_laurea(Codice, Nome, Descrizione)
     values ('MeD02','Medicina',null);
insert into Corso_laurea(Codice, Nome, Descrizione)
     values ('INff0','Infermieristica',null);
     
     
insert into Studente(Matricola, Corso_laurea, Nome, Cognome, Data_nascita, Codice_fiscale, Foto)
     values ('742230','Informatica','Marianna','Soliberto','1992/06/23','SLBMNN92H63L049C',null);
insert into Studente(Matricola, Corso_laurea, Nome, Cognome, Data_nascita, Codice_fiscale, Foto)
	 values ('734026','Informatica','Carmela','Florio','1992/06/26','FLRCRM92G68P073C',null);
insert into Studente(Matricola, Corso_laurea, Nome, Cognome, Data_nascita, Codice_fiscale, Foto)
     values ('732526','Giurisprudenza','Giorgia','Rossi','1990/02/20','GRGRSS90L89P012B',null);
insert into Studente(Matricola, Corso_laurea, Nome, Cognome, Data_nascita, Codice_fiscale, Foto)     
      values ('789622','Medicina','Mattia','Esposito','1988/01/14','MTTEPT88H45G032A',null);
insert into Studente(Matricola, Corso_laurea, Nome, Cognome, Data_nascita, Codice_fiscale, Foto)
      values ('702025','Infermieristica','Luca','Bianchi','1994/10/02','LCABHC94E61O073F',null);
      
      
insert into sede(Codice, Indirizzo, Citta)
      values ('Tar100','Via Ancona','Taranto');
insert into sede(Codice, Indirizzo, Citta)
      values ('Bar101','Via Sparano','Bari');
insert into sede(Codice, Indirizzo, Citta)
      values ('Mil201','Via San Giovanni','Milano');
insert into sede(Codice, Indirizzo, Citta)
      values ('Rom210','Via Aurelia','Roma');
      
      
insert into dipartimento(Codice, Nome)
      values ('UniBa2','Informatica');
insert into dipartimento(Codice, Nome)
      values ('UniTa3','Giurisprudenza');
insert into dipartimento(Codice, Nome)
      values ('PolRm6','Medicina');
insert into dipartimento(Codice, Nome)
      values ('UniMl4','Infermieristica');
      
      
insert into sede_dipartimento(Codice_sede,Codice_dipartimento,Note)
       values ('Tar100','UniBa2',null);
insert into sede_dipartimento(Codice_sede,Codice_dipartimento,Note)
       values ('Bar101','UniTa3',null);
insert into sede_dipartimento(Codice_sede,Codice_dipartimento,Note)
       values ('Mil201','PolRm6',null);
insert into sede_dipartimento(Codice_sede,Codice_dipartimento,Note)
       values ('Rom210','UniMl4',null);
       
       
insert into modulo(Codice, Nome, Descrizione, CFU)
		values ('Bdd9jk','Basi Di Dati',null,'9');
insert into modulo(Codice, Nome, Descrizione, CFU)
        values ('Dpt10a','Diritto Privato',null,'12');
insert into modulo(Codice, Nome, Descrizione, CFU)
		values ('AntU20','Anatomia Umana',null,'14');
insert into modulo(Codice, Nome, Descrizione, CFU)
        values ('Biol90','Biologia',null,'9');
        
       
       
insert into docente(Matricola, Dipartimento, Nome, Cognome, Data_nascita, Codice_fiscale, Foto)
      values ('435678','Informatica','Miguel','Ceriani','1986/06/21','MGLCRN86H79L056C',null);
insert into docente(Matricola, Dipartimento, Nome, Cognome, Data_nascita, Codice_fiscale, Foto)
	  values ('409823','Giurisprudenza','Claudio','Maggio','1979/11/26','MGGCLD79I65A012L',null); 
insert into docente(Matricola, Dipartimento, Nome, Cognome, Data_nascita, Codice_fiscale, Foto)
      values ('547122','Medicina','Stefano','Spada','1977/04/15','STFSDA77B45A012V',null);
insert into docente(Matricola, Dipartimento, Nome, Cognome, Data_nascita, Codice_fiscale, Foto)
      values ('526132','Infermieristica','Antonio','Rossi','1983/10/03','ATNRSS83I10O032C',null);
      
      
insert into esame(Matricola_Studente, Codice_Modulo, Matricola_Docente, Data_esame, Voto, Lode, Note)
       values ('734026','Bdd9jk','435678','2019/06/11','30','',null);
insert into esame(Matricola_Studente, Codice_Modulo, Matricola_Docente, Data_esame, Voto, Lode, Note)
       values ('732526','Dpt10a','409823','2017/02/21','27','',null);
insert into esame(Matricola_Studente, Codice_Modulo, Matricola_Docente, Data_esame, Voto, Lode, Note)
       values ('789622','AntU20','547122','2019/12/22','25','',null);
       
      

        
        
       
      
		
      


