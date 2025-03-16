
ability_recasts_file = require('ability_recasts')
require('utility')
include('organizer-lib')
--send_command('bind %= input /map')

send_command('input //lua load enemybar2')
send_command('input //lua load xivparty')

current_sub = player.sub_job
isInCutscene = false
isZoning = false

send_command('input //org o')
send_command('wait 2;input /lockstyleset 3')
send_command('bind %!- input /mount Raptor')
send_command('bind %!= input /dismount')

send_command('bind %= input /map')

send_command('bind %e gs c Engage')
send_command('bind %^0 gs c dt_mode')
send_command('bind %1 input /ja "Third Eye" <me>')
send_command('bind %2 input /ja Aggressor <me>')
send_command('bind %3 input /ja Restraint <me>')
send_command('bind %4 input /ja Retaliation <me>')
send_command('bind %5 input /ja "Blood Rage" <me>')
send_command('bind %6 input /ja Berserk <me>')
send_command('bind %7 input /ja Warcry <me>')
send_command('bind %8 gs c mode')
send_command('bind %^8 gs c ws_mode')
send_command('bind %9 input /ja Provoke <t>')
if current_sub == 'DRG' then
    send_command('bind %o input /ja "High Jump" <t>')
    send_command('bind %p input /ja Jump <t>')
elseif current_sub == 'SAM' then
    send_command('bind %o input /ja "Meditate" <me>')
    send_command('bind %p input /ja Hasso <me>')
end

send_command('bind %l input /ws "Upheaval" <t>')
send_command('bind %k input /ws "Ukko\'s Fury" <t>')
send_command('bind %j input /ws "Steel Cyclone" <t>')
send_command('bind %m input /ws "Fell Cleave" <t>')
send_command('bind %b input /item "Dimensional Ring (Dem)" <me>')
send_command('bind %g gs c guard')

send_command('bind %!1 gs c chango')
send_command('bind %!2 gs c helgo')
send_command('bind %!3 gs c naegling')


