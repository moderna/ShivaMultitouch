--------------------------------------------------------------------------------
--  Handler.......... : onEnterFrame
--  Author........... : Gerold Meisinger (Modern Alchemists OG)
--  Description...... :
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MultitouchDemo.onEnterFrame()
--------------------------------------------------------------------------------

    local bg = hud.getComponent( this.getUser(), "MultitouchDemo.Bg" )
    if( bg ~= nil ) then
        hud.setComponentBackgroundColor( bg, this.clrR(), this.clrG(), this.clrB(), 255 )
    end
    
    local hCam = user.getActiveCamera( this.getUser() )
    object.setRotation( hCam, this.camRotX(), this.camRotY(), 0, object.kGlobalSpace )

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
