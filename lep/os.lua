function os.exist(_data)
    if os.rename(_data, _data) then 
        return true 
    end
end

function os.getDirItems(_dir, _method)
    assert(type(_dir) == 'string', "bad argument to #1 in function 'io.getDirItems' (string expected got a " .. type(_dir) .. ")")
    local _f, _t = {}, {}
    
    _f = os.getCurrentOs() == "linux" and io.popen("ls " .. _dir)  or io.popen("dir " .. _dir)
    
    for _ in _f:lines() do
        if _ ~= '.' or '..' then 
            table.insert(_t, _)
        end
    end
    
    _f:close()
    
    if #_t == 1 then
        for _ in tostring(_t[1]):gmatch('([^' .. (_split or '%s') .. ']+)') do
            table.insert(_t, _)
        end
        
        table.remove(_t, 1)
    end
    
    return _t
end

function os.getCurrentOs()
    local _bin = package.cpath:match("%p[\\|/]?%p(%a+)")
    
    if _bin == 'dll' then return 'windows'
    elseif _bin == 'so' then return 'linux'
    elseif _bin == 'dylib' then return 'macOS'
    else return 'unknow' end
end