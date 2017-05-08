--------------
--Privileges--
--------------
	
minetest.register_privilege("geoip_hide", "Players can hide Geo info from other players")
minetest.register_privilege("geoip_eq", "Set Equestria as join country")



local player_list = {}
core.register_on_joinplayer(function(player)
	local player_name = player:get_player_name()
	player_list[player_name] = player
	local ip = minetest.get_player_ip(player_name)

local geoip_country = require 'geoip.country'
local geodb = assert(geoip_country.open("GeoIP.dat"))
local ctr = geodb:query_by_addr(ip, "name")

----------
--Colorize
----------

local pn = player_name
--local ctr = country({color = {r = 0, g = 0, b = 255}})


if minetest.get_player_privs(player_name).geoip_eq 
then
		core.chat_send_all("*** " .. pn .." joined the game from Equestria")
		return pn
elseif
	minetest.get_player_privs(player_name).geoip_hide
then
	core.chat_send_all("*** " .. pn .." joined the game")
else
		core.chat_send_all("*** " .. pn .." joined from " .. ctr)		
	end
end)


    
    