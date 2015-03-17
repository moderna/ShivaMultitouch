--------------------------------------------------------------------------------
--  Handler.......... : onFingerUp
--  Author........... : Gerold Meisinger (Modern Alchemists OG)
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MultitouchDemo.onFingerUp( sName, nX, nY )
--------------------------------------------------------------------------------
	
    if( this._DEBUG() ) then log.message( string.format( "onFingerUp( sName='%s', nX=%+0.2f, nY=%+0.2f )", sName, nX, nY ) ) end

    hashtable.remove( this.fingers(), sName )

    local hCmp = hud.getComponent( this.getUser(), "MultitouchDemo." .. sName )
    if( hCmp ~= nil ) then
        if    ( sName == "SliderBtn0" ) then
            hud.setComponentBackgroundColor( hCmp,   0,   0,   0, 255 )
        elseif( sName == "SliderBtn1" ) then
            hud.setComponentBackgroundColor( hCmp,   0,   0,   0, 255 )
        elseif( sName == "SliderBtn2" ) then
            hud.setComponentBackgroundColor( hCmp,   0,   0,   0, 255 )            
        elseif( string.findFirst( sName, "FingerCtn", 0 ) > -1 ) then
            hud.setComponentVisible( hCmp, false )
        end
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
