--------------------------------------------------------------------------------
--  Handler.......... : onEnterFrame
--  Author........... : Gerold Meisinger (Modern Alchemists OG)
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MultitouchEmulation.onEnterFrame()
--------------------------------------------------------------------------------
	
    if( this.sAiModel() ~= nil and not string.isEmpty( this.sAiModel() ) ) then
        if( this.inputFlushLastFrame() ) then
            local ft = application.getTotalFrameTime()
            if( ft ~= this.inputFlushTotalFrameTime() ) then
                this.inputFlushLastFrame( false )
                if( ft > 0 ) then
                    log.warning( string.format( "Flushed old inputs (%0.2fs)", ft ) )
                end
            end
        end
        
        local dt = application.getLastFrameTime()

        local keyCursorCtn = hud.getComponent( this.getUser(), "MultitouchEmulation.CursorKeyCtn" )
        local keyPosChanged = false
        if( this.keyEnabled() ) then
            local keyXOld = this.keyX()
            local keyYOld = this.keyY()    
            this.keyX( math.clamp( this.keyX() + dt * this.keyMoveHorz(), -1, 1 ) )
            this.keyY( math.clamp( this.keyY() + dt * this.keyMoveVert(), -1, 1 ) )
            keyPosChanged = (keyXOld ~= this.keyX() or keyYOld ~= this.keyY())

            if( keyCursorCtn ~= nil ) then
                hud.setComponentVisible ( keyCursorCtn, true )
                hud.setComponentPosition( keyCursorCtn, (this.keyX() + 1) / 2 * 100, (this.keyY() + 1) / 2 * 100 )
            end   
        else
            if( keyCursorCtn ~= nil ) then
                hud.setComponentVisible ( keyCursorCtn, false )
            end
        end

        local nTaps0 = 0
        local nX0    = 0
        local nY0    = 0
        local nTaps1 = 0
        local nX1    = 0
        local nY1    = 0
        local nTaps2 = 0
        local nX2    = 0
        local nY2    = 0
        local nTaps3 = 0
        local nX3    = 0
        local nY3    = 0
        local nTaps4 = 0
        local nX4    = 0
        local nY4    = 0
        local bMoved0 = false
        local bMoved1 = false
        local bMoved2 = false
        local bMoved3 = false
        local bMoved4 = false
        
        if( this.keyTapIdx() ~= -1 ) then
            if    ( this.mouseTapIdx() ~= 0 ) then
                nTaps0 = 1
                nX0 = this.keyX()
                nY0 = this.keyY()
            elseif( this.mouseTapIdx() ~= 1 ) then
                nTaps1 = 1
                nX1 = this.keyX()
                nY1 = this.keyY()
            end
        end

        if( this.mouseTapIdx() ~= -1 ) then
            if    ( this.keyTapIdx() ~= 0 ) then
                nTaps0 = 1
                nX0 = this.mouseX()
                nY0 = this.mouseY()
            elseif( this.keyTapIdx() ~= 1 ) then
                nTaps1 = 1
                nX1 = this.mouseX()
                nY1 = this.mouseY()
            end
        end
        
        if( nTaps0 + nTaps1 + nTaps2 + nTaps3 + nTaps4 > 0 ) then
            if( this.keyChanged() or keyPosChanged or this.mouseChanged() ) then
                -- Note: sending all five fingers is not compatible with CPP
                user.sendEventImmediate( this.getUser(), this.sAiModel(), "onTouchSequenceChange", nTaps0, nX0, nY0, nTaps1, nX1, nY1, nTaps2, nX2, nY2, nTaps3, nX3, nY3 )
            end
        end

        this.keyChanged  ( false )
        this.mouseChanged( false )
    end
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
