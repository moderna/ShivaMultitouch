--------------------------------------------------------------------------------
--  Handler.......... : onFingerMoved
--  Author........... : Gerold Meisinger (Modern Alchemists OG)
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MultitouchDemo.onFingerMoved( sName, nX, nY, nDX, nDY )
--------------------------------------------------------------------------------

    if( this._DEBUG() ) then log.message( string.format( "onFingerMoved( sName='%s', nX=%+0.2f, nY=%+0.2f, nDX=%+0.4f, nDY=%+0.4f )", sName, nX, nY, nDX, nDY ) ) end

    local hCmp = hud.getComponent( this.getUser(), "MultitouchDemo." .. sName )
    if( hCmp ~= nil ) then
        local hudX = math.clamp( (nX + 1) / 2 * 100, 0, 100 )
        local hudY = math.clamp( (nY + 1) / 2 * 100, 0, 100 )
        
        if    ( sName == "SliderBtn0" ) then
            hud.setComponentPosition( hCmp, 50, hudY )
            this.clrR( (nY + 1) / 2 * 127 )
        elseif( sName == "SliderBtn1" ) then
            hud.setComponentPosition( hCmp, 50, hudY )
            this.clrG( (nY + 1) / 2 * 127 )
        elseif( sName == "SliderBtn2" ) then
            hud.setComponentPosition( hCmp, 50, hudY )
            this.clrB( (nY + 1) / 2 * 127 )
        elseif( string.findFirst( sName, "FingerCtn", 0 ) > -1 ) then
            if( hCmp ~= nil ) then
                hud.setComponentPosition( hCmp, hudX, hudY )
                hud.setComponentVisible ( hCmp, true )
            end
        end
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
