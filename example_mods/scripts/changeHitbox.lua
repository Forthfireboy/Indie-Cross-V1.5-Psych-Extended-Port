local changed = false

function onCreate()
if difficulty == 1 or difficulty == 2 then
    if songName == 'Technicolor-Tussle' then
    changeHitboxControls("shift");
    elseif songName == 'Knockout' or songName == 'Sansational' or songName == 'Burning-In-Hell' or songName == 'Devils-Gambit' or songName == 'Despair' or songName == 'Last-Reel' then
    changeHitboxControls("both");
    elseif songName == 'Whoopee' or songName == 'Bad-Time' or songName == 'Satanic-Funkin' then
    changeHitboxControls("space");
    else
    changeHitboxControls("normal");
    end
else
    changeHitboxControls("normal");
end
end

function onUpdate()
if not changed then
    changeHitboxControls("default"); --U needed this Otherwise Script Wont Work
    changed = true
end
end

function onStepHit()
    if songName == 'Whoopee' and curStep == 160 then
        doTweenAlpha('ByeDodgeButton','DodgeButton',0,0.5,'linear')
    end
end