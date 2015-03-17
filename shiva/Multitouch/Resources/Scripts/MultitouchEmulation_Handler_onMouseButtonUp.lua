--------------------------------------------------------------------------------
--  Handler.......... : onMouseButtonUp
--  Author........... : Gerold Meisinger (Modern Alchemists OG)
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MultitouchEmulation.onMouseButtonUp( nButton, nPointX, nPointY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------
	
    if( this._DEBUG() ) then log.message( string.format( "onMouseButtonUp( nButton=%d )", nButton ) ) end

    this.mouseChanged( true )

    this.mouseTapIdx( -1 )
    if( this.keyTapIdx() == -1 ) then
        user.sendEventImmediate( this.getUser(), this.sAiModel(), "onTouchSequenceEnd" )
    end
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
