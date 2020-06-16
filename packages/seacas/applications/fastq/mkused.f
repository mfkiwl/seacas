C    Copyright(C) 1999-2020 National Technology & Engineering Solutions
C    of Sandia, LLC (NTESS).  Under the terms of Contract DE-NA0003525 with
C    NTESS, the U.S. Government retains certain rights in this software.
C    
C    See packages/seacas/LICENSE for details

C
C
C
      SUBROUTINE MKUSED (MXNL, MP, ML, LISTL, IPOINT, NINT, LINKP,
     &   LINKL, LCON, NL)
C***********************************************************************
C
C  SUBROUTINE MKUSED = MARKS ALL LINES AND POINTS USED IN THE PERIMETER
C
C***********************************************************************
C
C  NOTE:
C     THE MESH TABLES ARE EFFECTIVELY DESTROYED BY THIS ROUTINE
C
C***********************************************************************
C
      DIMENSION LISTL (MXNL), IPOINT (MP), NINT (ML)
      DIMENSION LINKP (2, MP), LINKL (2, ML)
      DIMENSION LCON (3, ML)
C
      LOGICAL ADDLNK
C
      ADDLNK = .FALSE.
C
C  FLAG ALL LINES AND POINTS AS BEING USED
C
      DO 100 I = 1, NL
         CALL LTSORT (ML, LINKL, LISTL (I), IL, ADDLNK)
         NINT (IL) =  - IABS (NINT (IL))
         CALL LTSORT (MP, LINKP, LCON (1, IL), IP1, ADDLNK)
         CALL LTSORT (MP, LINKP, LCON (2, IL), IP2, ADDLNK)
         IPOINT (IP1) =  - IABS (IPOINT (IP1))
         IPOINT (IP2) =  - IABS (IPOINT (IP2))
  100 CONTINUE
C
      RETURN
C
      END
