      ******************************************************************
      *                                                                *
      *   OBJECTIVE: Check if the year is a leap year                  *
      *                                                                *
      ******************************************************************       

       IDENTIFICATION DIVISION.
       PROGRAM-ID. BISXTLE.
       AUTHOR. Pierre.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

      *    Year to check
       01  YEAR PIC 9(04).
      *    Indicator to know if the year is a leap year
       01  LEAPYEAR PIC X(03) VALUE 'NO'.
      *    To store the user's response (Yes/No)
       01  ANSWER PIC X(01).

       PROCEDURE DIVISION.

           PERFORM UNTIL ANSWER = 'N'
               DISPLAY "Please enter a year: "
               WITH NO ADVANCING
               ACCEPT YEAR

      *    Check if the year is a leap year
               IF FUNCTION MOD(YEAR, 4) = 0 AND 
                  (FUNCTION MOD(YEAR, 100) <> 0 OR 
                   FUNCTION MOD(YEAR, 400) = 0)
                   MOVE 'YES' TO LEAPYEAR
               ELSE
                   MOVE 'NO' TO LEAPYEAR
               END-IF

      *    Display the result
               DISPLAY "Is the year " YEAR " a leap year? " LEAPYEAR

               DISPLAY "Do you want to check another year? (Y/N): "
               WITH NO ADVANCING
               ACCEPT ANSWER
               MOVE FUNCTION UPPER-CASE(ANSWER) TO ANSWER
           END-PERFORM

           STOP RUN.
