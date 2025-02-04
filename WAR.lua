

--send_command('bind %= input /map')

send_command('wait 2;input /lockstyleset 3')
send_command('bind %^- input /mount Raptor')
send_command('bind %^= input /dismount')

send_command('bind %= input /map')

send_command('bind %e gs c Engage')
send_command('bind %1 input /ws "Savage Blade" <t>')
send_command('bind %2 input /ja Aggressor <me>')
send_command('bind %3 input /ja Restraint <me>')
send_command('bind %4 input /ja Retaliation <me>')
send_command('bind %5 input /ja "Blood Rage" <me>')
send_command('bind %6 input /ja Berserk <me>')
send_command('bind %7 input /ja Warcry <me>')
--send_command('bind %8 input /ja Warcry <me>')
send_command('bind %9 input /ja Provoke <t>')
send_command('bind %o input /ja "High Jump" <t>')
send_command('bind %p input /ja Jump <t>')
send_command('bind %l input /ws "Requiescat" <t>')

function get_sets()

	sets.idle = {} 					-- Leave this empty.
    sets.melee = {}
    sets.ws = {}
    --for fastcast gear
    sets.precast = {}               -- leave this empty    
    --for haste/enmity etc. when spell/ja goes off
    sets.midcast = {}               -- leave this empty    
    sets.aftercast = {}             -- leave this empty

    sets.idle.normal = {
        --main={ name="Nixxer", augments={'DMG:+17','STR+15','VIT+15',}},
        ammo="Seething Bomblet +1",
        head="Flam. Zucchetto +2",
        body="Sulevia's Plate. +2",
        hands="Sulev. Gauntlets +2",
        legs="Sulev. Cuisses +2",
        feet="Hermes' sandals",
        neck="Warrior's bead necklace",
        waist="Tempus Fugit",
        left_ear="Mache Earring",
        right_ear="Brutal Earring",
        left_ring="Flamma Ring",
        right_ring="Petrov Ring",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+19 Attack+19','Weapon skill damage +10%',}},
    }

    sets.idle.DT = {
        ammo="Seething Bomblet +1",
        head="Sulevia's Mask +1",
        body="Sulevia's Plate. +2",
        hands="Sulev. Gauntlets +2",
        legs="Sulev. Cuisses +2",
        feet="Sulev. Leggings +2",
        neck="Diemer Gorget",
        waist="Tempus Fugit",
        left_ear="Mache Earring",
        right_ear="Brutal Earring",
        left_ring="Gelatinous Ring +1",
        right_ring="Jelly Ring",
        back="Aptitude Mantle",
    }

    sets.idle.crafting = {
        head="Shaded Specs.",
        body="Goldsmith's Apron",
        neck="Warrior's bead necklace",
        waist="Goldsmith's Belt",
        left_ring="Artificer's Ring",
    }

    sets.precast.casting = {
    }
    sets.midcast.utsusemi = {

    }

    sets.midcast.enmity = {
        --main={ name="Nixxer", augments={'DMG:+17','STR+15','VIT+15',}},
        sub="Blurred shield +1",
        head="Bahamut's Mask",
        hands={ name="Versa Mufflers", augments={'"Resist Slow"+3',}},
        legs="Stanch Cuisses",
        feet="Dornen Schuhs",
        neck="Harmonia's Torque",
        waist="Dash Sash",
        left_ear="Hades Earring +1",
        right_ear="Hades Earring +1",
        left_ring="Odium Ring",
        right_ring="Hercules' Ring",
    }

    sets.midcast.haste = {
    }

    sets.melee.tp = {
        
        
        ammo="Seething Bomblet +1",
        head="Flam. Zucchetto +2",
        body="Sulevia's Plate. +2",
        hands="Sulev. Gauntlets +2",
        legs="Sulev. Cuisses +2",
        feet="Flam. Gambieras +2",
        neck="Warrior's bead necklace",
        waist="Tempus Fugit",
        left_ear="Mache Earring",
        right_ear="Brutal Earring",
        left_ring="Flamma Ring",
        right_ring="Petrov Ring",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+19 Attack+19','Weapon skill damage +10%',}},
    }

    sets.ws.default = {
        
        
        ammo="Seething Bomblet +1",
        head="Flam. Zucchetto +2",
        body="Sulevia's Plate. +2",
        hands="Sulev. Gauntlets +2",
        legs="Sulev. Cuisses +2",
        feet="Sulev. Leggings +2",
        neck="Warrior's bead necklace",
        waist="Grunfeld rope",
        left_ear="Thrud Earring",
        right_ear="Ishvara Earring",
        left_ring="Rajas Ring",
        right_ring="Petrov Ring",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+19 Attack+19','Weapon skill damage +10%',}},
    }

end

battle_mode = 'idle'
berserk_ready = ''
restraint_ready = ''
warcry_ready = ''
blood_rage_ready = ''
high_jump_ready = ''
jump_ready = ''
aggressor_ready = ''
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

-- local value = convertSeconds(122)
-- print(value)

-- function disp_time(time)
--     local minutes = math.floor(math.fmod(time,3600)/60)
--     local seconds = math.floor(math.fmod(time,60))
--     return format("%02d:%02d",minutes,seconds)
--   end

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

-- -- The below commands are for controlling the Paldin buff Section.
-- -- These functions check if buffs are active

-- function reprisal_state()
--     if not (buffactive['Reprisal']) then
--         reprisal_active = "\\cs(130,130,130)Reprisal"
--     else
--         reprisal_active = "\\cs(0,128,255)Reprisal"
--     end
-- end

