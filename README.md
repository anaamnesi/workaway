# WorkAway
Final Project JAITA79
## Backend
- Java 8
- Spring Boot 2.7.9
- MySql 8.0.32
- Dynamic Web Module 4.0

## Frontend
- HTML
- CSS
- JavaScript

## Descrizione
La WebApp di WorkAway consente alle aziende di investire sul benessere dei loro dipendenti proponendo loro dei pacchetti-esperienza che consentano di svolgere il lavoro a distanza in contesti di co-living, co-working e co-travelling.
L'utente potrà collegarsi al sito facendo il login ed in base ai privilegi del suo account potrà fare determinate operazioni: 
- Webmaster: Privilegi assoluti;
- Admin: Gestione dei viaggi e degli utenti (non admin);
- Utente: Prenotazione di pacchetti-offerte, visualizzazione del profilo, modifica dei propri dati.

## Info Utili
Il Dump del database del progetto si trova nella cartella webapp/res con il nome di: dump-workaway.sql.
In accessoController, nel GetMapping("/pacchettiOfferte") cambiare il percorso del file webapp/res/descrizioni.txt.
