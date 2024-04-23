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
      *    Pour stocker la réponse de l'utilisateur (Oui/Non)
       01  ANS PIC X(01).

       PROCEDURE DIVISION.

           PERFORM UNTIL ANS = 'N'
               DISPLAY "Veuillez entrer une année : "
               WITH NO ADVANCING
               ACCEPT ANNEE

      *    Vérifie si l'année est bissextile
               IF FUNCTION MOD(ANNEE, 4) = 0 AND 
                  (FUNCTION MOD(ANNEE, 100) <> 0 OR 
                   FUNCTION MOD(ANNEE, 400) = 0)
                   MOVE 'OUI' TO BISSEXTILE
               ELSE
                   MOVE 'NON' TO BISSEXTILE
               END-IF

      *    Affiche le résultat
           DISPLAY "L'année " ANNEE " est-elle bissextile? " BISSEXTILE

               DISPLAY "Voulez-vous vérifier une autre année? (Y/N): "
               WITH NO ADVANCING
               ACCEPT ANS
               MOVE FUNCTION UPPER-CASE(ANS) TO ANS
           END-PERFORM

           STOP RUN.

