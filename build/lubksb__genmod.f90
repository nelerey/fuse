        !COMPILER-GENERATED INTERFACE MODULE: Fri Jan 17 15:50:35 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE LUBKSB__genmod
          INTERFACE 
            SUBROUTINE LUBKSB(A,INDX,B)
              REAL(KIND=8), INTENT(IN) :: A(:,:)
              INTEGER(KIND=4), INTENT(IN) :: INDX(:)
              REAL(KIND=8), INTENT(INOUT) :: B(:)
            END SUBROUTINE LUBKSB
          END INTERFACE 
        END MODULE LUBKSB__genmod
