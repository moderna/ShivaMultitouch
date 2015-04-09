--------------------------------------------------------------------------------
--  Handler.......... : onMouseButtonDown
--  Author........... : Gerold Meisinger (Modern Alchemists OG)
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MultitouchEmulation.onMouseButtonDown( nButton, nPointX, nPointY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------

    if( this._DEBUG() ) then log.message( string.format( "onMouseButtonDown( nButton=%d )", nButton ) ) end

    if( nButton == 0 ) then
        this.mouseChanged( true )
        this.mouseX( nPointX )
        this.mouseY( nPointY )

        if( this.keyTapIdx() ~= 0 ) then
            this.mouseTapIdx( 0 )
            
            if( this.keyTapIdx() == -1 ) then
                user.sendEventImmediate( this.getUser(), this.sAiModel(), "onTouchSequenceBegin" )        
            end
        else
            this.mouseTapIdx( 1 )
        end
    end

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
