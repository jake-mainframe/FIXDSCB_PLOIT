//FIXHAPPY  JOB (TSO),
//             'RUN FIXDSCB HAPPY',
//             CLASS=A,
//             MSGCLASS=A,
//             MSGLEVEL=(1,1),
//             REGION=0K
//FIXDSCB    EXEC PGM=FIXDSCB
//SYSPRINT DD   SYSOUT=A
//STEPLIB  DD   DISP=SHR,DSN=SYSC.LINKLIB
//SYSIN    DD   *
EXTEND  VOLUME=MVSRES,DSNAME=SYS1.LINKLIB
//*
