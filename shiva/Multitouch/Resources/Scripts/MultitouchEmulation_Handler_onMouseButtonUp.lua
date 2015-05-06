--------------------------------------------------------------------------------
--  Handler.......... : onMouseButtonUp
--  Author........... : Gerold Meisinger (Modern Alchemists OG)
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MultitouchEmulation.onMouseButtonUp( nButton, nPointX, nPointY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------
	
    if( this.mouseEnabled() ) then
        if( this._DEBUG() ) then log.message( string.format( "MultitouchEmulation.onMouseButtonUp( nButton=%d )", nButton ) ) end

        if( nButton == 0 ) then
            this.mouseChanged( true )

            local fingers = user.getAIVariable( this.getUser(), "Multitouch", "fingers" )
            if( hashtable.getSize( fingers ) == 1 ) then
                user.sendEventImmediate( this.getUser(), this.sAiModel(), "onTouchSequenceEnd" )
            end
            this.mouseTapIdx( -1 )
        end
    end
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
