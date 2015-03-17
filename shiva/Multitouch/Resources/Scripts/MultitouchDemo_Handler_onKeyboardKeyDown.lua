--------------------------------------------------------------------------------
--  Handler.......... : onKeyboardKeyDown
--  Author........... : Gerold Meisinger (Modern Alchemists OG)
--  Description...... :
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MultitouchDemo.onKeyboardKeyDown( kKeyCode )
--------------------------------------------------------------------------------

    if( kKeyCode == input.kKeyEscape ) then
        application.quit()
    end

--     if( kKeyCode == input.kKey1 ) then
--         user.setAIVariable( this.getUser(), "Multitouch", "debugKeyPressed", true )
--     end

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
