--------------------------------------------------------------------------------
--  Function......... : getFingerInfo
--  Author........... :
--  Description...... :
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function Multitouch.getFingerInfo( tFingerInfo )
--------------------------------------------------------------------------------

    local TAP_IDX     = 1
    local FINGER_NAME = 2
    local FINGER_X    = 3
    local FINGER_Y    = 4

    local tapIdx     = table.getAt( tFingerInfo, TAP_IDX     )
    local fingerName = table.getAt( tFingerInfo, FINGER_NAME )
    local fingerX    = table.getAt( tFingerInfo, FINGER_X    )
    local fingerY    = table.getAt( tFingerInfo, FINGER_Y    )

    return tapIdx, fingerName, fingerX, fingerY

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
