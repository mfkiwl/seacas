C Copyright(C) 1999-2020 National Technology & Engineering Solutions
C of Sandia, LLC (NTESS).  Under the terms of Contract DE-NA0003525 with
C NTESS, the U.S. Government retains certain rights in this software.
C 
C See packages/seacas/LICENSE for details

C
C=======================================================================
      LOGICAL FUNCTION LXGTCH(CH1,CH)
      IMPLICIT INTEGER (A-Z)
      CHARACTER*504 ILINE
      COMMON /LXCOM1/ILINE
      COMMON /LXCOM2/JLINE,LXINIT
      CHARACTER*(*) CH1,CH

      L = LEN(CH1)
      IF (CH1.EQ.ILINE(JLINE:JLINE+L-1)) THEN
         JLINE = JLINE + L
         CH = ILINE(JLINE:JLINE)
         LXGTCH = .TRUE.
         RETURN

      END IF

      CH = ILINE(JLINE:JLINE)
      LXGTCH = .FALSE.
      RETURN

      END
