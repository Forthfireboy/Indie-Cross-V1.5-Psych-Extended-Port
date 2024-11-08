function onCreate()
if songName == 'Imminent-Demise' or songName == 'Terrible-Sin' or songName == 'Last-Reel' or songName == 'Nightmare-Run' then
makeLuaSprite('gro', 'flash', 0, 0);
addLuaSprite('gro', true);
setObjectCamera('gro', 'other');
setProperty('gro.alpha', 1)

if songName == 'Terrible-Sin' then
    makeLuaSprite('i1', 'bendy/introductionsong2', 330, 254);
elseif songName == 'Nightmare-Run' then
    makeLuaSprite('i1', 'bendy/introductionsong4', 330, 274);
else
    makeLuaSprite('i1', 'bendy/introductionsong1', 290, 274);
end

addLuaSprite('i1', true);
setObjectCamera('i1', 'other');
setProperty('i1.alpha', 0);
end
end

function onTimerCompleted(tag)
if songName == 'Imminent-Demise' or songName == 'Terrible-Sin' or songName == 'Last-Reel' or songName == 'Nightmare-Run' then
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
end

function onCountdownTick(counter)
if songName == 'Imminent-Demise' or songName == 'Terrible-Sin' or songName == 'Last-Reel' or songName == 'Nightmare-Run' then
    if counter == 3 then
        runTimer('start10',0.1)
        runTimer('start',0.25)
        runTimer('start2',1.5)
    end
end
end