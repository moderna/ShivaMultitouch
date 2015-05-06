--------------------------------------------------------------------------------
--  Handler.......... : onMouseButtonDown
--  Author........... : Gerold Meisinger (Modern Alchemists OG)
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MultitouchEmulation.onMouseButtonDown( nButton, nPointX, nPointY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------

    if( this.mouseEnabled() ) then
        if( this._DEBUG() ) then log.message( string.format( "MultitouchEmulation.onMouseButtonDown( nButton=%d )", nButton ) ) end

        if( nButton == 0 ) then
            this.mouseChanged( true )
            this.mouseX( nPointX )
            this.mouseY( nPointY )

            local fingers = user.getAIVariable( this.getUser(), "Multitouch", "fingers" )
            if( hashtable.getSize( fingers ) == 0 ) then
                user.sendEventImmediate( this.getUser(), this.sAiModel(), "onTouchSequenceBegin" )        
            end
            this.mouseTapIdx( hashtable.getSize( fingers ) )
        end
    end
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
