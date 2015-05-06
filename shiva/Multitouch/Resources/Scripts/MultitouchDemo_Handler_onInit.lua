--------------------------------------------------------------------------------
--  Handler.......... : onInit
--  Author........... : Gerold Meisinger (Modern Alchemists OG)
--  Description...... :
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MultitouchDemo.onInit()
--------------------------------------------------------------------------------

    this._VERSION_MAJOR( 1 )
    this._VERSION_MINOR( 3 )

    hud.newTemplateInstance ( this.getUser(), "MultitouchDemo", "MultitouchDemo" )
    input.enableMultiTouch  ( this.getUser(), true )
    --input.enableVirtualMouse( this.getUser(), true )
    
    local titleLbl = hud.getComponent( this.getUser(), "MultitouchDemo.TitleLbl" )
    if( titleLbl ~= nil ) then
        local titleStr = hud.getLabelText( titleLbl )
        hud.setLabelText( titleLbl, string.format( titleStr, this._VERSION_MAJOR(), this._VERSION_MINOR() ) )
    end

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
    
    user.setScene( this.getUser(), "Multitouch" )
    local hCam = user.getActiveCamera( this.getUser() )
    local rx, ry, rz = object.getRotation( hCam, object.kGlobalSpace )
    this.camRotX( rx )
    this.camRotY( ry )

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
