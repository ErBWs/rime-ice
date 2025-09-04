-- toggle_ascii.lua

local toggle_ascii = {}

function toggle_ascii.init(env)
end

function toggle_ascii.func(key, env)
    local engine = env.engine
    local context = env.engine.context

    if  not key:release()
        and (key:repr() == "Control+space")
    then
        local target_state = not context:get_option("ascii_mode")
        if context:is_composing() then
            context:clear_non_confirmed_composition()
            context:commit()
        end
        context:set_option("ascii_mode", target_state)
        return 1
    end
    return 2
end

return toggle_ascii