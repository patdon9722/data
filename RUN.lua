

-- function get_sets()

-- 	sets.idle = {} 					-- Leave this empty.
--     sets.melee = {}
--     sets.ws = {}
--     --for fastcast gear
--     sets.precast = {}               -- leave this empty    
--     --for haste/enmity etc. when spell/ja goes off
--     sets.midcast = {}               -- leave this empty    
--     sets.aftercast = {}             -- leave this empty

--     sets.idle.normal = {
--         --main={ name="Nixxer", augments={'DMG:+17','STR+15','VIT+15',}},
--         ----sub='Priwen',
--         -- ammo="Thunder Sachet",
--         -- head="Eyepatch",
--         -- body="Sulevia's platemail +2",
--         -- hands="Sulevia's gauntlets +2",
--         -- legs="Crimson Cuisses",
--         -- feet="Sulevia's leggings +2",
--         -- neck="Twilight Torque",
--         -- waist="Sailfi belt",
--         -- left_ear="Brutal Earring",
--         -- right_ear="Upsurge Earring",
--         -- left_ring="Warp Ring",
--         -- right_ring="Rajas RIng",
--         -- back={ name="Rudianos's Mantle", augments={'HP+60','Enmity+10',}},
--     }

--     sets.idle.crafting = {
--         head="Shaded Specs.",
--         body="Goldsmith's Apron",
--         neck="Backlash Torque",
--         waist="Goldsmith's Belt",
--         left_ring="Artificer's Ring",
--     }

