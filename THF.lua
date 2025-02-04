

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
        ammo="Seething Bomblet +1",
        head="Meghanada Visor +1",
        body={ name="Herculean Vest", augments={'Accuracy+7','Crit.hit rate+3','Quadruple Attack +1','Accuracy+11 Attack+11',}},
        hands={ name="Plun. Armlets +1", augments={'Enhances "Perfect Dodge" effect',}},
        legs="Mummu Kecks +1",
        feet="Jute Boots +1",
        neck="Backlash Torque",
        waist="Windbuffet Belt +1",
        left_ear="Suppanomimi",
        right_ear="Brutal Earring",
        left_ring="Petrov Ring",
        right_ring="Rajas Ring",
        back="Atheling Mantle",
    }

    sets.idle.crafting = {
        head="Shaded Specs.",
        body="Goldsmith's Apron",
        neck="Backlash Torque",
        waist="Goldsmith's Belt",
        left_ring="Artificer's Ring",
    }

    sets.precast.casting = {

    }
    sets.midcast.utsusemi = {

    }

    --stack divine magic skill
    sets.midcast.enlight = {

    }

    sets.melee.tp = {
        ammo="Seething Bomblet +1",
        head="Meghanada Visor +1",
        body={ name="Herculean Vest", augments={'Accuracy+7','Crit.hit rate+3','Quadruple Attack +1','Accuracy+11 Attack+11',}},
        hands={ name="Plun. Armlets +1", augments={'Enhances "Perfect Dodge" effect',}},
        legs="Mummu Kecks +1",
        feet={ name="Herculean Boots", augments={'Mag. Acc.+1','Pet: STR+1','"Treasure Hunter"+1','Accuracy+10 Attack+10','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
        neck="Backlash Torque",
        waist="Windbuffet Belt +1",
        left_ear="Suppanomimi",
        right_ear="Brutal Earring",
        left_ring="Petrov Ring",
        right_ring="Rajas Ring",
        back="Atheling Mantle",
    }

sets.ws.default = {
    ammo="Seething Bomblet +1",
    head="Meghanada Visor +1",
    body={ name="Herculean Vest", augments={'Accuracy+7','Crit.hit rate+3','Quadruple Attack +1','Accuracy+11 Attack+11',}},
    hands="Meg. Gloves +1",
    legs="Mummu Kecks +1",
    feet={ name="Herculean Boots", augments={'Mag. Acc.+1','Pet: STR+1','"Treasure Hunter"+1','Accuracy+10 Attack+10','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
    neck="Breeze Gorget",
    waist="Grunfeld Rope",
    left_ear="Ishvara Earring",
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    right_ring="Rajas Ring",
    back="Atheling Mantle",
    }


end

-- battle_mode = 'idle'

-- --these variables are used for my buff display window, start greyed out
-- enlight_active = "\\cs(130,130,130)Enlight"
-- reprisal_active = "\\cs(130,130,130)Reprisal"
-- phalanx_active = "\\cs(130,130,130)Phalanx"
-- crusade_active = "\\cs(130,130,130)Crusade"
-- majesty_active = "\\cs(130,130,130)Majesty"

-- --custom buff display window
-- gearswap_box = function()
--     display_mode = ''
--     if battle_mode == 'battle' then
--         display_mode = 'Battle Mode'
--     elseif battle_mode == 'idle' then
--         display_mode = 'Idle Mode'
--     else 
--         display_mode = 'Lazy Mode'
--     end
--     str = ''
--     --str = '           \\cs(130,130,130)BLU\a\cr\n'
--     str = str..enlight_active..'\\cr\n'
--     str = str..reprisal_active..'\\cr\n'
--     str = str..phalanx_active..'\\cr\n'
--     str = str..crusade_active..'\\cr\n'
--     str = str..majesty_active..'\\cr\n'
--     str = str..display_mode..'\\cr\n'
--     return str
-- end

-- -- This is what determines the starting location of the buff window
-- -- Update the X, Y positions to change where this box defaults. Once loaded the box is dragable. 
-- gearswap_box_config = {pos={x=1108,y=989},padding=8,text={font='sans-serif',size=10,stroke={width=2,alpha=255},Fonts={'sans-serif'},},bg={alpha=0},flags={}}
-- gearswap_jobbox = texts.new(gearswap_box_config)

-- --shows the buff window
-- function user_setup()
-- 	gearswap_jobbox:text(gearswap_box())		
-- 	gearswap_jobbox:show()
-- end

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

-- --type = ma or ja, etc
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

-- --activates on buff gain or loss, checks the state of each, updates window 
-- function buff_change(buff, gain)
-- 	if buff == 'Enlight' then
--         enlight_active = buff_state('Enlight','Enlight','255,127,0','ma')
--     elseif buff == 'Reprisal' then
--         reprisal_state()
--     elseif buff == 'Phalanx' then
--         phalanx_active = buff_state('Phalanx','Phalanx','255,192,203','ma')
--     elseif buff == 'Enmity Boost' then
--         crusade_active = buff_state('Crusade','Enmity Boost','255,0,0','ma')
--     elseif buff == 'Majesty' then
--         majesty_active = buff_state('Majesty','Majesty','128,0,128','ja')
-- 	end
-- 	gearswap_jobbox:text(gearswap_box())
-- 	gearswap_jobbox:show()
-- end	


-- function precast(spell)
--     equip(sets.precast.casting)
-- end

function precast(spell)

-- The below command is used to cancel old shadows if they can not be overwritten by the newly cased Utsusemi.
    if spell.english == "Utsusemi: Ichi" then
        if buffactive['Copy Image'] then
            send_command('cancel 66')
        elseif buffactive['Copy Image (2)'] then 
            send_command('cancel 444')
        elseif buffactive['Copy Image (3)'] then
            send_command('cancel 445')
        elseif buffactive['Copy Image (4+)'] then
            send_command('cancel 446')
        end
    end

    if spell.english == "Utsusemi: Ni" then
        if buffactive['Copy Image'] then
            send_command('cancel 66')
        elseif buffactive['Copy Image (2)'] then 
            send_command('cancel 444')
        elseif buffactive['Copy Image (3)'] then
            send_command('cancel 445')
        elseif buffactive['Copy Image (4+)'] then
            send_command('cancel 446')
        end
    end
end

function midcast(spell)
    if spell.name:match('Sentinel') or spell.name:match('Rampart') or spell.name:match('Provoke') or spell.name:match('Warcry') then
        equip(sets.midcast.enmity)
    elseif spell.name:match('Flash') or spell.name:match('Reprisal') or spell.name:match('Utsusemi: Ni ') or spell.name:match('Utsusemi: Ichi') then
        equip(sets.midcast.haste)
    elseif spell.name:match('Enlight') then
        equip(sets.midcast.enlight)
    elseif spell.name:match('Cure IV') or spell.name:match('Crusade') then
        equip(sets.midcast.si_down)
    elseif spell.type == 'WeaponSkill' then
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

--for swapping to idle after combat, or tp gear for combat
function status_change(new,old)
    if player.status=='Engaged' then
        equip(sets.melee.tp) 
    else
        equip(sets.idle.normal) 
    end
end

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

send_command('input //org o')

send_command('bind %e gs c Engage')
send_command('bind %^- input /mount Raptor')
send_command('bind %^= input /dismount')

send_command('bind %= input /map')
send_command('bind %q input /ws "Savage Blade" <t>')
send_command('bind %0 input /ra <t>')
send_command('bind %1 input /ma "Utsusemi: Ni" <me>')
send_command('bind %2 input /ma "Utsusemi: Ichi" <me>')
send_command('bind %3 input /ja "Sneak Attack" <me>')
send_command('bind %4 input /ja "Trick Attack"" <me>')
--send_command('bind %4 input /ja Aggressor <me>')
send_command('bind %5 input /ja "Aggressor" <me>')
send_command('bind %6 input /ja Berserk <me>')
send_command('bind %7 input /ja Warcry <me>')
send_command('bind %8 input //trusts party')
-- --send_command('bind %8 input /ja Warcry <me>')
send_command('bind %9 input /ja Provoke <t>')
send_command('bind %o input /ja "Sneak Attack" <me>')
send_command('bind %p input /ja "Trick Attack" <me>')
send_command('bind %l input /ws "Savage Blade" <t>')
send_command('bind %k input /ja Flee <me>')


function self_command(command)
    if command == 'Engage' then
        send_command('input /targetbnpc')
        send_command('input /a')
        send_command('input //sb stat acc Vigrid')
    end
    if command == 'Mount' then
        send_command('input /mount Raptor')
    end
end

-- windower.register_event('tp change', function(new, old)
--     if player.tp >= 1000  then
--         send_command('input /ws \'Dancing Edge\' <t>')
--     -- else
--     --     send_command('input /ma \'Sprout Smack\' <t>')
--     end
-- end)

-- windower.register_event('time change', function(new, old)
--     send_command('input /ja Berserk <me>')
-- end)

-- windower.register_event('gain experience', function(new, old)
--     send_command('wait 2;input //sb stat acc Vigrid')
-- end)

-- --runs the setup for the buff display
-- user_setup()