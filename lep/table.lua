function table.displayContent(_tbl, _indent)
    assert(type(_tbl) == 'table', "bad argument to #1 in function 'table.getContent' (data expected got " .. type(_tbl) .. ')')
    if not _indent then _indent = 0 end
    
    local toprint = string.rep(" ", _indent) .. "{\r\n"
    _indent = _indent + 1 
    
    for k, v in pairs(_tbl) do
        toprint = toprint .. string.rep(" ", _indent)
        
        if (type(k) == "number") then toprint = toprint .. "[" .. k .. "] = "
        elseif (type(k) == "string") then toprint = toprint  .. k ..  "= " end
        
        if (type(v) == "number") then toprint = toprint .. v .. ",\r\n"
        elseif (type(v) == "string") then toprint = toprint .. "\"" .. v .. "\",\r\n"
        elseif (type(v) == "table") then toprint = toprint .. table.displayContent(v, _indent + 2) .. ",\r\n"
        else toprint = toprint .. "\"" .. tostring(v) .. "\",\r\n" end
    end
    
    toprint = toprint .. string.rep(" ", _indent-2) .. "}"
    
    return toprint
end

function table.content(_tbl, _element)
    for _ = 1, #_tbl do  
        if _tbl[_] == _element then
            return _, _element 
        end
    end
    
    return false
end

function table.move(_tbl1, _tbl2, _index)
    assert(type(_tbl1) == 'table' , "bad argument #1 in the function 'table.move' (table expected got " .. type(_tbl1) .. ')')
    assert(type(_tbl2) == 'table' , "bad argument #2 in the function 'table.move' (table expected got " .. type(_tbl2) .. ')')
    assert(type(_index) == 'number', "bad argument #3 in the function 'table.move' (number expected got " .. type(_tbl2) .. ')')
    
    table.insert(_tbl1, _tbl2[_index])
    table.remove(_tbl2, _index)
end

function table.random(_table, _low, _high)
    assert(type(_table) == 'table', "bad argument #1 in the function 'table.random' (table expected got " .. type(_tbl) .. ")")
    
    return _table[math.random(_low or 1, _high or #_table)]
end

function table.move(_tbl1, _tbl2, _i)
    assert(type(_tbl1) == 'table' , "bad argument #1 in the function 'table.move' (table expected got " .. type(_tbl1) .. ')')
    assert(type(_tbl2) == 'table' , "bad argument #2 in the function 'table.move' (table expected got " .. type(_tbl2) .. ')')
    assert(type(_i) == 'number', "bad argument #3 in the function 'table.move' (number expected got " .. type(_tbl2) .. ')')
    
    table.insert(_tbl1, _tbl2[_i or #_tbl2])
    table.remove(_tbl2, _i or #_tbl2)
end

local function reverseipairsinterator(_table, _index)
    _index = _index - 1
    if _index > 0 then
        return _index, _table[_index]
    end
end

function ripairs(_table)
    return reverseipairsinterator, _table, #_table + 1
end

return ripairs