--------------------------------------------------------------------------------
--  Handler.......... : onTouchSequenceEnd
--  Author........... : Gerold Meisinger (Modern Alchemists OG)
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function Multitouch.onTouchSequenceEnd()
--------------------------------------------------------------------------------
	
    if( this._DEBUG() ) then
        log.message( "onTouchSequenceEnd()" )
    end
    
    for i = 0, hashtable.getSize( this.fingers() ) - 1 do
        local k          = hashtable.getKeyAt( this.fingers(), i )
        local fingerInfo = hashtable.get     ( this.fingers(), k )
        local fingerIdx, fingerName, fingerX, fingerY = this.getFingerInfo( fingerInfo )
        user.sendEventImmediate( this.getUser(), this.sAiModel(), this.sHandlerFingerUp(), fingerName, fingerX, fingerY )
    end
    
    hashtable.empty( this.fingers() )

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
