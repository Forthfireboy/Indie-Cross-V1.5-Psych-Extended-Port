local playstate = 'PlayState'
function onCreate()
    if string.find(curStage,'field',0,true) ~= nil or curStage == 'devilHall-nightmare' then
        setPropertyFromClass(playstate,'SONG.arrowSkin','cup/Cuphead_NOTE_assets')
    end
end
function onDestroy()
    if string.find(curStage,'field',0,true) ~= nil or curStage == 'devilHall-nightmare' then
        if (getPropertyFromClass(playstate'SONG.arrowSkin')) == 'cup/Cuphead_NOTE_assets' then
            setPropertyFromClass(playstate,'SONG.arrowSkin',nil)
        end
    end
end

function onCreatePost()
    if string.find(curStage,'field',0,true) ~= nil or curStage == 'devilHall-nightmare' then
        for strumLineLength = 0,7 do
            setPropertyFromGroup('strumLineNotes', strumLineLength, 'texture','cup/Cuphead_NOTE_assets')
            setPropertyFromGroup('strumLineNotes', strumLineLength, 'useRGBShader',false)
        end
        for notesLength = 0,getProperty('unspawnNotes.length')-1 do
            if getPropertyFromGroup('unspawnNotes', notesLength, 'noteType') == '' and getPropertyFromGroup('unspawnNotes', notesLength, 'texture') ~= 'cup/Cuphead_NOTE_assets' then
                setPropertyFromGroup('unspawnNotes', notesLength, 'texture', 'cup/Cuphead_NOTE_assets');
                setPropertyFromGroup('unspawnNotes', notesLength, 'rgbShader.enabled', false);
            end
        end
    end
end