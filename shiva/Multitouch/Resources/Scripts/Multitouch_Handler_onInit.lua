--------------------------------------------------------------------------------
--  Handler.......... : onInit
--  Author........... : Gerold Meisinger (Modern Alchemists OG)
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function Multitouch.onInit()
--------------------------------------------------------------------------------
	
	if( this.sAiModel() == nil or string.isEmpty( this.sAiModel() ) ) then
        log.warning( "Multitouch.onInit(): sAiModel has to be set!" )
    end
    
    -- DEV test duplicate finger removal
    --user.sendEventImmediate( this.getUser(), "Multitouch", "onTouchSequenceChange", 1, 1.1, 1, 1, 1, 1.1, 1, 1, 1, 1, 1, 1 )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
