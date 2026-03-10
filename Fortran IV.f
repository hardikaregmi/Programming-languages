!     Program: Student Test Score Analyzer
!     Description: This program reads test scores and prints the list, the average, the highest and lowest scores, and how many pass/fail.
!     Requirements: Standard Fortran IV compiler
!     Data:
!     SCORES - stores up to 20 test scores entered by the user
!     N      - number of scores the user wants to enter
!     SUM    - keeps a running total of all the scores
!     AVG    - the calculated average of the scores
!     HIGH   - highest score found in the list
!     LOW    - lowest score found in the list
!     PASS   - counts how many scores are 60 or higher
!     FAIL   - counts how many scores are below 60

      PROGRAM PROG1

      INTEGER SCORES(20), N, HIGH, LOW, PASS, FAIL, SUM, I
      REAL AVG

!     this finds out how many scores we are dealing with
      WRITE(6,*) 'Enter Number of Scores:'
      READ(5,*) N

!     this will let us type in each individual score
      DO 10 I = 1, N
         WRITE(6,*) 'Enter Score #', I
         READ(5,*) SCORES(I)
   10 CONTINUE

!     this assigns the variables
      SUM = 0
      HIGH = SCORES(1)
      LOW = SCORES(1)
      PASS = 0
      FAIL = 0

!     this calculates totals and checks for high/low scores
      DO 30 I = 1, N
         SUM = SUM + SCORES(I)

         IF (SCORES(I) .GT. HIGH) HIGH = SCORES(I)
         IF (SCORES(I) .LT. LOW)  LOW  = SCORES(I)

         IF (SCORES(I) .GE. 60) THEN
            PASS = PASS + 1
         ELSE
            FAIL = FAIL + 1
         ENDIF
   30 CONTINUE

!     this prints the scores
      WRITE(6,*) 'SCORES:'
      DO 20 I = 1, N
         WRITE(6,*) SCORES(I)
   20 CONTINUE

!     this calculates the class average
      AVG = FLOAT(SUM) / FLOAT(N)

!     this prints out the final results in a list
      WRITE(6,*) 'AVERAGE = ', AVG
      WRITE(6,*) 'HIGHEST = ', HIGH
      WRITE(6,*) 'LOWEST = ', LOW
      WRITE(6,*) 'PASSING = ', PASS
      WRITE(6,*) 'FAILING = ', FAIL

      END
