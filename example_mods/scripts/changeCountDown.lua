local IndieCrossCountDownStyle = ''
local scaleEffect = 1
local cupSongStyle = 'normal'
local cupLimitedSongs = 4
local allowCountdown = true

function onCreate()
    if songName == 'Snake-Eyes' or songName == 'Knockout' or songName == 'Technicolor-Tussle' or songName == 'Devils-Gambit' or songName == 'Satanic-Funkin' then
        IndieCrossCountDownStyle = 'Cuphead'
        
    elseif songName == 'Whoopee' or songName == 'Sansational' or songName == 'Final-Stretch' or songName == 'Burning-In-Hell' or songName == 'Bad-Time' or songName == 'Bad-To-The-Bone' or songName == 'Bonedoggle' then
        setProperty('introSoundsSuffix','Sans')
    end
end
function onCountdownTick(counter)
    if IndieCrossCountDownStyle == 'Cuphead' then
        if counter > 0 then
            if counter == 1 then
                setProperty('countdownReady.visible',false)
            elseif counter == 2 then
                setProperty('countdownSet.visible',false)
            elseif counter == 3 then
                setProperty('countdownGo.visible',false)
            end
        end
    end
end