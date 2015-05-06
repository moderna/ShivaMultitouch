--------------------------------------------------------------------------------
--  Handler.......... : onTouchSequenceBegin
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MultitouchDemo.onTouchSequenceBegin()
--------------------------------------------------------------------------------

    -- On Windows Surface tablets we receive both touch and mouse events for the same input
    -- thus immediately deactivate mouse when the user uses touch.
    if( system.getClientType() ~= system.kClientTypeEditor ) then
        user.setAIVariable( this.getUser(), "MultitouchEmulation", "mouseEnabled", false )
    end    
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
