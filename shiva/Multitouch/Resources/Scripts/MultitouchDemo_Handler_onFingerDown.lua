--------------------------------------------------------------------------------
--  Handler.......... : onFingerDown
--  Author........... : Gerold Meisinger (Modern Alchemists OG)
--  Description...... :
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MultitouchDemo.onFingerDown( nX, nY )
--------------------------------------------------------------------------------

    local ret = ""

    hud.setCursorPosition( this.getUser(), (nX + 1) / 2 * 100, (nY + 1) / 2 * 100 )
    local hCmp = hud.getUnderCursorComponent( this.getUser() )
    if( hCmp ~= nil and hud.getComponentType( hCmp ) == hud.kComponentTypeButton ) then
        hud.setComponentBackgroundColor( hCmp, 127, 127, 127, 255 )

        local tag = hud.getComponentTag( hCmp )
        local tagParts = table.newInstance()
        string.explode( tag, tagParts, "." )
        ret = table.getLast( tagParts )
    else
        for i = 0, this._FINGERS_N() - 1 do
            local name = string.format( "FingerCtn%d", i )
            if( not hashtable.contains( this.fingers(), name ) ) then
                hashtable.add( this.fingers(), name, nil )
                ret = name
                break
            end
        end

        hCmp = hud.getComponent( this.getUser(), "MultitouchDemo." .. ret )
        if( hCmp ~= nil ) then
            hud.setComponentVisible( hCmp, true )
        end
    end

    if( this._DEBUG() ) then log.message( string.format( "onFingerDown( nX=%+0.2f, nY=%+0.2f ) => %s", nX, nY, ret ) ) end

    user.setAIVariable( this.getUser(), "Multitouch", "fingerName", ret )

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
