! Copyright (C) 2011 Your name.
! See http://factorcode.org/license.txt for BSD license.

USING: accessors arrays calendar calendar.format colors io io.streams.string
kernel namespaces opengl prettyprint sequences timers ui ui.gadgets
ui.gadgets.status-bar ui.gadgets.worlds ui.gestures ui.render ;

IN: gadget-test

TUPLE: canvas-gadget < gadget { timer } ;

: <canvas-gadget> ( -- gadget )
    canvas-gadget new ;

M: canvas-gadget pref-dim* drop { 200 400 } ;

: update-status ( gadget -- )
    now timestamp>string
    [ hand-loc get . ] with-string-writer
    2array concat
    swap show-status ;

M: canvas-gadget draw-gadget* ( gadget -- )
    0 0 1 1 <rgba> gl-color
    { 0 0 } hand-loc get gl-line
    update-status ;

canvas-gadget H{
    { T{ button-down f f 1 }     [ request-focus ] }
    { T{ key-down f f "UP" }     [ drop "UP" print ] }
} set-gestures

: tick ( gadget -- )
    relayout-1 ;

M: canvas-gadget graft* ( gadget -- )
    [ [ tick ] curry 10 milliseconds every ] keep timer<< ;

M: canvas-gadget ungraft* ( gadget -- )
    [ stop-timer f ] change-timer drop ;

: canvas-window ( -- ) 
    [ <canvas-gadget> "Canvas" open-status-window ] with-ui ;

MAIN: canvas-window
