--[[
		Josh Thurman
		01/02/2023
			Ubuntu fix for automatic bluetooth connect on run
				configure start-up to run the command...
					lua ~/Documents/Lua/Projects/BlueTooth_Script/main.lua
    Work in progress
      Trying to open a terminal for user input and return boolean to main.lua
]]

local delay = function()
	for i=1,1E6 do
		local x = i
	end
end

local checkStatus = function()
    io.write("Did this work?\t Y/y\n\t")
    local userInput = io.read()    
    local output = false
    if userInput == "Y" or userInput == "y" then 
    	output = true 
    else
    	output = false  
    end
    --(userInput == 'Y' or userInput == 'y') and return true or return false      	
    return true
end
