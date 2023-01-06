--[[
			Ubuntu fix for automatic bluetooth connect on run
				configure start-up to run the command...
					lua ~/Documents/Lua/Projects/BlueTooth_Script/main.lua
      Work in progress...
]]

--local statusCtrl = require("terminal")

local delay = function()
	for i=1,1E8 do
		local x = i
	end
end

--[[local checkStatus = function()
    io.write("Did this work?\t Y/y\n\t")
    local userInput = io.read()    
    local output = false
    if userInput == "Y" or userInput == "y" then 
    	output = true 
    else
    	output = false  
    end
    --(userInput == 'Y' or userInput == 'y') and return true or return false      	
end--]]

local JBL_MAC = "FA:A8:9A:EA:2B:1A"
local status = false
--Reset bluetooth services
--while not status do 
	--Disconnect and Power off BlueTooth if not already
	os.execute("bluetoothctl disconnect")
	delay()
	os.execute("bluetoothctl power off")
	delay()
	--Reset BlueTooth processes
	os.execute("rfkill block bluetooth")
	delay()
	os.execute("rfkill unblock bluetooth")
	delay()
	os.execute("systemctl restart bluetooth")	--fix if things stop working
	delay()
	--Power on Bluetooth
	os.execute("bluetoothctl power on")
	delay()
	--Connect to JBL speaker
	os.execute("bluetoothctl connect " .. JBL_MAC)
	delay()	
	status = true	--statusCtrl.checkStatus()
--end
