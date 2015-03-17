--------------------------------------------------------------------------------
--  Function......... : tableSort
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function Multitouch.tableSort( tUnsorted, bOptSortByIdx )
--------------------------------------------------------------------------------
	
    local t = table.newInstance()
    table.copy( t, tUnsorted )
    
    for i = 0, table.getSize( t ) - 1 do
        for j = i + 1, table.getSize( t ) - 1 do
            local v0 = table.getAt( t, i )
            local v1 = table.getAt( t, j )
            if( bOptSortByIdx ~= nil ) then
                v0 = table.getAt( v0, bOptSortByIdx )
                v1 = table.getAt( v1, bOptSortByIdx )
            end

            if( v0 > v1 ) then
                --log.message ( v0 .. " < " .. v1 .. "=> swap( " .. i .. ", " .. j .. ")"  )
                table.swap( t, i, j )
            end
        end
    end

    -- DEBUG
    if( this._DEBUG() ) then
        for i = 0, table.getSize( t ) - 1 do
            local v = table.getAt( t, i )
            
            if( bOptSortByIdx == nil ) then
                log.message( v )
            else
                local s = ""
                for j = 0, table.getSize ( v ) - 1 do
                    local v_ = table.getAt( v, j )
                    s = s .. v_ .. " "
                end
                log.message( s )
            end
        end
    end
    
    return t

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
