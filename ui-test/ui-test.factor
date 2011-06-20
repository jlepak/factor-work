! Copyright (C) 2011 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: accessors kernel ui ui.gadgets ui.gadgets.buttons ui.gadgets.labels
ui.gadgets.packs ui.gadgets.worlds ;
IN: ui-test

: hello ( -- )
    [
        f
        T{ world-attributes { title "Hi" } }
        clone
        <pile>
        "Hello world" <label> add-gadget
        "button" [ drop beep ] <border-button> "TT" >>tooltip add-gadget
        >>gadgets
        open-window
    ] with-ui ;
