function string.tokenzine(_string, _split)
    local _t = {}
    
    for str in string.gmatch(_string, '([^' .. (_split or '%s') .. ']+)') do
        table.insert(_t, str)
    end
    
    return _t
end

function string.between(_string, _between1, _between2)
    local _t = {}
    
    for str in string.gmatch(_string, (_between1 or '%s') .. '(.+)' .. (_between2 or _between1 or '%s')) do 
        table.insert(_t, str)
    end
    
    return _t
end

function string.isOnly(_string, _is)
    if string.match(_string, '^' .. (_is or "%s") .. '*$') then 
        return true
    end
end

function string.get(_table)
    local _t = {}
    
    for _, item in ipairs(_table) do
        if type(item) == "string" then
            table.insert(_t, item)
        end
    end
    
    return _t
end

function string.hexadecimal(_string, _times)
    return string.match(_string, '%x%x' .. ('%s%x%x'):rep(_times - 1))
end

function string.matchp(_string, _match)
    for _s, _m, _f in string.gmatch(_string, '()('.. _match .. '+)()[^' .. _match .. ']*$') do
        return tonumber(_s), tonumber(_f) - 1, _m
    end
end