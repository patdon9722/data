
ability_recasts_file = require('ability_recasts')
require('utility')
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
send_command('bind %8 gs c mode')
send_command('bind %9 input /ja Provoke <t>')
send_command('bind %o input /ja "High Jump" <t>')
send_command('bind %p input /ja Jump <t>')
send_command('bind %l input /ws "Requiescat" <t>')
send_command('bind %b input /item "Dimensional Ring (Dem)" <me>')
send_command('bind %g gs c guard')


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

lazy_mode = ''
berserk_ready = ''
restraint_ready = ''
warcry_ready = ''
blood_rage_ready = ''
high_jump_ready = ''
jump_ready = ''
aggressor_ready = ''
current_sub = player.sub_job
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
    str = str..lazy_mode..'  '..dt_mode..\\cr\n'
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
    if command == 'mode' then
        if lazy_mode == '' then           -- if lazy_mode is idle
            lazy_mode = 'Lazy Mode ON'       -- then we set it to battle
            user_setup()
        elseif lazy_mode == 'Lazy Mode ON' then          
            lazy_mode = ''        
            user_setup()
        end
    else
        if command == 'craft' then
            equip(sets.idle.crafting)
        elseif command == 'Engage' then
            send_command('input /targetbnpc')
            send_command('input /a')
            send_command('input //sb stat acc Vigrid')
        end
    end
end

windower.register_event('hp change', function(new, old)
    if player.hp < 1500  then
        equip(sets.idle.DT)
    end
end) 

-- windower.register_event('tp change', function(new, old)
--     if lazy_mode == 'lazy' then

--         if player.tp >= 1000  then
--             send_command('input /ws \'Savage Blade\' <t>')
--         end
--     end
--     --user_setup()
-- end) 

windower.register_event('time change', function(new, old)
    if lazy_mode == 'Lazy Mode ON' then
        auto_ability('Jump','ja','t',false,158)
        auto_ability('High Jump','ja','t',false,159)

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

--runs the setup for the buff display
user_setup()