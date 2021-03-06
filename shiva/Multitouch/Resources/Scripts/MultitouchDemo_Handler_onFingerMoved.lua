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
            
            if( sName == "FingerCtn0" ) then
                -- If the delta gets to large we ignore the movement.
                -- This handles the special case if the fingers are changed to fast on a low frequency multitouch device
                -- as the new fingers would be detected as the old fingers and the delta becomes very large => camera jumps.
                -- Note that the range is -1..+1 thus 20% are a tenth of screen, which is still >1cm on most devices.
                if( math.abs( nDX ) < 0.2 and math.abs( nDY ) < 0.2 ) then
                    this.camRotX( this.camRotX() + nDY * 50 )
                    this.camRotY( this.camRotY() - nDX * 50 )
                end
            end
        end
    end

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
