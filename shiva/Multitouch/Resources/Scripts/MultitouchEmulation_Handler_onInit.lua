--------------------------------------------------------------------------------
--  Handler.......... : onInit
--  Author........... : Gerold Meisinger (Modern Alchemists OG)
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MultitouchEmulation.onInit()
--------------------------------------------------------------------------------
	
    hud.newTemplateInstance( this.getUser(), "MultitouchEmulation", "MultitouchEmulation" )
	
    if( this.sAiModel() == nil or string.isEmpty( this.sAiModel() ) ) then
        log.warning( "MultitouchEmulation.onInit(): sAiModel has to be set!" )
    end

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
