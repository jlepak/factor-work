! Copyright (C) 2011 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: accessors colors kernel namespaces opengl opengl.capabilities opengl.gl
ui ui.gadgets.worlds ui.gestures ui.pixel-formats ui.render
gadget-test ;

IN: world-test

TUPLE: world-test < world ;

M: world-test begin-world
    GL_PROJECTION glMatrixMode
    glLoadIdentity
    0 500 500 0 0 1 glOrtho
    GL_MODELVIEW glMatrixMode
    GL_DEPTH_TEST glDisable
    1.0 1.0 1.0 1.0 glClearColor 
    { "GL_EXT_framebuffer_object" } require-gl-extensions
    init-gl
    ; 

M: world-test draw-world*
    init-matrices
    [ init-clip ] [
        background-color>> >rgba-components glClearColor
        ! GL_COLOR_BUFFER_BIT glClear
    ] bi

    0 0 1 1 <rgba> gl-color
    { 0 0 } hand-loc get gl-line
    { 100 100 } { 200 200 } gl-rect
    ;

MAIN-WINDOW: jal-window {
    { world-class world-test }
    { title "World test" }
    { pixel-format-attributes {
        windowed
        ! double-buffered
        T{ depth-bits { value 16 } }
    } }
    { pref-dim { 500 500 } }
}
<canvas-gadget> >>gadgets
;
