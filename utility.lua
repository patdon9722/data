ability_recasts_file = require('ability_recasts')

function convertSeconds(time)
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

function ability_timer(id,sub)
    if current_sub == sub or sub == 'main' then
        if windower.ffxi.get_ability_recasts()[id] == nil then
            return 0
        elseif windower.ffxi.get_ability_recasts()[id] > 0 then
            return '\\cs(130,130,130)'..'  '..ability_recasts_file[id].en..'  '..convertSeconds(windower.ffxi.get_ability_recasts()[id])
        else
            return "\\cs(0,130,255)"..'  '..ability_recasts_file[id].en..'  '
        end
    end
end   

function auto_ability(name,category,target,always_on,id)
    if always_on == true then
        if not (buffactive[name]) then
            send_command('input /'..category..' '..name..' <'..target..'>')
        end
    else
        if target == 't' then
            if player.status == "Engaged" and windower.ffxi.get_ability_recasts()[id] == 0 then
                send_command('input /'..category..' '..name..' <'..target..'>')
            end
        elseif windower.ffxi.get_ability_recasts()[id] == 0 then
            send_command('input /'..category..' '..name..' <'..target..'>')
        end
    end   
end

--type = ma  ja, etc
function buff_state(buff,alt_name,col,buff_type)
    --windower.send_command("console_echo 'return'") --sends echo to console, use to debug
    if not (buffactive[alt_name]) then
        return "\\cs(130,130,130)"..buff --return grey text
    else
        return "\\cs("..col..")"..buff
    end

end

-- --custom buff display window
-- timer_box_variable = function(job, display_mode, battle_mode, timers)
--     display_mode = ''
--     if battle_mode == 'battle' then
--         display_mode = 'Battle Mode'
--     elseif battle_mode == 'idle' then
--         display_mode = 'Idle Mode'
--     else 
--         display_mode = 'Lazy Mode'
--     end
--     berserk_ready = ability_timer(1,'WAR')
--     meditate_ready = ability_timer(134,'SAM')  
--     swordplay_ready = ability_timer(24, 'main')
--     swipe_ready = ability_timer(241, 'main')
--     lunge_ready = ability_timer(25, 'main')

--     str = ''
--     str = '           \\cs(130,130,130)RUN / '..current_sub..'\\cr\n'
--         str = str..swordplay_ready..'\\cr'
--     if current_sub == 'WAR' then
--         str = str..berserk_ready..'\\cr\n'
--         -- str = str..aggress_ready..'\\cr\n'
--         -- str = str..restraint_ready..'\\cr\n'
--         -- str = str..warcry_ready..'\\cr'
--         -- str = str..blood_rage_ready..'\\cr\n'
--     elseif current_sub == 'SAM' then
--         str = str..meditate_ready..'\\cr\n'
--     end
--     str = str..swipe_ready..'\\cr'
--     str = str..lunge_ready..'\\cr\n'
--     str = str..display_mode..'\\cr\n'
--     str = str..rune_mode..'  '
--     str = str..rune_count..'\\cr\n'
--     return str
-- end