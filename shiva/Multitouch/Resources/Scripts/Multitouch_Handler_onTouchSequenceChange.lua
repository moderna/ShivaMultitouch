--------------------------------------------------------------------------------
--  Handler.......... : onTouchSequenceChange
--  Author........... : Gerold Meisinger (Modern Alchemists OG)
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function Multitouch.onTouchSequenceChange( nTaps0, nX0, nY0, nTaps1, nX1, nY1, nTaps2, nX2, nY2, nTaps3, nX3, nY3, nTaps4, nX4, nY4 )
--------------------------------------------------------------------------------
	    
    if( this._DEBUG() ) then
        if    ( nTaps4 == 1 ) then
            -- not CPP compatible
            --log.message( string.format( "nX0=%+0.2f nY0=%+0.2f; nX1=%+0.2f nY1=%+0.2f; nX1=%+0.2f nY1=%+0.2f; nX3=%+0.2f nY3=%+0.2f; nX4=%+0.2f nY4=%+0.2f"
            --           , nX0, nY0, nX1, nY1, nX2, nY2, nX3, nY3, nX4, nY4 ) )
            log.message( string.format( "nX0=%+0.2f nY0=%+0.2f; nX1=%+0.2f nY1=%+0.2f; nX2=%+0.2f nY2=%+0.2f; nX3=%+0.2f nY3=%+0.2f"
                       , nX0, nY0, nX1, nY1, nX2, nY2, nX3, nY3 ) )
        elseif( nTaps3 == 1 ) then
            log.message( string.format( "nX0=%+0.2f nY0=%+0.2f; nX1=%+0.2f nY1=%+0.2f; nX2=%+0.2f nY2=%+0.2f; nX3=%+0.2f nY3=%+0.2f"
                       , nX0, nY0, nX1, nY1, nX2, nY2, nX3, nY3 ) )
        elseif( nTaps2 == 1 ) then
            log.message( string.format( "nX0=%+0.2f nY0=%+0.2f; nX1=%+0.2f nY1=%+0.2f; nX2=%+0.2f nY2=%+0.2f"
                       , nX0, nY0, nX1, nY1, nX2, nY2 ) )
        elseif( nTaps1 == 1 ) then
            log.message( string.format( "nX0=%+0.2f nY0=%+0.2f; nX1=%+0.2f nY1=%+0.2f"
                       , nX0, nY0, nX1, nY1 ) )
        elseif( nTaps0 == 1 ) then
            log.message( string.format( "nX0=%+0.2f nY0=%+0.2f"
                       , nX0, nY0 ) )
        end
    end

    -- Add all tap positions to table to make it easier to work with
	local xs = table.newInstance()
	local ys = table.newInstance()

    if( nTaps0 == 1 ) then
        table.add( xs, nX0 )
        table.add( ys, nY0 )

        if( nTaps1 == 1 ) then
            table.add( xs, nX1 )
            table.add( ys, nY1 )

            if( nTaps2 == 1 ) then
                table.add( xs, nX2 )
                table.add( ys, nY2 )

                if( nTaps3 == 1 ) then
                    table.add( xs, nX3 )
                    table.add( ys, nY3 )

                    if( nTaps4 == 1 ) then
                        table.add( xs, nX4 )
                        table.add( ys, nY4 )
                    end
                end
            end
        end
    end

    -- If the number of fingers differs from the number of taps we have to reassign them
    if( nTaps4 == nil ) then nTaps4 = 0 end -- happens with MultitouchEmulation
    local tapsN    = nTaps0 + nTaps1 + nTaps2 + nTaps3 + nTaps4    
    local fingersN = hashtable.getSize( this.fingers() )
    
    -- assert
    if( tapsN ~= table.getSize( xs ) or tapsN ~= table.getSize( ys ) ) then
        log.warning( "onTouchSequenceChange(): tapsN=" .. tapsN .. " and size of xs (n=" .. xs .. ") and ys (n=" .. ys .. ") cannot differ!" )
    end

    local FINGER_D    = 0    
    local TAP_IDX     = 1
    local FINGER_NAME = 2
    local FINGER_X    = 3
    local FINGER_Y    = 4
    
    if( tapsN ~= fingersN ) then    
        -- Here we calculate for all fingers the distance of their previous finger position to the tap-positions.
        -- Then we sort the distances and assign the tap indices to the finger with the smallest distance.
        -- Note: Unfortunately we cannot just use the minimum distance per finger,
        -- because the position of another finger is still the smallest distance
        local fingerDistanceInfos = table.newInstance()
        for i = 0, fingersN - 1 do
            local fingerName    = hashtable.getKeyAt( this.fingers(), i          )
            local fingerInfoOld = hashtable.get     ( this.fingers(), fingerName )
        
            local xOld = table.getAt( fingerInfoOld, FINGER_X )
            local yOld = table.getAt( fingerInfoOld, FINGER_Y )

            for tapIdx = 0, tapsN - 1 do
                local fingerX = table.getAt( xs, tapIdx )
                local fingerY = table.getAt( ys, tapIdx )
                local dx = 1000 * fingerX - 1000 * xOld -- scale values to avoid
                local dy = 1000 * fingerY - 1000 * yOld -- floating point inprecision
                local d = dx * dx + dy * dy
                
                local fingerInfo = table.newInstance()
                table.add( fingerInfo, d          )
                table.add( fingerInfo, tapIdx     )
                table.add( fingerInfo, fingerName )
                table.add( fingerInfo, fingerX    )
                table.add( fingerInfo, fingerY    )

                table.add( fingerDistanceInfos, fingerInfo )
            end
        end
        
        fingerDistanceInfos = this.tableSort( fingerDistanceInfos, FINGER_D )      

        -- Here we assign the smallest distance to the first previously used finger
        -- and ignore any other distance entry with the same tapIdx or finger.
        -- Repeat until there are no more fingers.
        -- If tapsN < fingersN, then the finger was lift from the screen.
        -- If tapsN > fingersN, then we have to apply the tap to a new finger.
        local assignedFingers = table.newInstance()
        local assignedTapIdxs = table.newInstance()
        for i = 0, table.getSize( fingerDistanceInfos ) - 1 do
            local fingerDistanceInfo = table.getAt( fingerDistanceInfos, i )
            
            local tapIdx, fingerName, fingerX, fingerY = this.getFingerInfo( fingerDistanceInfo )            
            
            -- If the tap wasn't assigned yet then reapply this tapIdx to the previously used finger
            if( not table.contains( assignedFingers, fingerName ) ) then
                if( not table.contains( assignedTapIdxs, tapIdx ) and table.getSize( assignedFingers ) < fingersN ) then
                    hashtable.set( this.fingers(), fingerName, fingerDistanceInfo )

                    table.add( assignedTapIdxs, tapIdx )
                    table.add( assignedFingers, fingerName )
                -- else the finger was lift from the screen and has to be removed
                else
                    if( hashtable.contains( this.fingers(), fingerName ) ) then
                        hashtable.remove( this.fingers(), fingerName )
                        user.sendEventImmediate( this.getUser(), this.sAiModel(), this.sHandlerFingerUp(), fingerName, fingerX, fingerY )
                    end
                end            
            end
        end

        -- All remainig indices which were not assigned or removed are new fingers
        for tapIdxNew = 0, tapsN - 1 do
            if( not table.contains( assignedTapIdxs, tapIdxNew ) ) then
                local fingerX    = table.getAt( xs, tapIdxNew )
                local fingerY    = table.getAt( ys, tapIdxNew )
                user.sendEventImmediate( this.getUser(), this.sAiModel(), this.sHandlerFingerDown(), fingerX, fingerY )
                if( this.fingerName() == nil or string.isEmpty( this.fingerName() ) ) then
                    for i = 0, this._FINGERS_N() do
                        local name = string.format( "#%d", i )
                        if( not hashtable.contains( this.fingers(), name ) ) then
                            this.fingerName( name )
                        end                        
                    end
                end
            
                local fingerInfo = table.newInstance()
                table.add( fingerInfo, 0                 )
                table.add( fingerInfo, tapIdxNew         )
                table.add( fingerInfo, this.fingerName() )
                table.add( fingerInfo, fingerX           )
                table.add( fingerInfo, fingerY           )
                
                hashtable.add( this.fingers(), this.fingerName(), fingerInfo )
            end
        end
    end
            	
    -- assign the positions to each finger
    for i = 0, hashtable.getSize( this.fingers() ) - 1 do
        local k          = hashtable.getKeyAt( this.fingers(), i )
        local fingerInfo = hashtable.get     ( this.fingers(), k )
        
        local tapIdx, fingerName, fingerX, fingerY = this.getFingerInfo( fingerInfo )
        
        local x = table.getAt( xs, tapIdx )
        local y = table.getAt( ys, tapIdx )
        local dx = x - fingerX
        local dy = y - fingerY
        
        user.sendEventImmediate( this.getUser(), this.sAiModel(), this.sHandlerFingerMoved(), fingerName, fingerX, fingerY, dx, dy )
        
        table.setAt( fingerInfo, FINGER_X, x )
        table.setAt( fingerInfo, FINGER_Y, y )
    end    

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
