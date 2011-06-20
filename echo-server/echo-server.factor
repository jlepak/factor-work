! Copyright (C) 2011 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: accessors sequences io io.encodings.ascii io.servers.connection ;
IN: echo-server

: handle ( -- ) "echo: " readln append print ;

: <echo-server> ( -- echo-server )
    ascii <threaded-server> "echo-server" >>name
        8080 >>insecure [ handle ] >>handler ;
