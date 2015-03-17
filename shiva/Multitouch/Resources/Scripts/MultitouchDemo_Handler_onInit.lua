--------------------------------------------------------------------------------
--  Handler.......... : onInit
--  Author........... : Gerold Meisinger (Modern Alchemists OG)
--  Description...... :
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MultitouchDemo.onInit()
--------------------------------------------------------------------------------

    hud.newTemplateInstance ( this.getUser(), "MultitouchDemo", "MultitouchDemo" )
    input.enableMultiTouch  ( this.getUser(), true )
    --input.enableVirtualMouse( this.getUser(), true )

    -- set AiModel where Multitouch will send to
    user.setAIVariable( this.getUser(), "Multitouch", "sAiModel", "MultitouchDemo" )

    if( system.getClientType() == system.kClientTypeEditor ) then
        user.addAIModel   ( this.getUser (), "MultitouchEmulation" )
        user.setAIVariable( this.getUser (), "MultitouchEmulation", "sAiModel", "Multitouch" )
    end

    for i = 0, this._FINGERS_N() - 1 do
        local ctn = hud.getComponent( this.getUser(), string.format( "MultitouchDemo.FingerCtn%d", i ) )
        if( ctn ~= nil ) then
            hud.setComponentVisible( ctn, false )
        end
    end

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
