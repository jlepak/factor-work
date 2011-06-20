! Copyright (C) 2011 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: kernel strings sequences math.ranges random db.tuples db.types ;
IN: dbtest

TUPLE: exam id name score ;

exam "EXAM"    {
    { "id" "ID" +db-assigned-id+ }
    { "name" "NAME" TEXT }
    { "score" "SCORE" INTEGER }
} define-persistent

: random-exam ( -- exam )
        f
        6 [ CHAR: a CHAR: z [a,b] random ] replicate >string
        100 [0,b] random
    exam boa ; 
