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
    


/* 1.Mostrare nome e descrizione di tutti i moduli da 9 CFU */
select nome, descrizione
from modulo
where CFU=9;

/*2.Mostrare matricola, nome e cognome dei docenti che hanno più di 60 anni*/
select matricola, nome, cognome
from docente
where data_nascita < '1986/06/21';

/*3.Mostrare nome, cognome e nome del dipartimento di ogni docente, ordinati dal più giovane al più anziano */
select d.nome ,d.cognome ,d.dipartimento as nomedip
from docente d
order by(Data_nascita) asc;

/*4.Mostrare città e indirizzo di ogni sede del dipartimento di codice "uniba2" */
select citta as cittasede,indirizzo as indirizzosede, Codice_dipartimento
from sede, sede_dipartimento
where Codice=Codice_sede and Codice_dipartimento='uniba2';

/*4. FORMA ESPLICITA*/
select citta as cittasede, indirizzo as indirizzosede, codice_dipartimento
from sede join sede_dipartimento on codice=codice_sede
where codice_dipartimento='uniba2';

/*5.Mostrare nome del dipartimento, città e indirizzo di ogni sede di ogni dipartimento, ordinate alfabeticamente prima per nome dipartimento, poi per nome città e infine per indirizzo.*/
select d.nome as nomedip, s.citta as CittaSede, s.indirizzo as IndirizzoSede
from sede s,sede_dipartimento,dipartimento d
where s.codice=Codice_sede and d.codice=Codice_dipartimento
order by d.nome,s.citta,s.indirizzo;

/*5 FORMA ESPLICITA*/
select d.nome as nomedip, s.citta as cittasede, s.indirizzo as indirizzosede
from sede s join sede_dipartimento on s.codice=codice_sede join dipartimento d on d.codice=codice_dipartimento
order by d.nome,s.citta,s.indirizzo;

/*6.Mostrare il nome di ogni dipartimento che ha una sede a Bari*/
select d.nome as NomeDip, s.citta as CittaSede
from sede s, sede_dipartimento, dipartimento d 
where s.codice=Codice_sede and d.codice=Codice_dipartimento and s.citta='Bari';

/*6 FORMA ESPLICITA*/
select d.nome as nomedip, s.citta as cittasede
from sede s join sede_dipartimento on s.codice=codice_sede join dipartimento d on d.codice=codice_dipartimento
where s.citta = 'bari';

/*6. FORMA NIDIFICATA*/
select d.nome as nomedip
from dipartimento d
where exists  (select *
		from sede_dipartimento, sede s
		where s.citta='Bari' and d.codice=codice_dipartimento and s.codice=codice_sede);



/*7.Mostrare il nome di ogni dipartimento che non ha sede a Bari-FORMA IMPLICITA-*/
select d.nome as Nomedip, s.citta as CittaSede
from sede s, sede_dipartimento, dipartimento d
where s.codice=Codice_sede and d.codice=Codice_dipartimento and s.citta<>'Bari';

/*7.interrogazione nidificata complessa */
select d.nome as nomedip
from dipartimento d
where not exists (select *
                  from sede_dipartimento, sede s
                  where s.citta='Bari' and d.codice=codice_dipartimento and s.codice=codice_sede);
                  
/*8.Mostrare media, numero esami sostenuti e totale CFU acquisiti dello studente con matricola 732526 - FORMA IMPLICITA-*/
select avg(voto) as mediavoti, count(*) as numeroesami, sum(CFU) as TotCFU
from esame, modulo
where codice_modulo=codice and matricola_studente='732526';

/*8.FORMA ESPLICITA*/
select avg(voto) as mediavoti,count(*) as numeroesami, sum(CFU) as TotCFU
from esame join modulo on codice_modulo=codice
where matricola_studente='732526';

/*9.Mostrare nome, cognome, nome del corso di laurea, media e numero esami sostenuti dello studente con matricola 702025 */
select s.nome as nomestudente, s.cognome as cognomestudente, s.corso_laurea as corsolaurea ,avg(voto) as mediavoti, count(*) as numeroesami
from studente s,esame, modulo
where codice_modulo=codice and matricola=matricola_studente and matricola='702025';

/*10 Mostrare codice, nome e voto medio di ogni modulo, ordinati dalla media più alta alla più bassa */
select m.codice as codicemodulo, m.nome as nomemodulo, avg(e.voto) as mediavoto
from modulo m, esame e
where e.codice_modulo=m.codice
group by m.nome, m.codice
order by avg(e.voto) desc;

/*10. FORMA ESPLICITA */
select m.codice as codicemodulo, m.nome as nomemodulo, avg(e.voto) as mediavoto
from modulo m join esame e on  e.codice_modulo=m.codice
group by m.nome, m.codice
order by avg(e.voto) desc;

/*11.Mostrare nome e cognome del docente, nome e descrizione del modulo per ogni docente ed ogni modulo di cui quel docente abbia tenuto almeno un esame; il risultato deve includere anche i docenti che non abbiano tenuto alcun esame, in quel caso rappresentati con un'unica tupla in cui nome e descrizione del modulo avranno valore NULL */
select d.nome as nomedoc, d.cognome as cognomedoc,m.nome as nomemod,m.descrizione as descrizionemod
from docente d,esame e, modulo m
where d.matricola=e.Matricola_docente and m.codice=e.Codice_Modulo;

/*12.Mostrare matricola, nome, cognome, data di nascita, media e numero esami sostenuti di ogni studente.*/
select matricola, nome, cognome, data_nascita, avg(voto) as mediavoto, count(*) as totesami
from studente left join esame on matricola=matricola_studente
group by nome;

/*13.mostrare matricola, nome, cognome, data di nascita, media e numero esami sostenuti di ogni studente del corso di laurea di codice "InF00" che abbia media maggiore di 25*/
select s.matricola,s.nome,s.cognome,s.Data_nascita, avg(e.voto)as MediaVoti,count(s.matricola) as EsamiSostenuti
from studente s, esame e, corso_laurea c
where s.matricola=e.Matricola_studente and c.nome=s.Corso_Laurea
group by s.matricola
having avg(e.voto)>=25;

/*13 FORMULA NIDIFICATA COMPLESSA*/
select s.matricola,s.nome,s.cognome,s.Data_nascita,count(s.matricola) as EsamiSostenuti
from studente s, corso_laurea c
where c.nome=s.Corso_Laurea and  25<= (select avg(e.voto)as MediaVoti
from esame e
where s.matricola=e.Matricola_studente);

/*14.Mostrare nome, cognome e data di nascita di tutti gli studenti che ancora non hanno superato nessun esame*/
select s.nome,s.cognome,s.Data_nascita
from studente s
where s.matricola not in ( select s.matricola
from studente s, esame e
where s.matricola=e.Matricola_studente);




















                                                    







