function onCreate()

	makeLuaSprite('BendyBG', 'bendy/BACKBACKgROUND',-220, -100);
	makeLuaSprite('BendyBG2', 'bendy/BackgroundwhereDEEZNUTSfitINYOmOUTH', -600, -150);

	makeLuaSprite('BendyGround', 'bendy/MidGrounUTS', -600, -150);


    precacheImage('bendy/BACKBACKgROUND')
    precacheImage('bendy/BackgroundwhereDEEZNUTSfitINYOmOUTH')
    if not lowQuality then
        precacheImage('bendy/ForegroundEEZNUTS')
        makeLuaSprite('Pillar2', 'bendy/ForegroundEEZNUTS', 1700, -200);
        setScrollFactor('Pillar2',1.2,1)
        precacheImage('bendy/ForegroundEEZNUTS')
    end
    if version >= '0.7' then
        addHaxeLibrary('FlxVideo','flixel.hxcodec')
        runHaxeCode(
            [[
                var video = new FlxVideo();
                video.play(Paths.video('bendy/1.5'));
                video.alpha = 0.001;
                video.volume = 0;
                return;
            ]]
        )
    else
        addHaxeLibrary('MP4Handler','vlc')
        runHaxeCode(
            [[
                var video = new MP4Handler();
                video.playVideo(Paths.video('bendy/1.5'));
                video.alpha = 0.01;
                video.volume = 0;
                return;
            ]]
        )
    end
end
function onCreatePost()
    setProperty('dad.alpha',0.001)
end
function onStepHit()
    if curStep == 938 then
        startVideo('bendy/1.5')
    elseif curStep == 1129 then
        addLuaSprite('BendyBG',false)
        setProperty('inCutscene',false)
        addLuaSprite('BendyBG2',false)
        addLuaSprite('BendyGround',false)
        removeLuaSprite('BG',true)
        removeLuaSprite('BendySprite',true)
        if not lowQuality then
            removeLuaSprite('Pillar',true)
            addLuaSprite('Pillar2',true)
        end
        setProperty('defaultCamZoom',0.5)
        removeLuaSprite('Light',true)
        setProperty('boyfriend.x',1150 + getProperty('boyfriend.positionArray[0]'))
        setProperty('boyfriend.y',800 + getProperty('boyfriend.positionArray[1]'))
        setProperty('dad.x',0 + getProperty('dad.positionArray[0]'))
        setProperty('dad.y',800 + getProperty('dad.positionArray[1]'))
        setProperty('dad.alpha',1)
        setProperty('defaultCamZoom',0.5)
    end
end