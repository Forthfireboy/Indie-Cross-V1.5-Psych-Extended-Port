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

    elseif songName == 'Imminent-Demise' or songName == 'Terrible-Sin' or songName == 'Last-Reel' or songName == 'Last-Reel' or songName == 'Nightmare-Run' or songName == 'Ritual' or songName == 'Despair' or songName == 'Freaky-Machine' or songName == 'build-our-freaky-machine'then
        IndieCrossCountDownStyle = 'Bendy'
        allowCountdown = false
    end
    if IndieCrossCountDownStyle == 'Bendy' then
        local textFile = 'bendy/introductionsong1'
        local textScale = 0.8
        local textoffsetX = 0
        local textoffsetY = 0
        if songName == 'Terrible-Sin' then
            textFile = 'bendy/introductionsong2'
            textoffsetX = 40
            textoffsetY = -20
        elseif songName == 'Last-Reel' then
            textFile = 'bendy/introductionsong3'
            textoffsetX = -20
        elseif songName == 'Nightmare-Run' then
            textFile = 'bendy/introductionsong4'
            textoffsetX = -40
        elseif songName == 'Ritual' then
            textFile = 'bendy/introductionbonus2'
            textScale = 0.75
    
        elseif songName == 'Freaky-Machine' or songName == 'build-our-freaky-machine' then
            textFile = 'bendy/introductionbonus'
            textoffsetX = 20
    
        elseif songName == 'Despair' then
            textFile = 'bendy/introductiondespair'
            textoffsetX = -40
            textoffsetY = -20
        end
        scaleEffect = textScale
        makeLuaSprite('TextIntro',textFile,360,300)
        setProperty('TextIntro.alpha',0.001)
        setProperty('TextIntro.offset.x',textoffsetX)
        setProperty('TextIntro.offset.y',textoffsetY)
        makeLuaSprite('BlackFadeBendy','',0,0)
        makeGraphic('BlackFadeBendy',screenWidth,screenHeight,'000000')
        setObjectCamera('BlackFadeBendy','other')
        addLuaSprite('BlackFadeBendy',true)
        doTweenColor('WhiteToBlack','BlackFadeBendy','000000',0.01,'LinearOut')
        setProperty('skipCountdown',true)
        CountTextCompleted = false
        runTimer('textSongDestroy',2)
        setObjectCamera('TextIntro','other')
        addLuaSprite('TextIntro',true)
        runTimer('playBendySongCountDown',0.2)
    end
end
function onStartCountdown()
	if not allowCountdown and IndieCrossCountDownStyle == 'Bendy' and not getProperty('inCutscene') then
        doTweenAlpha('heyBendyName','TextIntro',1,1,'linear')
		return Function_Stop;
	end
    return Function_Continue;
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
local fps = 0
function onUpdate(el)
    if IndieCrossCountDownStyle == 'Bendy' then
        fps = fps + el
        if fps >= 1/120 then
            scaleEffect = scaleEffect + 0.0005
            scaleObject('TextIntro',scaleEffect,scaleEffect)
            setProperty('TextIntro.x',getProperty('TextIntro.x') - 0.20)
            setProperty('TextIntro.y',getProperty('TextIntro.y') - 0.05)
            fps = 0
        end
    end
end


function onTimerCompleted(tag)
	if tag == 'textSongDestroy' then
		CountTextCompleted = true
        allowCountdown = true
        doTweenAlpha('byeBendyBlack','BlackFadeBendy',0,1,'linear')
        startCountdown()
	end
    if tag == 'playBendySongCountDown' then
        playSound('bendy/whoosh')
	end
end
function onTweenCompleted(tag)
    if tag == 'byeBendyBlack' then
        doTweenAlpha('byeBendyName','TextIntro',0,0.6,'linear')
        removeLuaSprite('BlackFadeBendy',true)
    elseif tag == 'byeBendyName' then
        removeLuaSprite('TextIntro',true)
    end
end
