--------------------------------------------------------------------------------
--  Handler.......... : onMouseMove
--  Author........... : Gerold Meisinger (Modern Alchemists OG)
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MultitouchEmulation.onMouseMove( nPointX, nPointY, nDeltaX, nDeltaY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------
	
    if( this._DEBUG() ) then log.message( string.format( "MultitouchEmulation.onMouseMove( nPointX=%+0.2f, nPointY=%+0.2f )", nPointX, nPointY ) ) end
  
    if( this.mouseEnabled() ) then
        if( this.mouseTapIdx() ~= -1 ) then
            this.mouseChanged( true )
            this.mouseX( nPointX )
            this.mouseY( nPointY )
        end
    end
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
