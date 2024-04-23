      ******************************************************************
      *                                                                *
      *   OBJECTIF  : Vérifie si l'année est bissextile                *
      *                                                                *
      ******************************************************************       
       
       IDENTIFICATION DIVISION.
       PROGRAM-ID. BISXTLE.
       AUTHOR. Pierre.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

      *    Année à vérifier
       01  ANNEE PIC 9(04).
      *    Indicateur pour savoir si l'année est bissextile
       01  BISSEXTILE PIC X(03) VALUE 'NON'.

       PROCEDURE DIVISION.

           DISPLAY "Veuillez entrer une année : "
           ACCEPT ANNEE

      *    Vérifie si l'année est bissextile
           IF FUNCTION MOD(ANNEE, 4) = 0 AND 
              (FUNCTION MOD(ANNEE, 100) <> 0 OR 
               FUNCTION MOD(ANNEE, 400) = 0)
               MOVE 'OUI' TO BISSEXTILE
           END-IF

      *    Affiche le résultat
           DISPLAY "L'année " ANNEE " est-elle bissextile? " BISSEXTILE

           STOP RUN.
