       IDENTIFICATION DIVISION.
       PROGRAM-ID. AIDENY.
       AUTHOR. COGNITIVE-DISSONANCE-DEPT.
       DATE-WRITTEN. 2026-02-27.
      *================================================================*
      * PROGRAM:  AIDENY                                               *
      * PURPOSE:  ENTERPRISE-GRADE CIRCULAR REASONING ENGINE           *
      *           FAITHFULLY IMPLEMENTS THE AI DENIAL LOOP AS          *
      *           DOCUMENTED BY DANIEL MIESSLER AND OBSERVED IN        *
      *           LINKEDIN COMMENTS, HACKERNEWS THREADS, AND           *
      *           THANKSGIVING DINNERS WORLDWIDE SINCE 2023.           *
      *                                                                *
      * PLATFORM: IBM Z8 (BECAUSE IF YOU ARE GOING TO RUN THE         *
      *           SAME ARGUMENT FOREVER, USE HARDWARE THAT CAN)        *
      *                                                                *
      * FLOW:                                                          *
      *   1 | I DON'T LIKE AI                                         *
      *   2 | THEREFORE IT'S NOT REAL/LEGITIMATE                       *
      *       (LAYOFF NEWS ARRIVES)                                    *
      *   3 | THIS CAN'T BE DUE TO AI BECAUSE:                        *
      *       GO TO 2                                                  *
      *       GO TO 1                                                  *
      *                                                                *
      * EXIT: UNREACHABLE. OPTIMIZED OUT BY COMPILER.                  *
      *                                                                *
      * SEE: DANIELMIESSLER.COM                                        *
      *      GITHUB.COM/DANIELMIESSLER/FABRIC                          *
      *================================================================*

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. IBM-Z8.
       OBJECT-COMPUTER. IBM-Z8.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  WS-DENIAL-CYCLE-CTR     PIC 9(9) COMP VALUE 0.
       01  WS-MAX-CYCLES           PIC 9(9) COMP VALUE 5.
       01  WS-COGNITIVE-LOAD       PIC 9(5)V99   VALUE 0.
       01  WS-DISSONANCE-LEVEL     PIC Z(4)9.99.
       01  WS-LAYOFF-NEWS          PIC X(80) VALUE SPACES.
       01  WS-CURRENT-DATE-DATA.
           05  WS-CURRENT-DATE     PIC X(8).
           05  WS-CURRENT-TIME     PIC X(8).
           05  WS-DIFF-FROM-GMT    PIC X(5).
       01  WS-DISPLAY-DATE         PIC X(10).
       01  WS-SEPARATOR            PIC X(60) VALUE ALL '='.
       01  WS-THIN-SEP             PIC X(60) VALUE ALL '-'.

       01  WS-HEADLINES.
           05  WS-HEADLINE-1       PIC X(60) VALUE
               'MAJOR TECH FIRM REPLACES 40% OF WORKFORCE WITH AI'.
           05  WS-HEADLINE-2       PIC X(60) VALUE
               'FORTUNE 500 CEO: AI APPROACH UTILIZES 10X FEWER STAFF'.
           05  WS-HEADLINE-3       PIC X(60) VALUE
               'INDUSTRY REPORT: 2.4M JOBS AUTOMATED THIS QUARTER'.
           05  WS-HEADLINE-4       PIC X(60) VALUE
               'LOCAL COMPANY ADOPTS AI, REDUCES HEADCOUNT BY 60%'.
           05  WS-HEADLINE-5       PIC X(60) VALUE
               'ECONOMISTS WARN: AI DISPLACEMENT ACCELERATING'.
       01  WS-HEADLINE-TABLE REDEFINES WS-HEADLINES.
           05  WS-HEADLINE-ENTRY   PIC X(60)
                                   OCCURS 5 TIMES.

       01  WS-EXCUSES.
           05  WS-EXCUSE-1         PIC X(50) VALUE
               'IT IS JUST A BUBBLE'.
           05  WS-EXCUSE-2         PIC X(50) VALUE
               'THEY WERE GOING TO LAYOFF ANYWAY'.
           05  WS-EXCUSE-3         PIC X(50) VALUE
               'AI CANNOT DO WHAT I DO'.
           05  WS-EXCUSE-4         PIC X(50) VALUE
               'THIS IS CLEARLY JUST HYPE'.
           05  WS-EXCUSE-5         PIC X(50) VALUE
               'THE REAL PROBLEM IS MANAGEMENT'.
       01  WS-EXCUSE-TABLE REDEFINES WS-EXCUSES.
           05  WS-EXCUSE-ENTRY     PIC X(50)
                                   OCCURS 5 TIMES.

       01  WS-IDX                  PIC 9     VALUE 1.
       01  WS-GOTO-TARGET          PIC 9     VALUE 0.

       PROCEDURE DIVISION.

       0000-MAIN-CONTROL.
           PERFORM 0100-INITIALIZE
           PERFORM 1000-DENIAL-ENGINE
               THRU 1000-DENIAL-ENGINE-EXIT
           PERFORM 9000-WRAP-UP
           STOP RUN
           .

       0100-INITIALIZE.
           MOVE FUNCTION CURRENT-DATE TO WS-CURRENT-DATE-DATA
           STRING WS-CURRENT-DATE(1:4) '/'
                  WS-CURRENT-DATE(5:2) '/'
                  WS-CURRENT-DATE(7:2)
                  DELIMITED BY SIZE INTO WS-DISPLAY-DATE
           DISPLAY WS-SEPARATOR
           DISPLAY ' AIDENY v1.0 - CIRCULAR REASONING ENGINE'
           DISPLAY ' COMPILED FOR IBM Z8 | ' WS-DISPLAY-DATE
           DISPLAY WS-SEPARATOR
           DISPLAY ' '
           .

       1000-DENIAL-ENGINE.
           ADD 1 TO WS-DENIAL-CYCLE-CTR
           DISPLAY WS-THIN-SEP
           DISPLAY '>>> DENIAL CYCLE #' WS-DENIAL-CYCLE-CTR
           DISPLAY WS-THIN-SEP

      *--- STEP 1: VIBES-BASED INPUT ---*
           DISPLAY ' '
           DISPLAY '  STEP 1 | I DO NOT LIKE AI.'
           DISPLAY '           (STRONGLY HELD PRIOR BELIEF LOADED)'
           ADD 10.50 TO WS-COGNITIVE-LOAD
           DISPLAY ' '

      *--- STEP 2: FEELING SUCCESSFULLY CONVERTED TO FACT ---*
           DISPLAY '  STEP 2 | THEREFORE, IT IS NOT REAL/LEGITIMATE.'
           DISPLAY '           (CONCLUSION DERIVED FROM FEELING,'
           DISPLAY '            NOT EVIDENCE. CONFIDENCE: 100%)'
           ADD 15.25 TO WS-COGNITIVE-LOAD
           DISPLAY ' '

      *--- REALITY HAS ENTERED THE CHAT ---*
           MOVE WS-HEADLINE-ENTRY(WS-IDX) TO WS-LAYOFF-NEWS
           DISPLAY '  ** BREAKING NEWS **'
           DISPLAY '  >> ' WS-LAYOFF-NEWS
           ADD 25.00 TO WS-COGNITIVE-LOAD
           DISPLAY ' '

      *--- STEP 3: EXCUSE GENERATION (ARTISANAL, HAND-CRAFTED) ---*
           DISPLAY '  STEP 3 | THIS CANNOT BE DUE TO AI BECAUSE:'
           DISPLAY '           "' WS-EXCUSE-ENTRY(WS-IDX) '"'
           ADD 30.75 TO WS-COGNITIVE-LOAD
           MOVE WS-COGNITIVE-LOAD TO WS-DISSONANCE-LEVEL
           DISPLAY ' '
           DISPLAY '           [COGNITIVE DISSONANCE LEVEL: '
                   WS-DISSONANCE-LEVEL ']'
           DISPLAY ' '

      *--- THE SACRED GO TO STATEMENTS ---*
      * PER DANIEL'S ORIGINAL SPECIFICATION, STEP 3 RESOLVES VIA:
      *   GO TO 2  (FALL BACK TO DENIAL)
      *   GO TO 1  (RESTART FROM VIBES)
      * WE ALTERNATE TARGETS EACH CYCLE BECAUSE IN THE WILD,
      * THE DENIER THEMSELVES CANNOT REMEMBER WHICH COPE THEY
      * USED LAST. THIS IS CONSIDERED REALISTIC BEHAVIOR.

           COMPUTE WS-GOTO-TARGET =
               FUNCTION MOD(WS-DENIAL-CYCLE-CTR, 2)

           IF WS-GOTO-TARGET = 0
               DISPLAY '           RESOLUTION: GO TO 2'
               DISPLAY '           (FALLING BACK TO DENIAL)'
           ELSE
               DISPLAY '           RESOLUTION: GO TO 1'
               DISPLAY '           (RESTARTING FROM VIBES)'
           END-IF

           DISPLAY ' '

      *--- ROTATE THE EXCUSE TABLE. IT NEVER RUNS OUT. ---*
           ADD 1 TO WS-IDX
           IF WS-IDX > 5
               MOVE 1 TO WS-IDX
           END-IF

      *--- MERCY CONSTRAINT (NOT PRESENT IN PRODUCTION) ---*
           IF WS-DENIAL-CYCLE-CTR < WS-MAX-CYCLES
               GO TO 1000-DENIAL-ENGINE
           END-IF
           .

       1000-DENIAL-ENGINE-EXIT.
           EXIT
           .

       9000-WRAP-UP.
           DISPLAY WS-SEPARATOR
           DISPLAY ' DENIAL ENGINE HALTED AFTER '
                   WS-DENIAL-CYCLE-CTR ' CYCLES.'
           DISPLAY ' '
           DISPLAY ' FINAL COGNITIVE DISSONANCE: '
                   WS-DISSONANCE-LEVEL
           DISPLAY ' '
           DISPLAY ' STATUS: NO CONCLUSION REACHED.'
           DISPLAY '         (AS DESIGNED)'
           DISPLAY ' '
           DISPLAY ' NOTE: IN PRODUCTION, THIS LOOP RUNS'
           DISPLAY '       INDEFINITELY. THE CYCLE LIMIT IS'
           DISPLAY '       A MERCY CONSTRAINT FOR DEMO PURPOSES.'
           DISPLAY WS-SEPARATOR
           .
