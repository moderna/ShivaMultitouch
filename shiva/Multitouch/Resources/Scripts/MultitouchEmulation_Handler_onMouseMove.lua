--------------------------------------------------------------------------------
--  Handler.......... : onMouseMove
--  Author........... : Gerold Meisinger (Modern Alchemists OG)
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MultitouchEmulation.onMouseMove( nPointX, nPointY, nDeltaX, nDeltaY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------
	
    if( this.mouseTapIdx() ~= -1 ) then
        this.mouseChanged( true )
        this.mouseX( nPointX )
        this.mouseY( nPointY )
    end
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