function get_sets()

	sets.idle = {} 					-- Leave this empty.
    sets.weapon = {}
    sets.melee = {}
    sets.ws = {}
    --for fastcast gear
    sets.precast = {}               -- leave this empty    
    --for haste/enmity etc. when spell/ja goes off
    sets.midcast = {}               -- leave this empty    
    sets.aftercast = {}             -- leave this empty


    sets.weapon.chango = {
        main= "Chango",
        sub="Duplus Grip",
    }

    sets.weapon.helgo = {
        main= "Helgoland",
        sub="Duplus Grip",
    }

    sets.weapon.naegling = {
        main= "Naegling",
        sub="Blurred shield +1",
    }

    sets.idle.normal = {
        --main={ name="Nixxer", augments={'DMG:+17','STR+15','VIT+15',}},
        ammo="Seething Bomblet +1",
        head="Valorous mask",
        body="Flamma korazin +2",
        hands="Flamma manopolas +2",
        legs="Pummeler's cuisses +2",
        feet="Hermes' sandals",
        neck="Warrior's bead necklace +1",
        waist="Ioskeha belt +1",
        left_ear="Mache Earring",
        right_ear="Brutal Earring",
        left_ring="Flamma Ring",
        right_ring="Petrov Ring",
        back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
    }

    sets.idle.DT = {
        ammo="Seething Bomblet +1",
        head="Sulevia's Mask +1",
        body="Sulevia's Plate. +2",
        hands="Sulev. Gauntlets +2",
        legs="Sulev. Cuisses +2",
        feet="Sulev. Leggings +2",
        neck="Diemer Gorget",
        waist="Ioskeha belt +1",
        left_ear="Mache Earring",
        right_ear="Brutal Earring",
        left_ring="Gelatinous Ring +1",
        right_ring="Jelly Ring",
        back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
    }

    sets.idle.crafting = {
        head="Shaded Specs.",
        body="Goldsmith's Apron",
        neck="Warrior's bead necklace +1",
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

    sets.midcast.berserk = {
        body="Pummeler's lorica +2",
    }

    sets.midcast.warcry = {
        body="Agoge Mask +1",
    }

    sets.midcast.haste = {
    }

    sets.melee.tp = { 
        ammo="Seething Bomblet +1",
        head="Flam. Zucchetto +2",
        body="Flamma korazin +2",
        hands="Flamma manopolas +2",
        legs="Pummeler's cuisses +2",
        feet="Flam. Gambieras +2",
        neck="Warrior's bead necklace +1",
        waist="Ioskeha belt +1",
        left_ear="Mache Earring",
        right_ear="Brutal Earring",
        left_ring="Flamma Ring",
        right_ring="Petrov Ring",
        back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
    }

    sets.ws.default = {
        ammo="Seething Bomblet +1",
        head="Flam. Zucchetto +2",
        body="Pummeler's lorica +2",
        hands="Sulev. Gauntlets +2",
        legs="Sulev. Cuisses +2",
        feet="Sulev. Leggings +2",
        neck="Warrior's bead necklace +1",
        waist="Ioskeha belt +1",
        left_ear="Thrud Earring",
        right_ear="Ishvara Earring",
        left_ring="Shukuyu Ring",
        right_ring="Petrov Ring",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+19 Attack+19','Weapon skill damage +10%',}},
    }

    sets.ws.upheaval = {
        ammo="Seething Bomblet +1",
        head="Flam. Zucchetto +2",
        body="Pummeler's lorica +2",
        hands="Sulev. Gauntlets +2",
        legs="Sulev. Cuisses +2",
        feet="Sulev. Leggings +2",
        neck="Warrior's bead necklace +1",
        waist="Grunfeld rope",
        left_ear="Thrud Earring",
        right_ear="Ishvara Earring",
        left_ring="Shukuyu Ring",
        right_ring="Petrov Ring",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+19 Attack+19','Weapon skill damage +10%',}},
    }

end

lazy_mode = ''
berserk_ready = ''
restraint_ready = ''
warcry_ready = ''
blood_rage_ready = ''
high_jump_ready = ''
jump_ready = ''
meditate_ready = ''
aggressor_ready = ''
ws_mode = ''
dt_mode = ''

--custom buff display window
gearswap_box = function()

    berserk_ready = ability_timer(1,'main')
    --meditate_ready = ability_timer(134,'SAM')  
    aggressor_ready = ability_timer(4, 'main')
    restraint_ready = ability_timer(9, 'main')
    warcry_ready = ability_timer(2, 'main')
    blood_rage_ready = ability_timer(11, 'main')
    warcry_ready = ability_timer(2, 'main')
    high_jump_ready = ability_timer(159, 'DRG')
    jump_ready = ability_timer(158, 'DRG')
    meditate_ready = ability_timer(134,'SAM')

    str = ''
    if player.status == "Engaged" then
        str = '           \\cs(130,130,130)WAR / '..current_sub..'\\cr\n'
        str = str..berserk_ready..'\\cr'
        str = str..aggressor_ready..'\\cr\n'
        str = str..restraint_ready..'\\cr\n'
        str = str..warcry_ready..'\\cr'
        str = str..blood_rage_ready..'\\cr\n'
        if current_sub == 'DRG' then
            str = str..high_jump_ready..'\\cr'
            str = str..jump_ready..'\\cr\n'
        elseif current_sub == 'SAM' then
            str = str..meditate_ready..'\\cr\n'
        end
    end
    str = str..lazy_mode..'  '..ws_mode..'  '..dt_mode..'\\cr\n'
    return str
end

hasso_active = "\\cs(130,130,130)Hasso"

gearswap_box_2 = function()
    str = ''
    if player.status == 'Engaged' then
    -- if current_sub == 'SAM' then
        str = str..hasso_active..'\\cr'
    -- end
    end
    return str
end

-- gearswap_box_3 = function()
--     str = 'TP: '
--     -- if current_sub == 'SAM' then
--     if player.tp <1000 then
--         str = '\\cs(130,130,130)'..str..player.tp
--     elseif player.tp == 3000 then
--         str = '\\cs(0,255,255)'..str..player.tp
--     else
--         str = '\\cs(0,255,0)'..str..player.tp
--     end
--     return str
-- end

-- This is what determines the starting location of the buff window
-- Update the X, Y positions to change where this box defaults. Once loaded the box is dragable. 
gearswap_box_config = {pos={x=1108,y=989},padding=8,text={font='sans-serif',size=10,stroke={width=2,alpha=255},Fonts={'sans-serif'},},bg={alpha=0},flags={}}
gearswap_jobbox = texts.new(gearswap_box_config)

gearswap_box_config_2 = {pos={x=1308,y=989},padding=8,text={font='sans-serif',size=10,stroke={width=2,alpha=255},Fonts={'sans-serif'},},bg={alpha=0},flags={}}
gearswap_jobbox_2 = texts.new(gearswap_box_config_2)

-- gearswap_box_config_3 = {pos={x=950,y=1100},padding=8,text={font='sans-serif',size=10,stroke={width=2,alpha=255},Fonts={'sans-serif'},},bg={alpha=0},flags={}}
-- gearswap_jobbox_3 = texts.new(gearswap_box_config_3)

--shows the buff window
function user_setup()
	gearswap_jobbox:text(gearswap_box())
    gearswap_jobbox_2:text(gearswap_box_2())
    if isInCutscene == false or isZoning == false then
        gearswap_jobbox:show()
        gearswap_jobbox_2:show()
    else
        gearswap_jobbox:hide()
        gearswap_jobbox_2:hide()
    end

    hasso_active = buff_state('Hasso','Hasso','255,127,80','ja')

    -- gearswap_jobbox_3:text(gearswap_box_3())		
	-- gearswap_jobbox_3:show()
end


--activates on buff gain  loss, checks the state of each, updates window 
function buff_change(buff, gain)
	if buff == 'Hasso' then
        hasso_active = buff_state('Hasso','Hasso','255,127,80','ja')
    end
    user_setup()
end	


function precast(spell)
    equip(sets.precast.casting)
end

function midcast(spell)
    if spell.type == 'WeaponSkill' then
        equip(sets.ws.default)
    elseif spell.name:match('Berserk') then
        equip(sets.midcast.berserk)
    elseif spell.name:match('Warcry') then
        equip(sets.midcast.warcry)
    end
end

function aftercast(spell)
    if player.status=='Engaged' then
        if dt_mode == 'DT On'  then
            equip(sets.idle.DT)
        else
            equip(sets.melee.tp) 
        end
    else
        equip(sets.idle.normal) 
    end
end

function idle()
    equip(sets.idle.normal)
end

--equip idle set on zone change
windower.register_event('zone change', function(new, old)
    equip(sets.idle.normal)
    lazy_mode = ''
    user_setup()
end)

--for swapping to idle after combat, or tp gear for combat
function status_change(new,old)
    if player.status=='Engaged' then
        if dt_mode == 'DT On'  then
            equip(sets.idle.DT)
        else
            equip(sets.melee.tp) 
        end
    else
        equip(sets.idle.normal) 
    end
end



function self_command(command)
    if command == 'mode' then
        if lazy_mode == '' then           -- if lazy_mode is idle
            lazy_mode = 'Lazy Mode On'       -- then we set it to battle
            user_setup()
        elseif lazy_mode == 'Lazy Mode On' then          
            lazy_mode = ''        
            user_setup()
        end
    elseif command == 'ws_mode' then
        if ws_mode == '' then      
            ws_mode = 'WS On'      
            user_setup()
        elseif ws_mode == 'WS On' then          
            ws_mode = ''        
            user_setup()
        end
    elseif command == 'dt_mode' then
        if dt_mode == '' then      
            dt_mode = 'DT On'      
            user_setup()
        elseif dt_mode == 'DT On' then          
            dt_mode = ''        
            user_setup()
        end
    elseif command == 'craft' then
        equip(sets.idle.crafting)
    elseif command == 'Engage' then
        send_command('input /targetbnpc')
        send_command('input /a')
        send_command('input //sb stat acc Vigrid')
    elseif command == 'chango' then
        equip(sets.weapon.chango)
    elseif command == 'helgo' then
        equip(sets.weapon.helgo)
    elseif command == 'naegling' then
        equip(sets.weapon.naegling)
    end
end

send_command('bind %!1 gs c chango')
send_command('bind %!2 gs c helgo')
send_command('bind %!3 gs c naegling')

-- windower.register_event('hp change', function(new, old)
--     if player.hp < 1500  then
--         equip(sets.idle.DT)
--     end
-- end) 

windower.register_event('tp change', function(new, old)
    if ws_mode == 'WS On' then

        if player.tp >= 1000  then
            send_command('input /ws \'Upheaval\' <t>')
        end
    end
    --user_setup()
end) 

windower.register_event('time change', function(new, old)
    if lazy_mode == 'Lazy Mode On' then
        if current_sub == 'DRG' then
            auto_ability('Jump','ja','t',false,158)
            auto_ability('High Jump','ja','t',false,159)
        elseif current_sub == 'SAM' then
            auto_ability('Meditate','ja','me',false,134)
            auto_ability('Hasso','ja','me',true)
        end

        if player.status == 'Engaged' then
            auto_ability('Restraint','ja','me',false,9)
            auto_ability('Berserk','ja','me',false,1)
            auto_ability('Aggressor','ja','me',false,4)

            if not (buffactive['Warcry']) then
                auto_ability('Blood Rage','ja','me',false,11)
            end
            if not (buffactive['Blood Rage']) then
                auto_ability('Warcry','ja','me',false,2)
            end
        end
    end
end) 

windower.register_event('prerender', function()
    user_setup()
end)

-- windower.register_event('status change', function(status)
--     if status ~= 4 then -- hide UI during cutscenes
--         isInCutscene = true
--         user_setup()
--     end
-- end)

--hide during zoning
-- windower.register_event('incoming chunk',function(id,original,modified,injected,blocked)
--     if id == 0xB then -- zoning, also happens on log out
--         --utils:log('Zoning...')
--         isZoning = true
--         user_setup()
--     elseif id == 0xA and isZoning then -- also happens on login
--         --utils:log('Zoning done.')
--         isZoning = false
--         user_setup()
--     end
-- end)

--runs the setup for the buff display
user_setup()