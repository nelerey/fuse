        !COMPILER-GENERATED INTERFACE MODULE: Fri Jan 17 15:50:35 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE LUDCMP__genmod
          INTERFACE 
            SUBROUTINE LUDCMP(A,INDX,D)
              REAL(KIND=8), INTENT(INOUT) :: A(:,:)
              INTEGER(KIND=4), INTENT(OUT) :: INDX(:)
              REAL(KIND=8), INTENT(OUT) :: D
            END SUBROUTINE LUDCMP
          END INTERFACE 
        END MODULE LUDCMP__genmod
