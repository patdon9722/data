
send_command('bind %q gs c Engage')
send_command('bind %1 input /ws "Savage Blade" <t>')
send_command('bind %2 input /ja Palisade <me>')
send_command('bind %3 input /ja Restraint <me>')
send_command('bind %4 input /ja Retaliation <me>')
send_command('bind %5 input /ja "Blood Rage" <me>')
send_command('bind %6 input /ja Berserk <me>')
send_command('bind %7 input /ja Warcry <me>')
--send_command('bind %8 input /ja Warcry <me>')
send_command('bind %9 input /ja Provoke <t>')
send_command('bind %o input /ja "High Jump" <t>')
send_command('bind %p input /ja Jump <t>')

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
        ----sub='Priwen',
        ammo="Thunder Sachet",
        head="Eyepatch",
        body="Sulevia's platemail +2",
        hands="Sulevia's gauntlets +2",
        legs="Crimson Cuisses",
        feet="Sulevia's leggings +2",
        neck="Twilight Torque",
        waist="Sailfi belt",
        left_ear="Brutal Earring",
        right_ear="Upsurge Earring",
        left_ring="Warp Ring",
        right_ring="Rajas RIng",
        back={ name="Rudianos's Mantle", augments={'HP+60','Enmity+10',}},
    }

    sets.idle.crafting = {
        head="Shaded Specs.",
        body="Goldsmith's Apron",
        neck="Backlash Torque",
        waist="Goldsmith's Belt",
        left_ring="Artificer's Ring",
    }

    sets.precast.casting = {
        feet={ name="Odyssean Greaves", augments={'Enmity+3','"--subtle Blow"+2','Quadruple Attack +1','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
        ammo="Incantor stone",
    }
    sets.midcast.utsusemi = {

    }

    sets.midcast.enmity = {
        --main={ name="Nixxer", augments={'DMG:+17','STR+15','VIT+15',}},
        ----sub="Priwen",
        ammo="Thunder Sachet",
        head="Bahamut's Mask",
        body="Valor Surcoat",
        hands={ name="Versa Mufflers", augments={'"Resist Slow"+3',}},
        legs="Stanch Cuisses",
        feet="Dornen Schuhs",
        neck="Harmonia's Torque",
        waist="Creed Baudrier",
        left_ear="Hades Earring +1",
        right_ear="Hades Earring +1",
        left_ring="Odium Ring",
        right_ring="Hercules' Ring",
        back={ name="Rudianos's Mantle", augments={'HP+60','Enmity+10',}},
    }

    sets.midcast.haste = {
        --main={ name="Nixxer", augments={'DMG:+17','STR+15','VIT+15',}},
        --sub="Priwen",
        ammo="Thunder Sachet",
        head="Sulevia's Mask +1",
        body="Sulevia's Plate. +2",
        hands="Sulev. Gauntlets +1",
        legs="Sulevia's Cuisses +2",
        feet={ name="Odyssean Greaves", augments={'Enmity+3','"--subtle Blow"+2','Quadruple Attack +1','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
        neck="Twilight Torque",
        waist="Tempus Fugit",
        left_ear="Brutal Earring",
        right_ear="Upsurge Earring",
        left_ring="Flamma Ring",
        right_ring="Rajas Ring",
        back={ name="Rudianos's Mantle", augments={'HP+60','Enmity+10',}},
    }

    --stack divine magic skill
    sets.midcast.enlight = {
        --main={ name="Nixxer", augments={'DMG:+17','STR+15','VIT+15',}},
        --sub="Priwen",
        ammo="Incantor Stone",
        head="Kahin Turban",
        body="Sulevia's platemail +2",
        hands="Sulevia's gauntlets +2",
        legs="Sulevia's Cuisses +2",
        feet={ name="Odyssean Greaves", augments={'Enmity+3','" ubtle Blow"+2','Quadruple Attack +1','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
        neck="Divine Torque",
        waist="Tempus Fugit",
        left_ear="Brutal Earring",
        right_ear="Upsurge Earring",
        left_ring="Flamma Ring",
        right_ring="Rajas RIng",
        back={ name="Rudianos's Mantle", augments={'HP+60','Enmity+10',}}, 
    }

    --spell interruption rate down and cure IV
    sets.midcast.si_down = {
        ----sub="Priwen",
        ammo="Thunder Sachet",
        head="Sulevia's Mask +1",
        body="Sulevia's platemail +2",
        hands="Sulevia's gauntlets +2",
        legs="Sulevia's Cuisses +2",
        feet={ name="Odyssean Greaves", augments={'Enmity+3','"--subtle Blow"+2','Quadruple Attack +1','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
        neck="Twilight Torque",
        waist="Tempus Fugit",
        left_ear="Brutal Earring",
        right_ear="Upsurge Earring",
        left_ring="Flamma Ring",
        right_ring="Rajas RIng",
        back={ name="Rudianos's Mantle", augments={'HP+60','Enmity+10',}},
    }

    sets.melee.tp = {
        --main={ name="Nixxer", augments={'DMG:+17','STR+15','VIT+15',}},
        ----sub="Priwen",
        ammo="Thunder Sachet",
        head="Sulevia's Mask +1",
        body="Sulevia's platemail +2",
        hands="Sulevia's gauntlets +2",
        legs="Sulevia's Cuisses +2",
        feet="Sulevia's leggings +2",
        neck="Twilight Torque",
        waist="Tempus Fugit",
        left_ear="Brutal Earring",
        right_ear="Upsurge Earring",
        left_ring="Flamma Ring",
        right_ring="Rajas RIng",
        back={ name="Rudianos's Mantle", augments={'HP+60','Enmity+10',}},
    }

    sets.ws.default = {
        --main={ name="Nixxer", augments={'DMG:+17','STR+15','VIT+15',}},
        ----sub="Priwen",
        ammo="Thunder Sachet",
        head="Sulevia's Mask +1",
        body="Sulevia's platemail +2",
        hands="Sulevia's gauntlets +2",
        legs="Sulevia's Cuisses +2",
        feet="Sulevia's leggings +2",
        neck="Breeze Gorget",
        waist="Soil Belt",
        left_ear="Brutal Earring",
        right_ear="Upsurge Earring",
        left_ring="Flamma Ring",
        right_ring="Rajas RIng",
        back="Atheling Mantle",
    }

end

battle_mode = 'idle'

--these variables are used for my buff display window, start greyed out
enlight_active = "\\cs(130,130,130)Enlight"
reprisal_active = "\\cs(130,130,130)Reprisal"
phalanx_active = "\\cs(130,130,130)Phalanx"
crusade_active = "\\cs(130,130,130)Crusade"
majesty_active = "\\cs(130,130,130)Majesty"

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
    str = ''
    --str = '           \\cs(130,130,130)PALADIN\\cr\n'
    str = str..enlight_active..'\\cr\n'
    str = str..reprisal_active..'\\cr\n'
    str = str..phalanx_active..'\\cr\n'
    str = str..crusade_active..'\\cr\n'
    str = str..majesty_active..'\\cr\n'
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

-- The below commands are for controlling the Paldin buff Section.
-- These functions check if buffs are active

function reprisal_state()
    if not (buffactive['Reprisal']) then
        reprisal_active = "\\cs(130,130,130)Reprisal"
    else
        reprisal_active = "\\cs(0,128,255)Reprisal"
    end
end

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
	if buff == 'Enlight' then
        enlight_active = buff_state('Enlight','Enlight','255,127,0','ma')
    elseif buff == 'Reprisal' then
        reprisal_state()
    elseif buff == 'Phalanx' then
        phalanx_active = buff_state('Phalanx','Phalanx','255,192,203','ma')
    elseif buff == 'Enmity Boost' then
        crusade_active = buff_state('Crusade','Enmity Boost','255,0,0','ma')
    elseif buff == 'Majesty' then
        majesty_active = buff_state('Majesty','Majesty','128,0,128','ja')
	end
	gearswap_jobbox:text(gearswap_box())
	gearswap_jobbox:show()
end	


function precast(spell)
    equip(sets.precast.casting)
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
    else
        equip(sets.idle.normal) 
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
        -- windower.add_to_chat(123,'Error. Only 1 word command. Need 2 words')
        end
    end
end

--runs the setup for the buff display
user_setup()