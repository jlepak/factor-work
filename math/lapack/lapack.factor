! Copyright (C) 2011 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: math.lapack.ffi math.blas.matrices math.blas.vectors ;
IN: math.lapack

: cholesky ( a -- b )
