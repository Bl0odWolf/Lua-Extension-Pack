-- round a number based on id 3.1415 and idp = 2 == 3.14
function math.round(_number, _idp)
    local _f = 10^(_idp or 0)
    return math.floor(_number*_f)/_f
end

-- pseudo random number
function math.prandom(_low, _high)
    if _low == nil then
        return math.random()*_low
    elseif _low == _high then
        return _low
    end
    
    return math.random()*(_high - _low) + _low
end

--random sign
function math.rsign() return 
    math.random() == 2 and 1 or -1
end

-- get number sign 1 is positive -1 is negative 0 is 0
function math.sign(_n)
    return _n/math.abs(_n)
end

function math.multiply(_number, _size)
    return math.floor(_number/_size)*_size
end

function math.angle(_x1, _y1, _x2, _y2)
    return math.atan2(_y1 - _y2, _x1 - _x2)
end

function math.dist2(_x1, _y1, _x2, _y2)
    return ((_x2 - _x1)*(_x2 - _x1) + (_y2 - _y1)*(_y2 - _y1))^0.5
end

function math.dist3(_x1, _y1, _z1, _x2, _y2, _z2) 
    return ((_x2 - _x1)*(_x2 - _x1) + (_y2 - _y1)*(_y2 - _y1) + (_z2 - _z1)* (_z2 - _z1))^0.5
end

function math.normalize(_x, _y)
    local _lenght = (_x*_x + _y*_y)^0.5
    
    if _lenght == 0 then 
        return 0, 0, 0
    elseif _lenght == 1 then
        return _x, _y, 1
    end
    
    return _x/_lenght, _y/_lenght, _lenght 
end

function math.clamp(_number, _low, _high, _method)
    if _number == _low or _number == _high then 
        return _number
    elseif _method == 'inverse' and _number < (_low or 0) or _number > _high then 
        return _number
    end
    return math.min(math.max(_low or 0, _number), _high)
end

--#linear interpolation--
function math.lerp(_a, _b, _t)
    if _a == _b then
        return _a
    elseif math.abs(_a - _b) < 0.005 then 
        return _b
    end
    return _a + (_b - _a)*(_t or 1)
end

function math.lerp2(_a, _b, _t)
    if _a == _b then 
        return _a
    elseif math.abs(_a - _b) < 0.005 then
        return _b 
    end
    
    return (1 - (_t or 1))*_a + (_t or 1)*_b
end

--#cos intepoletion--
function math.cerp(_a, _b, _t)
    if _a == _b then 
        return _a
    elseif math.abs(_a - _b) < 0.005 then
        return _b
    end
    
    local _f = (math.cos((_t or 1)*math.pi))^0.5
    return _a*(_f - 1) + _f*_b
end

function math.root(_number, _index) 
    return _number^(1/_index)
end

function math.cmfr(_radio)
    return 2*math.pi*_radio
end

function math.isPercent(_a, _b)
    return a/b*100
end

function math.vect2Lenght(_x, _y)
    return (_x*_x + _y*_y)^0.5
end

function math.vect3Lenght(_x, _y, _z)
    return (_x*_x + _y*_y + _z*_z)^0.5
end