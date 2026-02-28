//AIDENY   JOB (ACCT),'DENIAL ENGINE',
//             CLASS=A,MSGCLASS=H,MSGLEVEL=(1,1),
//             NOTIFY=&SYSUID,
//             REGION=0M
//*================================================================*
//* JCL: COMPILE, LINK, AND EXECUTE AIDENY.CBL                     *
//* TARGET: IBM Z8 WITH ENTERPRISE COBOL V6.4+                     *
//*                                                                 *
//* STEP1: COMPILE WITH OPT(2) FOR MAXIMUM DENIAL THROUGHPUT        *
//* STEP2: LINK-EDIT INTO LOAD MODULE                               *
//* STEP3: EXECUTE THE CIRCULAR REASONING ENGINE                    *
//*================================================================*
//*
//COBCOMP  EXEC PGM=IGYCRCTL,
//             PARM=('OPT(2)',
//             'LIST,MAP,XREF',
//             'RENT',
//             'APOST',
//             'DBCS',
//             'LP(64)',
//             'ARCH(13)')
//*-------------------------------------------------------------*
//* ARCH(13) = IBM Z8 EXPLOITATION                               *
//* LP(64)   = 64-BIT ADDRESSING FOR LARGE DENIAL TABLES         *
//* OPT(2)   = AGGRESSIVE OPTIMIZATION OF CIRCULAR LOGIC         *
//*-------------------------------------------------------------*
//STEPLIB  DD DSN=IGY.V6R4M0.SIGYCOMP,DISP=SHR
//SYSIN    DD DSN=&SYSUID..COBOL.SRC(AIDENY),DISP=SHR
//SYSPRINT DD SYSOUT=*
//SYSLIN   DD DSN=&&OBJMOD,DISP=(MOD,PASS),
//             UNIT=SYSDA,SPACE=(TRK,(5,5))
//SYSUT1   DD UNIT=SYSDA,SPACE=(CYL,(1,1))
//SYSUT2   DD UNIT=SYSDA,SPACE=(CYL,(1,1))
//SYSUT3   DD UNIT=SYSDA,SPACE=(CYL,(1,1))
//SYSUT4   DD UNIT=SYSDA,SPACE=(CYL,(1,1))
//SYSUT5   DD UNIT=SYSDA,SPACE=(CYL,(1,1))
//SYSUT6   DD UNIT=SYSDA,SPACE=(CYL,(1,1))
//SYSUT7   DD UNIT=SYSDA,SPACE=(CYL,(1,1))
//*
//LKED     EXEC PGM=IEWBLINK,COND=(4,LT,COBCOMP),
//             PARM='LIST,MAP,XREF,RENT,AMODE=64,RMODE=64'
//SYSLIB   DD DSN=CEE.SCEELKED,DISP=SHR
//SYSLIN   DD DSN=&&OBJMOD,DISP=(OLD,DELETE)
//SYSLMOD  DD DSN=&SYSUID..LOAD(AIDENY),DISP=SHR
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD UNIT=SYSDA,SPACE=(CYL,(1,1))
//*
//RUN      EXEC PGM=AIDENY,COND=(4,LT,LKED)
//STEPLIB  DD DSN=&SYSUID..LOAD,DISP=SHR
//         DD DSN=CEE.SCEERUN,DISP=SHR
//         DD DSN=CEE.SCEERUN2,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SYSPRINT DD SYSOUT=*
//CEEDUMP  DD SYSOUT=*
//CEEOPTS  DD *
POSIX(ON),
HEAPCHK(ON,1,0,1,0,1024,0,L,FREE)
/*
//*================================================================*
//* EXPECTED RC: 0000                                               *
//* EXPECTED OUTPUT: INFINITE LOOP OF DENIAL (CAPPED AT 5 CYCLES)  *
//* EXPECTED CONCLUSION: NONE (BY DESIGN)                           *
//*================================================================*
