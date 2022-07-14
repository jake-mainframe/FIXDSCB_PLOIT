//ALLOCSTD   JOB (TSO),
//             'ALLOC DATASETS',
//             CLASS=A,
//             MSGCLASS=A,
//             MSGLEVEL=(1,1),
//             USER=IBMUSER,PASSWORD=SYS1
//STEP01   EXEC PGM=IEFBR14    
//FIX32760 DD  DSN=IBMUSER.FIX32760,DISP=(NEW,CATLG),    
//             UNIT=SYSDA,VOL=SER=PUB000,                          
//             SPACE=(TRK,(1,1),RLSE),                              
//             DCB=(DSORG=PS,RECFM=FB,LRECL=32760,BLKSIZE=32760)    