--     sets.precast.casting = {
--         -- feet={ name="Odyssean Greaves", augments={'Enmity+3','"--subtle Blow"+2','Quadruple Attack +1','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
--         -- ammo="Incantor stone",
--     }
--     sets.midcast.utsusemi = {

--     }

--     -- sets.midcast.enmity = {
--     --     --main={ name="Nixxer", augments={'DMG:+17','STR+15','VIT+15',}},
--     --     ----sub="Priwen",
--     --     ammo="Thunder Sachet",
--     --     head="Bahamut's Mask",
--     --     body="Valor Surcoat",
--     --     hands={ name="Versa Mufflers", augments={'"Resist Slow"+3',}},
--     --     legs="Stanch Cuisses",
--     --     feet="Dornen Schuhs",
--     --     neck="Harmonia's Torque",
--     --     waist="Creed Baudrier",
--     --     left_ear="Hades Earring +1",
--     --     right_ear="Hades Earring +1",
--     --     left_ring="Odium Ring",
--     --     right_ring="Hercules' Ring",
--     --     back={ name="Rudianos's Mantle", augments={'HP+60','Enmity+10',}},
--     -- }

--     -- sets.midcast.haste = {
--     --     --main={ name="Nixxer", augments={'DMG:+17','STR+15','VIT+15',}},
--     --     --sub="Priwen",
--     --     ammo="Thunder Sachet",
--     --     head="Sulevia's Mask +1",
--     --     body="Sulevia's Plate. +2",
--     --     hands="Sulev. Gauntlets +1",
--     --     legs="Sulevia's Cuisses +2",
--     --     feet={ name="Odyssean Greaves", augments={'Enmity+3','"--subtle Blow"+2','Quadruple Attack +1','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
--     --     neck="Twilight Torque",
--     --     waist="Tempus Fugit",
--     --     left_ear="Brutal Earring",
--     --     right_ear="Upsurge Earring",
--     --     left_ring="Flamma Ring",
--     --     right_ring="Rajas Ring",
--     --     back={ name="Rudianos's Mantle", augments={'HP+60','Enmity+10',}},
--     -- }

--     -- --stack divine magic skill
--     -- sets.midcast.enlight = {
--     --     --main={ name="Nixxer", augments={'DMG:+17','STR+15','VIT+15',}},
--     --     --sub="Priwen",
--     --     ammo="Incantor Stone",
--     --     head="Kahin Turban",
--     --     body="Sulevia's platemail +2",
--     --     hands="Sulevia's gauntlets +2",
--     --     legs="Sulevia's Cuisses +2",
--     --     feet={ name="Odyssean Greaves", augments={'Enmity+3','" ubtle Blow"+2','Quadruple Attack +1','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
--     --     neck="Divine Torque",
--     --     waist="Tempus Fugit",
--     --     left_ear="Brutal Earring",
--     --     right_ear="Upsurge Earring",
--     --     left_ring="Flamma Ring",
--     --     right_ring="Rajas RIng",
--     --     back={ name="Rudianos's Mantle", augments={'HP+60','Enmity+10',}}, 
--     -- }

--     -- --spell interruption rate down and cure IV
--     -- sets.midcast.si_down = {
--     --     ----sub="Priwen",
--     --     ammo="Thunder Sachet",
--     --     head="Sulevia's Mask +1",
--     --     body="Sulevia's platemail +2",
--     --     hands="Sulevia's gauntlets +2",
--     --     legs="Sulevia's Cuisses +2",
--     --     feet={ name="Odyssean Greaves", augments={'Enmity+3','"--subtle Blow"+2','Quadruple Attack +1','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
--     --     neck="Twilight Torque",
--     --     waist="Tempus Fugit",
--     --     left_ear="Brutal Earring",
--     --     right_ear="Upsurge Earring",
--     --     left_ring="Flamma Ring",
--     --     right_ring="Rajas RIng",
--     --     back={ name="Rudianos's Mantle", augments={'HP+60','Enmity+10',}},
--     -- }

-- --     sets.melee.tp = {
-- --         --main={ name="Nixxer", augments={'DMG:+17','STR+15','VIT+15',}},
-- --         ----sub="Priwen",
-- --         ammo="Thunder Sachet",
-- --         head="Sulevia's Mask +1",
-- --         body="Sulevia's platemail +2",
-- --         hands="Sulevia's gauntlets +2",
-- --         legs="Sulevia's Cuisses +2",
-- --         feet="Sulevia's leggings +2",
-- --         neck="Twilight Torque",
-- --         waist="Tempus Fugit",
-- --         left_ear="Brutal Earring",
-- --         right_ear="Upsurge Earring",
-- --         left_ring="Flamma Ring",
-- --         right_ring="Rajas RIng",
-- --         back={ name="Rudianos's Mantle", augments={'HP+60','Enmity+10',}},
-- --     }

-- --     sets.ws.default = {
-- --         --main={ name="Nixxer", augments={'DMG:+17','STR+15','VIT+15',}},
-- --         ----sub="Priwen",
-- --         ammo="Thunder Sachet",
-- --         head="Sulevia's Mask +1",
-- --         body="Sulevia's platemail +2",
-- --         hands="Sulevia's gauntlets +2",
-- --         legs="Sulevia's Cuisses +2",
-- --         feet="Sulevia's leggings +2",
-- --         neck="Breeze Gorget",
-- --         waist="Soil Belt",
-- --         left_ear="Brutal Earring",
-- --         right_ear="Upsurge Earring",
-- --         left_ring="Flamma Ring",
-- --         right_ring="Rajas RIng",
-- --         back="Atheling Mantle",
-- --     }


-- -- end

rune_mode = 'none'
battle_mode = 'idle'
berserk_ready = ''
restraint_ready = ''
warcry_ready = ''
blood_rage_ready = ''
swipe_ready = ''
lunge_ready = ''
aggressor_ready = ''
swordplay_ready = ''
hasso_ready = ''
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
    if current_sub == "WAR" then
        if windower.ffxi.get_ability_recasts()[1] > 0 then
            berserk_ready = '\\cs(130,130,130)Berserk  '..convertSeconds(windower.ffxi.get_ability_recasts()[1])
        else
            berserk_ready = "\\cs(255,0,0)Berserk  "
        end
    elseif current_sub == "SAM" then
        if windower.ffxi.get_ability_recasts()[134] > 0 then
            meditate_ready = '\\cs(130,130,130)  Meditate  '..convertSeconds(windower.ffxi.get_ability_recasts()[134])
        else
            meditate_ready = "\\cs(255,127,80)  Meditate  "
        end
    end       
    if windower.ffxi.get_ability_recasts()[24] > 0 then
        swordplay_ready = '\\cs(130,130,130)Swordplay  '..convertSeconds(windower.ffxi.get_ability_recasts()[24])
    else
        swordplay_ready = "\\cs(200,255,0)Swordplay"
    end
    -- if windower.ffxi.get_ability_recasts()[4] > 0 then
    --     aggressor_ready = '\\cs(130,130,130)  Aggressor  '..convertSeconds(windower.ffxi.get_ability_recasts()[4])
    -- else
    --     aggressor_ready = "\\cs(255,200,200)  Aggressor"
    -- end
    -- if windower.ffxi.get_ability_recasts()[9] > 0 then
    --     restraint_ready = '\\cs(130,130,130)Restraint  '..convertSeconds(windower.ffxi.get_ability_recasts()[9])
    -- else
    --     restraint_ready = "\\cs(255,130,0)Restraint"
    -- end
    -- if windower.ffxi.get_ability_recasts()[2] > 0 then
    --     warcry_ready = '\\cs(130,130,130)Warcry  '..convertSeconds(windower.ffxi.get_ability_recasts()[2])
    -- else
    --     warcry_ready = "\\cs(255,130,130)Warcry  "
    -- end
    -- if windower.ffxi.get_ability_recasts()[11] > 0 then
    --     blood_rage_ready = '\\cs(130,130,130)  Blood Rage  '..convertSeconds(windower.ffxi.get_ability_recasts()[11])
    -- else
    --     blood_rage_ready = "\\cs(255,0,255)  Blood Rage  "
    -- end
    if windower.ffxi.get_ability_recasts()[241] > 0 then
        swipe_ready = '\\cs(130,130,130)Swipe  '..convertSeconds(windower.ffxi.get_ability_recasts()[241])
    else
        swipe_ready = "\\cs(0,255,200)Swipe  "
    end
    if windower.ffxi.get_ability_recasts()[25] > 0 then
        lunge_ready = '\\cs(130,130,130)  Lunge  '..convertSeconds(windower.ffxi.get_ability_recasts()[25])
    else
        lunge_ready = "\\cs(0,255,0)  Lunge"
    end
    str = ''
    str = '           \\cs(130,130,130)RUN / '..current_sub..'\\cr\n'
        str = str..swordplay_ready..'\\cr'
    if current_sub == 'WAR' then
        str = str..berserk_ready..'\\cr\n'
        -- str = str..aggressor_ready..'\\cr\n'
        -- str = str..restraint_ready..'\\cr\n'
        -- str = str..warcry_ready..'\\cr'
        -- str = str..blood_rage_ready..'\\cr\n'
    elseif current_sub == 'SAM' then
        str = str..meditate_ready..'\\cr\n'
    end
    str = str..swipe_ready..'\\cr'
    str = str..lunge_ready..'\\cr\n'
    str = str..display_mode..'\\cr\n'
    str = str..rune_mode..'\\cr\n'
    return str
end

hasso_active = "\\cs(130,130,130)Hasso"

gearswap_box_2 = function()
    str = '*'
    -- if current_sub == 'SAM' then
        str = str..hasso_active..'\\cr'
    -- end
    return str
end

-- This is what determines the starting location of the buff window
-- Update the X, Y positions to change where this box defaults. Once loaded the box is dragable. 
gearswap_box_config = {pos={x=1108,y=989},padding=8,text={font='sans-serif',size=10,stroke={width=2,alpha=255},Fonts={'sans-serif'},},bg={alpha=0},flags={}}
gearswap_jobbox = texts.new(gearswap_box_config)

gearswap_box_config_2 = {pos={x=1308,y=989},padding=8,text={font='sans-serif',size=10,stroke={width=2,alpha=255},Fonts={'sans-serif'},},bg={alpha=0},flags={}}
gearswap_jobbox_2 = texts.new(gearswap_box_config_2)

--shows the buff window
function user_setup()
	gearswap_jobbox:text(gearswap_box())		
	gearswap_jobbox:show()

    gearswap_jobbox_2:text(gearswap_box_2())		
	gearswap_jobbox_2:show()
    hasso_active = buff_state('Hasso','Hasso','255,127,80','ja')
end

-- --these variables are used for my buff display window, start greyed out
-- reprisal_active = "\\cs(130,130,130)Reprisal"
-- phalanx_active = "\\cs(130,130,130)Phalanx"
-- crusade_active = "\\cs(130,130,130)Crusade"
-- majesty_active = "\\cs(130,130,130)Majesty"

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
function buff_state(buff,alt_name,color,buff_type)
    --windower.send_command("console_echo 'return'") --sends echo to console, use to debug
    if not (buffactive[alt_name]) then
        if buff_type == 'ma' then
            if battle_mode == 'battle' then
                if player.status=='Engaged'  then
                else
                    send_command('input /ma '..buff..' <me>') -- need spaces after ma and before <me>
                end
            end
            if battle_mode == 'lazy' then
                send_command('input /ma '..buff..' <me>')
            end
        else --job ability
            if battle_mode == 'battle' or battle_mode == 'lazy' then
                send_command('input /ja '..buff..' <me>')
            end
        end
        return "\\cs(130,130,130)"..buff --return grey text
    else
        return "\\cs("..color..")"..buff
    end

end

--activates on buff gain or loss, checks the state of each, updates window 
function buff_change(buff, gain)
	if buff == 'Hasso' then
        hasso_active = buff_state('Hasso','Hasso','255,127,80','ja')
    end
    user_setup()
end	


-- function precast(spell)
--     equip(sets.precast.casting)
-- end

-- function midcast(spell)
--     if spell.name:match('Sentinel') or spell.name:match('Rampart') or spell.name:match('Provoke') or spell.name:match('Warcry') then
--         equip(sets.midcast.enmity)
--     elseif spell.name:match('Flash') or spell.name:match('Reprisal') or spell.name:match('Utsusemi: Ni ') or spell.name:match('Utsusemi: Ichi') then
--         equip(sets.midcast.haste)
--     elseif spell.name:match('Enlight') then
--         equip(sets.midcast.enlight)
--     elseif spell.name:match('Cure IV') or spell.name:match('Crusade') then
--         equip(sets.midcast.si_down)
--     elseif spell.type == 'WeaponSkill' then
--         equip(sets.ws.default)
--     end
-- end

-- function aftercast(spell)
--     if player.status=='Engaged' then
--         equip(sets.melee.tp) 
--     else
--         equip(sets.idle.normal) 
--     end
-- end

-- -- function filtered_action(spell)
-- --     if spell.name:match('Majesty') then
-- --         majesty_state()
-- --     end
-- -- end

-- function idle()
--     equip(sets.idle.normal)
-- end

-- --equip idle set on zone change
-- windower.register_event('zone change', function(new, old)
--     equip(sets.idle.normal) 
-- end) 

-- --for swapping to idle after combat, or tp gear for combat
-- function status_change(new,old)
--     if player.status=='Engaged' then
--         equip(sets.melee.tp) 
--     else
--         equip(sets.idle.normal) 
--     end
-- end

-- function self_command(command)
--     local commandArgs = command                 -- First we copy the content of command inside a new variable for our use. 
--     if #commandArgs:split(' ') >= 2 then             -- We check if there is 2 or more words in the commandArgs.
--             commandArgs = T(commandArgs:split(' '))         -- If there is indeed 2 or more words, we split each words into a different entry, so commandArgs[1] and commandArgs[2] if there was 2 words.
         
--         if commandArgs[1]:lower() == "toggle" then      -- the :lower() part makes sure that capital letters are now lowercase, so "Toggle" and "toggle" are both fine. 
--             if commandArgs[2]:lower() == "battle_mode" then   -- We passed the first word test, now we check for the 2nd word.
--                 if battle_mode == 'idle'then           -- if battle_mode is idle
--                     battle_mode = 'battle'       -- then we set it to battle
--                     user_setup()
--                 elseif battle_mode == 'battle' then          
--                     battle_mode = 'lazy'        
--                     user_setup()
--                 else
--                     battle_mode = 'idle'
--                     user_setup()
--                 end
--             else
--                 windower.add_to_chat(123,'Error. 2nd word unkown, don\'t know what to toggle.')
--             end
--         else
--             windower.add_to_chat(123,'Error. The first word is not toggle.')
--         end
--     else
--         if command == 'craft' then
--         equip(sets.idle.crafting)
--         -- windower.add_to_chat(123,'Error. Only 1 word command. Need 2 words')
--         end
--     end
-- end


send_command('bind %e gs c Engage')
send_command('bind %o gs c swipe')
send_command('bind %0 input /ma "Flash" <t>')
send_command('bind %1 input /ja "Third Eye" <me>')
send_command('bind %2 input /ja Vallation <me>')
send_command('bind %3 gs c rune')
-- send_command('bind %4 input /ja Retaliation <me>')
send_command('bind %5 input /ja "Swordplay" <me>')
if current_sub == 'WAR' then
    send_command('bind %6 input /ja "Berserk" <me>')
elseif current_sub == 'SAM' then
    send_command('bind %6 input /ja Hasso <me>')
    send_command('bind %m input /ja Meditate <me>')
end   
send_command('bind %p gs c lunge')

-- --send_command('bind %8 input /ja Warcry <me>')
send_command('bind %9 input /ja Provoke <t>')
-- send_command('bind %o input /ja "Swipe" <t>')
-- send_command('bind %p input /ja Jump <t>')

function self_command(command)
    if command == 'Engage' then
        send_command('input /targetbnpc')
        --send_command('input /ja Provoke <t>')
        send_command('input /a')
        send_command('input //sb stat acc Vigrid')
    elseif command == 'thunder' then 
        rune_mode = 'Thunder'
        user_setup()
    elseif command == 'ice' then 
        rune_mode = 'Ice'
        user_setup()
    elseif command == 'light' then 
        rune_mode = 'Light'
        user_setup()
    elseif command == 'dark' then 
        rune_mode = 'Dark'
        user_setup()
        elseif command == 'dark' then 
        rune_mode = 'Dark'
        user_setup()
    elseif command == 'rune' then
        if rune_mode == 'Thunder' then
            send_command('input /ja Sulpor <me>')
        elseif rune_mode == 'Ice' then
            send_command('input /ja Gelus <me>')
        elseif rune_mode == 'Dark' then
            send_command('input /ja Tenebrae <me>')
        end
    elseif command == 'swipe' then
        send_command('input /ja Swipe <t>')
        --send_command('input /wait 2')
        coroutine.schedule(stack_rune,2)
    elseif command == 'lunge' then
        send_command('input /ja Lunge <t>')
        --send_command('input /wait 2')
        coroutine.schedule(stack_rune,2)

    end
end

stack_rune = function()
    send_command('gs c rune')
end

windower.register_event('tp change', function(new, old)
    if player.tp >= 1000  then
        send_command('input /ws \'Spinning Slash\' <t>')
    -- else
    --     send_command('input /ma \'Sprout Smack\' <t>')
    end
end)

windower.register_event('time change', function(new, old)
    user_setup()
end)

--runs the setup for the buff display
user_setup()