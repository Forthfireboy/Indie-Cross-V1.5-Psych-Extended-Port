function onEvent(name,value1,value2)
    if (name == 'HitboxMode') then
        if (value1 == 'normal') then
            changeHitboxControls("normal");
        elseif (value1 == 'space') then
            changeHitboxControls("space");
        elseif (value1 == 'both') then
            changeHitboxControls("both");
        elseif (value1 == 'default') then
            changeHitboxControls("default");
        end
    end
end
