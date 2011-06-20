! Copyright (C) 2011 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: hashtables strings ;
IN: grades

TUPLE: gradebook students info groups ;
TUPLE: student { name string } { grades hashtable } ;
TUPLE: group { members vector } ;
TUPLE: assignment { max integer } { desc string } ;
TUPLE: hw { type assignment } { score integer } ;

SYMBOL: grades
grades gradebook new set

: add-student ( -- student ) student new [ grades get adjoin ] keep
