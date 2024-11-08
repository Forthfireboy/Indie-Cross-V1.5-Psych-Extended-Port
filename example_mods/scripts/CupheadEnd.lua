function onCreate()
    if string.find(curStage,'field',0,true) ~= nil or curStage == 'devilHall-nightmare' then --for low-end devices
        makeAnimatedLuaSprite('outro', 'outro', -50, -10);
        addAnimationByPrefix('outro', 'outro', 'outro', 24, false);  
        setObjectCamera('outro', 'other');
        scaleObject('outro', 1.2, 1.1);
    end
end

function StartEndingAnimation()
    addLuaSprite('outro', true);
    objectPlayAnimation('outro', 'outro', true)
end

function onStepHit()
    if curStep == 1875 and songName == 'Snake-Eyes' then
        StartEndingAnimation()
    elseif curStep == 1430 and songName == 'Technicolor-Tussle' then
        StartEndingAnimation()
    elseif curStep == 1620 and songName == 'Knockout' then
        StartEndingAnimation()
    elseif curStep == 1455 and songName == 'Satanic-Funkin' then
        StartEndingAnimation()
    elseif curStep == 1495 and songName == 'Devils-Gambit' then
        StartEndingAnimation()
    end
end