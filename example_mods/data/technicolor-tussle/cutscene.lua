local allowCountdown = false
local skiptuto = false
local allowwallop = false
local allowtimer = false
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then 
		startVideo('cuphead/2');
		allowCountdown = true;
		allowwallop = true
		return Function_Stop;
	end
    if allowCountdown and allowwallop then
        allowwallop = false
    end
    if not allowtimer then
    	return Function_Stop;
    end
    if allowtimer then
	return Function_Continue;
	end
end


function onCreatePost()	
MobileC(true)
end

function onCreate()
precacheImage('ready_wallop');
if seenCutscene and isStoryMode then
skiptuto = true
runTimer('adios2', 0.1)	
end 
if not isStoryMode then
skiptuto = true
allowCountdown = true	
runTimer('adios2', 0.1)	
end
if not skiptuto == true then
  makeLuaSprite('negro', 'flash', 0, 0);
  scaleObject('negro', 1, 1);
  setObjectCamera('negro', 'other');
  addLuaSprite('negro', false);

  makeLuaSprite('screen', 'loading/instructions/Cuphead', 0, 0);
  scaleObject('screen', 1, 1);
  setObjectCamera('screen', 'other');
  addLuaSprite('screen', false);
end
end

local inicio = true

function onUpdate()
if not skiptuto == true then
if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SHIFT') and inicio == true then
cancelTimer('sonido')
cancelTimer('sonido2')
stopSound('pausehead')	
inicio = false
runTimer('adios', 0.1)
      end
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
setProperty('ready_wallop.visible', true);
objectPlayAnimation('ready_wallop', 'ready_wallop2', true)
allowtimer = true	
setPropertyFromClass('flixel.FlxG', 'mouse.visible', false);
makeAnimatedLuaSprite('intro', 'intro', -20, 0);
addAnimationByPrefix('intro', 'intro', 'intro', 24, false);  
objectPlayAnimation('intro', 'intro', true)
setObjectCamera('intro', 'other');
scaleObject('intro', 1.2, 1.1);
addLuaSprite('intro', true);
runTimer('adios3', 1, 1)
end 
if tag == 'adios3' then
doTweenAlpha('jejeboy', 'intro', 0, 2, 'elasticInOut')
if getPropertyFromClass('indiecrossmenus.MainMenuStateCROSS','psychExtendedVersion') then --Psych Extended 1.0.0 Support
playRandomSound('Cup/intros/normal/', 0, 4, 2)
else
local cupRandomSongs = math.random(0,4)
playSound('Cup/intros/normal/'..cupRandomSongs)
end
runTimer('adios4', 0.5, 1)
end
if tag == 'adios4' then
makeAnimatedLuaSprite('ready_wallop', 'ready_wallop', -610, -100);
addAnimationByPrefix('ready_wallop', 'ready_wallop', 'ready_wallop', 24, true); 
addAnimationByPrefix('ready_wallop', 'ready_wallop', 'ready_wallop2', 24, true);  
objectPlayAnimation('ready_wallop', 'ready_wallop2', true)
setObjectCamera('ready_wallop', 'other');
scaleObject('ready_wallop', 1, 1);
addLuaSprite('ready_wallop', true);
runTimer('adios5', 3.5, 1);
end
if tag == 'adios5' then
removeLuaSprite('ready_wallop')
setProperty('skipCountdown', true)
startCountdown()
   end 
end