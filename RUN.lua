ability_recasts_file = require('ability_recasts')
require('utility')


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
send_command('bind %8 gs c mode')
send_command('bind %p gs c lunge')
send_command('bind %t gs c element_switch')
send_command('bind %q input /ws "Spinning Slash" <t>')

-- --send_command('bind %8 input /ja Warcry <me>')
send_command('bind %9 input /ja Provoke <t>')
send_command('bind %o input /ja "Swipe" <t>')
-- send_command('bind %p input /ja Jump <t>')

-- function get_sets()


-- 	sets.idle = {} 					-- Leave this empty.
--     sets.melee = {}
--     sets.ws = {}
--     --f fastcast gear
--     sets.precast = {}               -- leave this empty    
--     --f haste/enmity etc. when spell/ja goes off
--     sets.midcast = {}               -- leave this empty    
--     sets.aftercast = {}             -- leave this empty

--     sets.idle.normal = {
--     }

    -- sets.idle.crafting = {
    --     head="Shaded Specs.",
    --     body="Goldsmith's Apron",
    --     neck="Backlash Tque",
    --     waist="Goldsmith's Belt",
    --     left_ring="Artificer's Ring",
    -- }

--     sets.precast.casting = {
--     }

--     -- sets.midcast.enmity = {
--     -- }

--     -- sets.midcast.haste = {
--     -- }

--     -- --spell interruption rate down and cure IV
--     -- sets.midcast.si_down = {
--     -- }

-- --     sets.melee.tp = {
-- --     }

-- --     sets.ws.default = {
-- --     }


-- -- end

rune_mode = 'Fire'
battle_mode = 'idle'
rune_count = 0
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

function rune_element()
    if rune_mode == 'Fire' then
        return 'Ignis'
    elseif rune_mode == 'Ice' then
        return 'Gelus'
    elseif rune_mode == 'Wind' then
        return 'Flabra'
    elseif rune_mode == 'Earth' then
        return 'Tellus'
    elseif rune_mode == 'Lightning' then
        return 'Sulpor'
    elseif rune_mode == 'Water' then
        return 'Unda'
    elseif rune_mode == 'Light' then
        return 'Lux'
    elseif rune_mode == 'Dark' then
        return 'Tenebrae'
    end
end

runes_abilities =  {'Ignis','Gelus','Flabra','Tellus','Sulpor','Unda','Lux','Tenebrae'}

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
    berserk_ready = ability_timer(1,'WAR')
    meditate_ready = ability_timer(134,'SAM')  
    swordplay_ready = ability_timer(24, 'main')
    swipe_ready = ability_timer(241, 'main')
    lunge_ready = ability_timer(25, 'main')

    str = ''
    str = '           \\cs(130,130,130)RUN / '..current_sub..'\\cr\n'
        str = str..swordplay_ready..'\\cr'
    if current_sub == 'WAR' then
        str = str..berserk_ready..'\\cr\n'
        -- str = str..aggress_ready..'\\cr\n'
        -- str = str..restraint_ready..'\\cr\n'
        -- str = str..warcry_ready..'\\cr'
        -- str = str..blood_rage_ready..'\\cr\n'
    elseif current_sub == 'SAM' then
        str = str..meditate_ready..'\\cr\n'
    end
    str = str..swipe_ready..'\\cr'
    str = str..lunge_ready..'\\cr\n'
    str = str..display_mode..'\\cr\n'
    str = str..rune_mode..'  '
    str = str..rune_count..'\\cr\n'
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

function is_rune_buff(buff)
    for index = 1, #runes_abilities do
        if runes_abilities[index] == buff then
            return true
        end
    end
end   

--activates on buff gain  loss, checks the state of each, updates window 
function buff_change(buff, gain)
	if buff == 'Hasso' then
        hasso_active = buff_state('Hasso','Hasso','255,127,80','ja')
    elseif is_rune_buff(buff) and gain == true then
        rune_count = rune_count + 1
    elseif is_rune_buff(buff) and gain == false then
        rune_count = rune_count - 1
        if rune_count == -1 then
            rune_count = 0
        end
    user_setup()
    end
