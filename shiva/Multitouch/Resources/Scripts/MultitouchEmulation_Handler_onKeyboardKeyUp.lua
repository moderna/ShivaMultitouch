--------------------------------------------------------------------------------
--  Handler.......... : onKeyboardKeyUp
--  Author........... : Gerold Meisinger (Modern Alchemists OG)
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MultitouchEmulation.onKeyboardKeyUp( kKeyCode )
--------------------------------------------------------------------------------
	
    this.inputFlushTotalFrameTime( application.getTotalFrameTime() )
    if( not this.inputFlushLastFrame() and this.keyEnabled() ) then
        if( this._DEBUG() ) then log.message( string.format( "onKeyboardKeyUp( kKeyCode=%d )", kKeyCode ) ) end
        
        if    ( kKeyCode == input.kKeyRight or kKeyCode == input.kKeyD or
                kKeyCode == input.kKeyLeft  or kKeyCode == input.kKeyA ) then
            this.keyMoveHorz( 0 )
        end
        
        if    ( kKeyCode == input.kKeyUp    or kKeyCode == input.kKeyW or
                kKeyCode == input.kKeyDown  or kKeyCode == input.kKeyS ) then
            this.keyMoveVert( 0 )
        end

        if( kKeyCode == input.kKeyLControl or kKeyCode == input.kKeyRControl ) then
            this.keyChanged( true )
            
            local fingers = user.getAIVariable( this.getUser(), "Multitouch", "fingers" )
            if( hashtable.getSize( fingers ) == 1 ) then
                user.sendEventImmediate( this.getUser(), this.sAiModel(), "onTouchSequenceEnd" )
            end
            this.keyTapIdx( -1 )
        end
    end
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
