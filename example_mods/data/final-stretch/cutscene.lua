function onCreate()
if not seenCutscene and isStoryMode then
startVideo('sans/3');
end
end

local wey = true
local seenCutscene2 = false

function onEndSong()
if not seenCutscene2 and isStoryMode  then
startVideo('sans/4');
seenCutscene2 = true	
return Function_Stop
end
if wey == true then
return Function_Continue
end
end