        !COMPILER-GENERATED INTERFACE MODULE: Fri Jan 17 15:50:38 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE CLRSKY_RAD__genmod
          INTERFACE 
            SUBROUTINE CLRSKY_RAD(MONTH,DAY,HOUR,DT,SLOPE,AZI,LAT,HRI,  &
     &COSZEN)
              INTEGER(KIND=4), INTENT(IN) :: MONTH
              INTEGER(KIND=4), INTENT(IN) :: DAY
              REAL(KIND=8), INTENT(IN) :: HOUR
              REAL(KIND=8), INTENT(IN) :: DT
              REAL(KIND=8), INTENT(IN) :: SLOPE
              REAL(KIND=8), INTENT(IN) :: AZI
              REAL(KIND=8), INTENT(IN) :: LAT
              REAL(KIND=8), INTENT(OUT) :: HRI
              REAL(KIND=8), INTENT(OUT) :: COSZEN
            END SUBROUTINE CLRSKY_RAD
          END INTERFACE 
        END MODULE CLRSKY_RAD__genmod
