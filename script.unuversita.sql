use universita;

insert into Corso_laurea(Codice, Nome, Descrizione)
     values (null, 'scienze ambientali', null);
     
     insert into esame(Matricola_Studente, Codice_Modulo, Matricola_Docente, Data_esame, Voto, Lode, Note)
          values ('702025','Biol90','526132','2018/06/23','32','',null);
          
insert into esame(Matricola_Studente, Codice_Modulo, Matricola_Docente, Data_esame, Voto, Lode, Note)
       values ('Abter','Biol90','526132','2018/06/23','18','',null);
       
       
     insert into sede_dipartimento(Codice_sede,Codice_dipartimento,Note)
             values ('Tar100','Polum',null);