end	



-- function precast(spell)
--     equip(sets.precast.casting)
-- end

-- function midcast(spell)
--     if spell.name:match('Sentinel')  spell.name:match('Rampart')  spell.name:match('Provoke')  spell.name:match('Warcry') then
--         equip(sets.midcast.enmity)
--     elseif spell.name:match('Flash')  spell.name:match('Reprisal')  spell.name:match('Utsusemi: Ni ')  spell.name:match('Utsusemi: Ichi') then
--         equip(sets.midcast.haste)
--     elseif spell.name:match('Enlight') then
--         equip(sets.midcast.enlight)
--     elseif spell.name:match('Cure IV')  spell.name:match('Crusade') then
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

-- function idle()
--     equip(sets.idle.normal)
-- end

--equip idle set on zone change
windower.register_event('zone change', function(new, old)
    --equip(sets.idle.normal) 
    battle_mode = 'idle'
    user_setup()
end) 

-- --f swapping to idle after combat,  tp gear f combat
-- function status_change(new,old) 
--     if player.status=='Engaged' then
--         equip(sets.melee.tp) 
--     else
--         equip(sets.idle.normal) 
--     end
-- end

function self_command(command)
    if command == 'Engage' then
        send_command('input /targetbnpc')
        --send_command('input /ja Provoke <t>')
        send_command('input /a')
        send_command('input //sb stat acc Vigrid')
    elseif command == 'element_switch' then 
        if rune_mode == 'Fire' then
            rune_mode = 'Ice'
            user_setup()
        elseif rune_mode == 'Ice' then
            rune_mode = 'Wind'
            user_setup()
        elseif rune_mode == 'Wind' then
            rune_mode = 'Earth'
            user_setup()
        elseif rune_mode == 'Earth' then
            rune_mode = 'Lightning'
            user_setup()
        elseif rune_mode == 'Lightning' then
            rune_mode = 'Water'
            user_setup()
        elseif rune_mode == 'Water' then
            rune_mode = 'Light'
            user_setup()
        elseif rune_mode == 'Light' then
            rune_mode = 'Dark'
            user_setup()
        elseif rune_mode == 'Dark' then
            rune_mode = 'Fire'
            user_setup()
        end
    elseif command == 'craft' then
        equip(sets.idle.crafting)
    elseif command == 'lazy' then
        battle_mode = 'lazy'
        user_setup()
    elseif command == 'rune3' then
        rune_count = 3
    elseif command == 'mode' then
        if battle_mode == 'idle'then           -- if battle_mode is idle
            battle_mode = 'lazy'       -- then we set it to battle
            user_setup()
        elseif battle_mode == 'lazy' then          
            battle_mode = 'idle'        
            user_setup()
        end
    end
end

stack_rune = function()
    send_command('gs c rune')
end

windower.register_event('tp change', function(new, old)
    if player.tp >= 1000  then
        send_command('input /ws \'Ground Strike\' <t>')
    -- else
    --     send_command('input /ma \'Sprout Smack\' <t>')
    end

end)

windower.register_event('time change', function(new, old)
    -- if battle_mode == 'lazy' then
    --     if not (buffactive['Sulp']) then
    --         send_command('input /ja Sulp <me>')
    --     end
    --     if rune_count < 3 then
    --         send_command('input /ja Sulp <me>')
    --     end
    -- end


    if battle_mode == 'lazy' then
        auto_ability('Swordplay','ja','me',false,24)
        auto_ability('Meditate','ja','me',false,134)
        auto_ability('Hasso','ja','me',true)
        auto_ability('Swipe','ja','t',false,241)
        if rune_count == 3 then
            auto_ability('Lunge','ja','t',false,25)
        end
        if rune_count < 3 then
            auto_ability(rune_element(),'ja','me',false,10)
        end
    end
end) 

windower.register_event('prerender', function()
    user_setup()
end)

--runs the setup f the buff display
user_setup()