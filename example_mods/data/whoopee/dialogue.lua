local curDialoguePos = 0
local dialogueLength = 0
local curTextLength = 0
local curLetterPos = 0
local skiptuto = false
local allowtimer = false
local enable = true
local dialogueSpeed = 0.025
local dialogue = {
    {'normal','welcome to the underground'},
    {'funny','how was your fall?'},
    {'gay','...'},
    {'closed','you know, i was hired to tear you to shreds'},
    {'noeyes','and spread those ashes across 6 different suns.'},
    {'gay','...'},
    {'wink','after a few rounds of rap battling...'},
    {'funny','for some reason...'},
    {'noeyes','ready yourself human'}
}

function onCreate()
    if not skiptuto == true and isStoryMode and not seenCutscene then
      makeLuaSprite('negro', 'flash', 0, 0);
      scaleObject('negro', 1, 1);
      setObjectCamera('negro', 'other');
      addLuaSprite('negro', false);
    
      makeLuaSprite('screen', 'loading/instructions/Sans', 0, 0);
      scaleObject('screen', 1, 1);
      setObjectCamera('screen', 'other');
      addLuaSprite('screen', false);
    end
    if isStoryMode and not seenCutscene then
        makeAnimatedLuaSprite('SansDialogueBox','sans/Sans_Text_Box',30,500)
        addAnimationByPrefix('SansDialogueBox','wink','Winkk instance 1',24,false)
        addAnimationByPrefix('SansDialogueBox','end','Dialogue End instance 1',24,false)
        addAnimationByPrefix('SansDialogueBox','normal','Normall instance 1',24,false)
        addAnimationByPrefix('SansDialogueBox','closed','eyes closed instance 1',24,false)
        addAnimationByPrefix('SansDialogueBox','funny','funne instance 1',24,false)
        addAnimationByPrefix('','noeyes','no eyes instance 1',24,false)
        addAnimationByPrefix('SansDialogueBox','gay','son dying is gay instance 1',24,false)
        setProperty('SansDialogueBox.antialiasing',false)
        setObjectCamera('SansDialogueBox','other')
        addLuaSprite('SansDialogueBox',true)

        makeLuaText('SansDialogueText','yes',900,300,getProperty('SansDialogueBox.y') + 65)
        setTextSize('SansDialogueText',35)
        setObjectCamera('SansDialogueText','other')
        setTextAlignment('SansDialogueText','left')
        setTextFont('SansDialogueText','Comic Sans [PIXEL].ttf')
        setTextBorder('SansDialogueBox',0.1,'FFFFFFF')
        addLuaText('SansDialogueText',true)
        
        doTweenAlpha('zzzzzzz11', 'SansDialogueBox', 0, 1, 'linear');
        doTweenAlpha('zzzzzzz12', 'SansDialogueText', 0, 1, 'linear');

        dialogueLength = #dialogue
    else
        enable = false
        skiptuto = false
        startCountdown()
    end
end

function onCreatePost()	
MobileC(true)
end

function setLetterPos(pos)
    setTextString('SansDialogueText',string.sub(dialogue[curDialoguePos][2],0,pos))
    if seenCutscene then
    playSound('sans/snd_txtsans',1,'SansDialogue')
    end
    curLetterPos = pos
end

local inicio = true

function onUpdate()
    if not skiptuto == true then
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') and inicio == true then
    cancelTimer('sonido')
    cancelTimer('sonido2')
    stopSound('pausehead')	
    inicio = false
    runTimer('adios', 0.1)
    end
    end
    
    if enable then
        if curDialoguePos <= dialogueLength then
            if keyJustPressed('accept') and allowtimer or keyJustPressed('space') and allowtimer or mouseClicked('left') and allowtimer then
                seenCutscene = true
                if curLetterPos < curTextLength then
                    setLetterPos(curTextLength)
                else
                    setDialoguePos(curDialoguePos + 1)
                end
            elseif getPropertyFromClass('flixel.FlxG','keys.justPressed.ESCAPE') then
                setDialoguePos(dialogueLength + 1)
            end
        else
            if getProperty('SansDialogueBox.animation.curAnim.finished') then
                enable = false
                startCountdown()
                removeLuaSprite('SansDialogueBox',true)
                removeLuaText('SansDialogueText',true)
            end
        end
    end
end
function setDialoguePos(pos)
    setTextString('SansDialogueText','')
    curLetterPos = 0
    if pos <= dialogueLength then
        objectPlayAnimation('SansDialogueBox',dialogue[pos][1],true)
        curTextLength = string.len(dialogue[pos][2])
        if pos ~= 1 then
            runTimer('DialogueSansLetters',0.2)
        end
    elseif pos > dialogueLength then
        objectPlayAnimation('SansDialogueBox','end',false)
        removeLuaText('SansDialogueText',true)
    end
    curDialoguePos = pos
end
function onStartCountdown()
    if enable and not getProperty('inCutscene') then
        setDialoguePos(1)
        runTimer('DialogueSansLetters',1)
        setPropertyFromClass('PlayState','seenCutscene',true)
        return Function_Stop;
    end
end
function onTimerCompleted(tag)
    if tag == 'sonido' then
    playSound('pausehead', 1, 'pausehead')
    runTimer('sonido2', 33, 0);
    end	
    if tag == 'sonido2' then
    playSound('pausehead', 1)
    end	
    if tag == 'adios' then
    doTweenAlpha('zzzzzzz', 'screen', 0, 1, 'linear');
    runTimer('adios2', 3)
    end
    if tag == 'adios2' then
    doTweenAlpha('zzzzzzz2', 'negro', 0, 0.3, 'linear');
    doTweenAlpha('zzzzzzz3', 'SansDialogueBox', 1, 0.3, 'linear');
    doTweenAlpha('zzzzzzz4', 'SansDialogueText', 1, 0.3, 'linear');
    allowtimer = true	
    end 
    if tag == 'DialogueSansLetters' and curLetterPos < curTextLength then
        setLetterPos(curLetterPos + 1)
        runTimer('DialogueSansLetters',dialogueSpeed)
    end
end