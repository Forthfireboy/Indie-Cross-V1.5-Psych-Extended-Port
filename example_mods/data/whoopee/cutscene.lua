function onCreate()
if not seenCutscene and isStoryMode then
runTimer('adios2', 46.7)
startVideo('sans/1');
seenCutscene = true
end
end