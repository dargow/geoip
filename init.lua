
minetest.register_privilege("geoip", "Player can see Geo info of other players")

local player_list = {}
core.register_on_joinplayer(function(player)
	local player_name = player:get_player_name()
	player_list[player_name] = player
	local ip = minetest.get_player_ip(player_name)

--local path = "5.1/geoip.so" 
--local f = loadlib(path, "geoip")
--local geoip_country = f
--local geodb = assert(geoip_country.open("GeoIP.dat"))
--local ctr = geodb:query_by_addr(ip, "name")
		core.chat_send_all("*** " .. player_name .." joined from ")
	end
end)


