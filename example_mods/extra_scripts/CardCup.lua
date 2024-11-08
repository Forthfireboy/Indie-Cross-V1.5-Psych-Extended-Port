
local cardPercent = 0
function onCreate()
    precacheImage('cup/cardfull')
    precacheImage('cup/Cardcrap')
    if downscroll then
        makeAnimatedLuaSprite('Cardcrap', 'cup/Cardcrap',1000,40);
    else
        makeAnimatedLuaSprite('Cardcrap', 'cup/Cardcrap',1000,screenHeight - 190);
    end
    
    addAnimationByPrefix('Cardcrap','Flipped','Card but flipped instance 1',1,true)
    addOffset('Cardcrap','Flipped',0,0)
    addAnimationByPrefix('Cardcrap','Filled','Card Filled instance 1',24,false);
    addOffset('Cardcrap','Filled',0,0)
    addAnimationByPrefix('Cardcrap','Parry','PARRY Card Pop out  instance 1',24,false);
    addOffset('Cardcrap','Parry',0,0)
    addAnimationByPrefix('Cardcrap','Normal','Card Normal Pop out instance 1',24,false);
    addOffset('Cardcrap','Normal',0,35)
    addAnimationByPrefix('Cardcrap','Used','Card Used instance 1',24,false);
    addOffset('Cardcrap','Used',0,0)
    setObjectCamera('Cardcrap','hud')
    playAnim('Cardcrap','Used',false)
    addLuaSprite('Cardcrap',true)
    
    makeLuaSprite('CardcrapGraphic','cup/cardfull',getProperty('Cardcrap.x'),getProperty('Cardcrap.y'))
    setObjectCamera('CardcrapGraphic','hud')
    setProperty('CardcrapGraphic.alpha',0.001)
    addLuaSprite('CardcrapGraphic',true)

    updateCard()
    
    setProperty('CardcrapGraphic.alpha',0)
    setProperty('Cardcrap.alpha',0)
end
function onUpdate()
    local cardAnim = getProperty('Cardcrap.animation.curAnim.name')
    if (getProperty('Cardcrap.animation.curAnim.finished')) then
        if (cardAnim  == 'Used') and cardPercent == -1 then
            if cardPercent == 0 or cardPercent == -1 then
                setProperty('CardcrapGraphic.alpha',0)
                setProperty('Cardcrap.alpha',0)
            end
            cardPercent = 0
            updateCard()
        elseif (cardAnim == 'Parry') then
            playAnim('Cardcrap','Flipped',true)
        end
    end
end

function setCardPercent(percent)
    if cardPercent < 1 and percent >= 1 then
        if songName == 'Technicolor-Tussle' then
        runTimer('alpha2', 0.25)
        else
        runTimer('alpha2', 0.15)
        end
        setProperty('Cardcrap.alpha',1)
        playAnim('Cardcrap','Normal',false)
    else
        if cardPercent < 0 then
            setProperty('CardcrapGraphic.alpha',1)
            setProperty('Cardcrap.alpha',0)
        end
    end
    cardPercent = percent
    updateCard()
end

function updateCard()
    if cardPercent < 1 then
        if cardPercent <= 0 then
            setProperty('CardcrapGraphic.alpha',0)
        else
            loadGraphic('CardcrapGraphic','cup/cardfull',97,math.floor(144*cardPercent))
            setProperty('CardcrapGraphic.y',getProperty('Cardcrap.y') + -15 + math.floor(144 * (1 -cardPercent)))
            if songName == 'Technicolor-Tussle' then
            runTimer('alpha', 0.22)
            else
            runTimer('alpha', 0.10)
            end
        end
    end
end

function unfillCard()
    playAnim('Cardcrap','Used',false)
    cardPercent = -1
end
function goodNoteHit(id,data,type,sus)
    if cardPercent ~= -1 and cardPercent < 1 then
        if type == 'Parry Note' then
            setCardPercent(1)
        else
            setCardPercent(cardPercent + 0.005)
        end
    end
end

function onTimerCompleted(tag)
if tag == 'alpha' then
setProperty('CardcrapGraphic.alpha',1)
end
if tag == 'alpha2' then
setProperty('CardcrapGraphic.alpha',0)
end
if tag == 'Parry' then
setCardPercent(1)
end
end