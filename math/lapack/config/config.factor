! Copyright (C) 2011 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: alien.fortran combinators kernel namespaces system ;
IN: math.lapack.config

SYMBOLS: lapack-library lapack-fortran-abi deploy-lapack? ;

lapack-library [
    {
        { [ os macosx?  ] [ "liblapack.dylib" ] }
        { [ os windows? ] [ "lapack.dll"      ] }
        [ "liblapack.so" ]
    } cond
] initialize

lapack-fortran-abi [
    {
        { [ os macosx?                  ] [ intel-unix-abi ] }
        { [ os windows? cpu x86.32? and ] [ f2c-abi        ] }
        { [ os windows? cpu x86.64? and ] [ gfortran-abi   ] }
        { [ os freebsd?                 ] [ gfortran-abi   ] }
        { [ os linux?                   ] [ gfortran-abi   ] }
        [ f2c-abi ]
    } cond
] initialize

deploy-lapack? [ os macosx? not ] initialize
