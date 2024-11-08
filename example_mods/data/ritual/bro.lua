function onCreate()
makeLuaSprite('gro', 'flash', 0, 0);
addLuaSprite('gro', true);
setObjectCamera('gro', 'hud');
setProperty('gro.alpha', 1)

makeLuaSprite('i1', 'bendy/introductionbonus2', 290, 274);
addLuaSprite('i1', true);
setObjectCamera('i1', 'other');
setProperty('i1.alpha', 0);
end

function onTimerCompleted(tag)
    if tag == 'start1' then
	    doTweenAlpha('x1d', 'gro', 1.1, 0.5, 'linear');
        doTweenAlpha('x2d', 'i1', 1, 1, 'linear');
	end
	if tag == 'start10' then
	    playSound('bendy/whoosh', 3);
	elseif tag == 'start' then
	    setProperty('i1.alpha', 1);
	end
	if tag == 'start2' then
		doTweenAlpha('xd', 'gro', 0, 2.5, 'linear');
        doTweenAlpha('xd2', 'i1', 0, 4, 'linear');
	end
end

function onCountdownTick(counter)
    if counter == 3 then
        runTimer('start10',0.1)
        runTimer('start',0.25)
        runTimer('start2',1.5)
    end
end