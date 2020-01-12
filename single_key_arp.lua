scale = Menu("Scale", {"Major", "Minor"})
octave_count = Knob{"Octave", 1, 1, 3, true, displayName = "Octave Count"}

beat = .5
function onNote(e)
    while isNoteHeld() do
        for i = 0, octave_count.value - 1, 1 do
            local oct_semi = i * 12
            local semis = {oct_semi, oct_semi + 4, oct_semi + 7}
            for k, v in ipairs(semis) do
                if (isNoteHeld()) then
                    playNote(e.note + v, e.velocity, beat2ms(beat))
                    waitBeat(beat)
                end
            end
        end
    end
end

function onRelease(e)
end