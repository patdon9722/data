
battle_mode = 'idle'
berserk_ready = ''
restraint_ready = ''
warcry_ready = ''
blood_rage_ready = ''
high_jump_ready = ''
jump_ready = ''
aggressor_ready = ''

player = windower.ffxi.get_player()
current_sub = player.sub_job

-- --these variables are used for my buff display window, start greyed out
-- enlight_active = "\\cs(130,130,130)Enlight"
-- reprisal_active = "\\cs(130,130,130)Reprisal"
-- phalanx_active = "\\cs(130,130,130)Phalanx"
-- crusade_active = "\\cs(130,130,130)Crusade"
-- majesty_active = "\\cs(130,130,130)Majesty"

local function convertSeconds(time)
    local days = math.floor(time / 86400)
    local hours = math.floor(math.fmod(time, 86400) / 3600)
    local minutes = math.floor(math.fmod(time, 3600) / 60)
    local seconds = math.floor(math.fmod(time, 60))
    
    local s = tostring(days > 0 and days .. (days == 1 and " day, " or " days, ") or "")
    s = s .. tostring(hours > 0 and hours .. (hours == 1 and ":" or ":") or "")
    s = s .. tostring(minutes > 0 and minutes .. (minutes == 1 and ":" or ":") or "")
    s = s .. tostring(minutes < 1 and ':' or "")
    s = s .. tostring(seconds < 10 and '0' or "")
    s = s .. tostring(seconds == 0 and '0' or "")
    s = s .. tostring(seconds > 0 and seconds or "")
    
    return string.gsub(s, ",[^,]*$", "")
end

function check_recasts()
    if windower.ffxi.get_ability_recasts()[1] > 0 then
        berserk_ready = '\\cs(130,130,130)Berserk  '..convertSeconds(windower.ffxi.get_ability_recasts()[1])
    else
        berserk_ready = "\\cs(255,0,0)Berserk  "
        --if in lazy mode, automatically cast
        if battle_mode = 'lazy' then
            send_command('input /ja Berserk <me>')
        end
    end
end

--custom buff display window
gearswap_box = function()
    display_mode = ''
    if battle_mode == 'battle' then
        display_mode = 'Battle Mode'
    elseif battle_mode == 'idle' then
        display_mode = 'Idle Mode'
    else 
        display_mode = 'Lazy Mode'
    end
    if windower.ffxi.get_ability_recasts()[1] > 0 then
        berserk_ready = '\\cs(130,130,130)Berserk  '..convertSeconds(windower.ffxi.get_ability_recasts()[1])
    else
        berserk_ready = "\\cs(255,0,0)Berserk  "
        --if in lazy mode, automatically cast
        if battle_mode = 'lazy' then
            send_command('input /ja Berserk <me>')
        end
    end
    if windower.ffxi.get_ability_recasts()[4] > 0 then
        aggressor_ready = '\\cs(130,130,130)  Aggressor  '..convertSeconds(windower.ffxi.get_ability_recasts()[4])
    else
        aggressor_ready = "\\cs(255,200,200)  Aggressor"
    end
    if windower.ffxi.get_ability_recasts()[9] > 0 then
        restraint_ready = '\\cs(130,130,130)Restraint  '..convertSeconds(windower.ffxi.get_ability_recasts()[9])
    else
        restraint_ready = "\\cs(255,130,0)Restraint"
    end
    if windower.ffxi.get_ability_recasts()[2] > 0 then
        warcry_ready = '\\cs(130,130,130)Warcry  '..convertSeconds(windower.ffxi.get_ability_recasts()[2])
    else
        warcry_ready = "\\cs(255,130,130)Warcry  "
    end
    if windower.ffxi.get_ability_recasts()[11] > 0 then
        blood_rage_ready = '\\cs(130,130,130)  Blood Rage  '..convertSeconds(windower.ffxi.get_ability_recasts()[11])
    else
        blood_rage_ready = "\\cs(255,0,255)  Blood Rage  "
    end
    if current_sub == 'DRG' then
        if windower.ffxi.get_ability_recasts()[159] > 0 then
            high_jump_ready = '\\cs(130,130,130)High Jump  '..convertSeconds(windower.ffxi.get_ability_recasts()[159])
        else
            high_jump_ready = "\\cs(0,255,200)High Jump  "
        end
        if windower.ffxi.get_ability_recasts()[158] > 0 then
            jump_ready = '\\cs(130,130,130)  Jump  '..convertSeconds(windower.ffxi.get_ability_recasts()[158])
        else
            jump_ready = "\\cs(0,255,0)  Jump"
        end
    end
    str = ''
    str = '           \\cs(130,130,130)WAR / '..current_sub..'\\cr\n'
    str = str..berserk_ready..'\\cr'
    str = str..aggressor_ready..'\\cr\n'
    str = str..restraint_ready..'\\cr\n'
    str = str..warcry_ready..'\\cr'
    str = str..blood_rage_ready..'\\cr\n'
    if current_sub == 'DRG' then
        str = str..high_jump_ready..'\\cr'
        str = str..jump_ready..'\\cr\n'
    end
    str = str..display_mode..'\\cr\n'
    return str
end

-- This is what determines the starting location of the buff window
-- Update the X, Y positions to change where this box defaults. Once loaded the box is dragable. 
gearswap_box_config = {pos={x=1108,y=989},padding=8,text={font='sans-serif',size=10,stroke={width=2,alpha=255},Fonts={'sans-serif'},},bg={alpha=0},flags={}}
gearswap_jobbox = texts.new(gearswap_box_config)

--shows the buff window
function user_setup()
	gearswap_jobbox:text(gearswap_box())		
	gearswap_jobbox:show()
end

-- windower.register_event('time change', function(new, old)
--     user_setup()
-- end)

--try this out
windower.register_event('prerender', function()
    user_setup()
end)
