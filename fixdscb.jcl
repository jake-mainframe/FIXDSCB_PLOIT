//FIXDSCB  JOB (TSO),
//             'RUN FIXDSCB',
//             CLASS=A,
//             MSGCLASS=A,
//             MSGLEVEL=(1,1),
//             REGION=0K
//FIXDSCB    EXEC PGM=FIXDSCB
//SYSPRINT DD   SYSOUT=A
//STEPLIB  DD   DISP=SHR,DSN=SYSC.LINKLIB
//SYSIN    DD   DISP=SHR,DSN=IBMUSER.FIX32760
//SYSUDUMP DD   SYSOUT=A