-- function crusade_state()
--     if not (buffactive['Enmity Boost']) then
--         crusade_active = "\\cs(130,130,130)Crusade"
--         if battle_mode == 'battle' then
--             if player.status=='Engaged'  then
--             else
--                 send_command('input /ma Crusade <me>')
--             end
--         end
--         if battle_mode == 'lazy' then
--             send_command('input /ma Crusade <me>')
--         end
--     else
--         crusade_active = "\\cs(255,0,0)Crusade"
--     end
-- end

--type = ma or ja, etc
-- function buff_state(buff,alt_name,color,buff_type)
--     --windower.send_command("console_echo 'return'") --sends echo to console, use to debug
--     if not (buffactive[alt_name]) then
--         if buff_type == 'ma' then
--             if battle_mode == 'battle' then
--                 if player.status=='Engaged'  then
--                 else
--                     send_command('input /ma '..buff..' <me>') -- need spaces after ma and before <me>
--                 end
--             end
--             if battle_mode == 'lazy' then
--                 send_command('input /ma '..buff..' <me>')
--             end
--         else --job ability
--             if battle_mode == 'battle' or battle_mode == 'lazy' then
--                 send_command('input /ja '..buff..' <me>')
--             end
--         end
--         return "\\cs(130,130,130)"..buff --return grey text
--     else
--         return "\\cs("..color..")"..buff
--     end
-- end

-- function majesty_state()
--     if not (buffactive['Majesty']) then
--         if battle_mode == 'battle' then
--             send_command('input /ja Majesty <me>')
--         end
--         if battle_mode == 'lazy' then
--             send_command('input /ja Majesty <me>')
--         end
--     end
--     majesty_active = "\\cs(128,0,128)Majesty"
-- end

--activates on buff gain or loss, checks the state of each, updates window 
function buff_change(buff, gain)
	-- if buff == 'Enlight' then
    --     enlight_active = buff_state('Enlight','Enlight','255,127,0','ma')
    -- elseif buff == 'Reprisal' then
    --     reprisal_state()
    -- elseif buff == 'Phalanx' then
    --     phalanx_active = buff_state('Phalanx','Phalanx','255,192,203','ma')
    -- elseif buff == 'Enmity Boost' then
    --     crusade_active = buff_state('Crusade','Enmity Boost','255,0,0','ma')
    -- elseif buff == 'Majesty' then
    --     majesty_active = buff_state('Majesty','Majesty','128,0,128','ja')
	-- end
	-- gearswap_jobbox:text(gearswap_box())
	-- gearswap_jobbox:show()
end	


function precast(spell)
    equip(sets.precast.casting)
end

function midcast(spell)
    if spell.type == 'WeaponSkill' then
        equip(sets.ws.default)
    end
end

function aftercast(spell)
    if player.status=='Engaged' then
        equip(sets.melee.tp) 
    else
        equip(sets.idle.normal) 
    end
end

-- function filtered_action(spell)
--     if spell.name:match('Majesty') then
--         majesty_state()
--     end
-- end

function idle()
    equip(sets.idle.normal)
end

--equip idle set on zone change
windower.register_event('zone change', function(new, old)
    equip(sets.idle.normal) 
end) 

--for swapping to idle after combat, or tp gear for combat
function status_change(new,old)
    if player.status=='Engaged' then
        equip(sets.melee.tp) 
        --send_command('input /lockstyle on')
    else
        equip(sets.idle.normal) 
        --send_command('input /lockstyle off')
    end
end

function self_command(command)
    local commandArgs = command                 -- First we copy the content of command inside a new variable for our use. 
    if #commandArgs:split(' ') >= 2 then             -- We check if there is 2 or more words in the commandArgs.
            commandArgs = T(commandArgs:split(' '))         -- If there is indeed 2 or more words, we split each words into a different entry, so commandArgs[1] and commandArgs[2] if there was 2 words.
         
        if commandArgs[1]:lower() == "toggle" then      -- the :lower() part makes sure that capital letters are now lowercase, so "Toggle" and "toggle" are both fine. 
            if commandArgs[2]:lower() == "battle_mode" then   -- We passed the first word test, now we check for the 2nd word.
                if battle_mode == 'idle'then           -- if battle_mode is idle
                    battle_mode = 'battle'       -- then we set it to battle
                    user_setup()
                elseif battle_mode == 'battle' then          
                    battle_mode = 'lazy'        
                    user_setup()
                else
                    battle_mode = 'idle'
                    user_setup()
                end
            else
                windower.add_to_chat(123,'Error. 2nd word unkown, don\'t know what to toggle.')
            end
        else
            windower.add_to_chat(123,'Error. The first word is not toggle.')
        end
    else
        if command == 'craft' then
            equip(sets.idle.crafting)
        --windower.add_to_chat(123,'Error. Only 1 word command. Need 2 words')
        elseif command == 'Engage' then
            send_command('input /targetbnpc')
            send_command('input /a')
            send_command('input //sb stat acc Vigrid')
        end
    end
end

-- windower.register_event('hp change', function(new, old)
--     if player.hp < 1500  then
--         equip(sets.idle.DT)
--     end
-- end) 

windower.register_event('tp change', function(new, old)
    if battle_mode == 'lazy' then

        if player.tp >= 1000  then
            send_command('input /ws \'Savage Blade\' <t>')
        end
    end
    user_setup()
end) 

-- windower.register_event('target change', function(new, old)
--     if battle_mode == 'lazy' then
--         windower.send_command("console_echo 'return'"..spell.target.status.." ")
--     end
-- end) 

windower.register_event('time change', function(new, old)
    user_setup()
end)

--runs the setup for the buff display
user_setup()