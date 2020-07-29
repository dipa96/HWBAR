/* 2 utente admin\user */ 
INSERT INTO users (id,email,nome,cognome,indirizzo,dnascita,city,cap,ntel1,password,ruolo) VALUE ('1','admin@admin.com','admin','admin','admin','99/99/99','admin','9999','9876543212','admin','admin');
INSERT INTO users (id,email,nome,cognome,indirizzo,dnascita,city,cap,ntel1,password,ruolo) VALUE ('2','user@user.com','user','user','user','99/99/99','user','9999','9876543212','user','user');

INSERT INTO users (id,email,nome,cognome,indirizzo,dnascita,city,cap,ntel1,password,ruolo) VALUE ('3','donato@user.com','donato','dipasquale','via aria silvana','08/04/1996','potenza','85100','9876543212','donato','user');
INSERT INTO users (id,email,nome,cognome,indirizzo,dnascita,city,cap,ntel1,password,ruolo) VALUE ('4','federico@user.com','federico','pio','via garibaldi','10/05/1996','lacedonia','80431','9876543212','federico','user');

/* 2 messaggi di assistenza da user 3,4 */ 
INSERT INTO assistenza (id,users_id,stato,messaggio) VALUE ('1','3','1','Questa è una prova per i reclami');
INSERT INTO assistenza (id,users_id,stato,messaggio) VALUE ('2','4','2','Questa è una seconda prova per i reclami');

/* Scheda madre, CPU, RAM , GPU , gaming */ 
INSERT INTO categorie (idcategorie,nome) VALUE ('1','scheda madre');
INSERT INTO categorie (idcategorie,nome) VALUE ('2','cpu');
INSERT INTO categorie (idcategorie,nome) VALUE ('3','ram');
INSERT INTO categorie (idcategorie,nome) VALUE ('4','gpu');
INSERT INTO categorie (idcategorie,nome) VALUE ('5','gaming');

/* 2 scheda madre , 2 cpu */ 
INSERT INTO prodotti (id,nome,prezzo,deposito,descrizione,categorie_idcategorie,path,status) VALUE ('1','Scheda madre prova','50.00','35','Una scheda madre di prova','1','/HWBAR1/WebContent/imgproduct/300x300.png','1');
INSERT INTO prodotti (id,nome,prezzo,deposito,descrizione,categorie_idcategorie,path,status) VALUE ('2','Scheda madre2 prova2','100.00','75','Una scheda madre 2 di prova 2','1','/HWBAR1/WebContent/imgproduct/300x300.png','1');
INSERT INTO prodotti (id,nome,prezzo,deposito,descrizione,categorie_idcategorie,path,status) VALUE ('3','Una CPU - prova','100.00','75','Una cpu di prova','2','/HWBAR1/WebContent/imgproduct/300x300.png','1');
INSERT INTO prodotti (id,nome,prezzo,deposito,descrizione,categorie_idcategorie,path,status) VALUE ('4','Una CPU 2 - prova 2','100.00','75','Una cpu di prova','2','/HWBAR1/WebContent/imgproduct/300x300.png','1');

/* indirizzo spedizione e modalità di pagamento aggiunta per l'utente donato@user.com:user */
INSERT INTO indirizzo_sped (id,useusersrs_id,indirizzo,city,cap,num_tel,nome,cognome,status,civico) VALUE ('1','3','Via rossi','Milano','45102','3984329431','donato','dipasquale','0','45');
INSERT INTO pagamento (id,users_id,circuito,codice,cvc,scad,intestatario,status) VALUE ('1','3','MASTERCARD','1234-2342-3453-1234','123','12/2222','donato di pasquale','0');
