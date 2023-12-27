function toboolean(_var)
    assert(type(_var) == "string" or type(_var) == "number" or type(_var) == "nil", type(_var) .. " value can't be convert into a boolean")
    if _var == 'true' or tonumber(_var) == 1 then
        return true
    elseif _var == 'false' or tonumber(_var) == 0 or _var == nil then 
        return false 
    end
end

function inverter(_bool)
    return not _bool
end

function pack(...)
    return {...}
end

function newClass(_instance, _properties)
    assert(type(_instance) == "table", "Bad argument to #1 (table.expected got " .. type(_properties) .. ")")
    local _class = _properties or {}
    _instance.__index = _instance
    setmetatable(_class, _instance)
    return _class
end

function switch(_value, _cases)
    assert(type(_cases) == "table", "bas argument to #2 (table expected got " .. type(_cases) .. ")")
    if _cases ~= nil then
        return _cases[tostring(_value)] or _cases["default"] or nil
    end
end