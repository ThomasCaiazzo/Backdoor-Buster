--[[
	Example Anti-Backdoor; Garry's Mod 'backdoor buster'
	Backdoor Buster 0.1a
	by Thomas Caiazzo
	01/21/2020
	Detour underlying API functions with blacklisting data
]]--

print("Loading Backdoor-Buster 0.1a by Thomas Caiazzo");

local BackdoorBuster  = {};
BackdoorBuster.PrintConsoleStack = true; -- Print call stack of detoured function
BackdoorBuster.SpewArguments = false; -- Print detoured functions arguments to console

--[[
	Argument BlackList
	Example prvious found blackdoors
]]--
BackdoorBuster.BlackList = {};
BackdoorBuster.BlackList["FEUfTTZgREUmJMEHccceOEpGSXZAnR"] = true;
BackdoorBuster.BlackList["execc.online"] = true;
BackdoorBuster.BlackList["haylay.tk"] = true;
BackdoorBuster.BlackList["u06q9wb8c9dbrxxz0ddz"] = true;
-- BackdoorBuster.BlackList["ARGUMENT-TO-BLACKLIST"] = true;

BackdoorBuster.OldHookAdd = hook.Add; -- Detour function

function hook.Add(hookname, name, func)
	if BackdoorBuster.SpewArguments then print("Backdoor-Buster:\n", hookname, name) end
	if BackdoorBuster.BlackList(name) then print("Stopped hook.Add backdoor") return false; end
	if BackdoorBuster.PrintConsoleStack then debug.Trace() end
	BackdoorBuster.OldHookAdd(hookname, name, func)
end


BackdoorBuster.OldHttpFetch = http.Fetch; -- Detour function

function http.Fetch(url, func)
	if BackdoorBuster.SpewArguments then print("Backdoor-Buster:\n", url) end
	if BackdoorBuster.BlackList(url) then print("Stopped http.Fetch backdoor") return false; end
	if BackdoorBuster.PrintConsoleStack then debug.Trace() end
	BackdoorBuster.OldHttpFetch(url, func)
end


BackdoorBuster.OldHttpPost = http.Post; -- Detour function

function http.Post(url, paratable, onsuc, onfail, headers)
	if BackdoorBuster.SpewArguments then print("Backdoor-Buster:\n", url, paratable, onsuc, onfail, headers) end
	if BackdoorBuster.BlackList(url) then print("Stopped http.Post backdoor") return false; end
	if BackdoorBuster.PrintConsoleStack then debug.Trace() end
	BackdoorBuster.OldHttpPost(url, postdata, returnfunc)
end


BackdoorBuster.OldRunString = RunString; -- Detour function

function RunString(...)
	if BackdoorBuster.SpewArguments then print("Backdoor-Buster:\n", ...) end -- Spew string to console
	if BackdoorBuster.PrintConsoleStack then debug.Trace() end
	BackdoorBuster.OldRunString(...)
end
