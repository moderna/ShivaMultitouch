--------------------------------------------------------------------------------
--  Handler.......... : onKeyboardKeyDown
--  Author........... : Gerold Meisinger (Modern Alchemists OG)
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MultitouchEmulation.onKeyboardKeyDown( kKeyCode )
--------------------------------------------------------------------------------

    this.inputFlushTotalFrameTime( application.getTotalFrameTime() )
    if( not this.inputFlushLastFrame() ) then
        if( this._DEBUG() ) then log.message( string.format( "onKeyboardKeyDown( kKeyCode=%d )", kKeyCode ) ) end
        
        if    ( kKeyCode == input.kKeyRight or kKeyCode == input.kKeyD ) then
            this.keyChanged( true )
            this.keyMoveHorz(  1 )
        elseif( kKeyCode == input.kKeyLeft  or kKeyCode == input.kKeyA ) then
            this.keyChanged( true )
            this.keyMoveHorz( -1 )
        end
        
        if    ( kKeyCode == input.kKeyUp    or kKeyCode == input.kKeyW ) then
            this.keyChanged( true )
            this.keyMoveVert(  1 )
        elseif( kKeyCode == input.kKeyDown  or kKeyCode == input.kKeyS ) then
            this.keyChanged( true )
            this.keyMoveVert( -1 )
        end
        
        if( kKeyCode == input.kKeySpace ) then
            this.keyChanged( true )
            if( this.mouseTapIdx() ~= 0 ) then
                this.keyTapIdx( 0 )
                
                if( this.keyTapIdx() == -1 ) then
                    user.sendEventImmediate( this.getUser(), this.sAiModel(), "onTouchSequenceBegin" )
                end
            else
                this.keyTapIdx( 1 )
            end        
        end
    end

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
