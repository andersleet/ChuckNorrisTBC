SLASH_NORRIS1 = "/cn"
SLASH_NORRIS2 = "/chuck"
SLASH_NORRIS3 = "/norris"
SLASH_NORRIS4 = "/chucknorris"
SLASH_NORRIS5 = "/cnf"

function PostFact(input)
	--local sS, sE, cmd, arg = strfind(input, "%s?(%w+)%s?(%d*)")
	local sS, sE, cmd, arg = string.find(input, "%s?(%w+)%s?(%d*)")
	local channel, n, fact = "CHANNEL", 0, ""
	
	local totalFactCount = arrLen(facts)
	
	if (cmd == nil) then									-- just slash command sent, send to general chat
		cmd = "GENERAL"
		n = 1
		arg = 0
	else													-- slash command sent with or without arguments
		if (arg == nil) then								-- no argument
			arg = 0
		elseif (tonumber(arg) == nil) then					-- non-numeric argument
			arg = 0
		else												-- numeric argument (get a specific fact index)
			arg = tonumber(arg)
		end		
		
		if (arg >= totalFactCount) then						-- if argument is larger than fact array, reset to random fact
			arg = 0
		end
	end
		
	if (arg > 0) then										-- specific fact number specified by arg
		fact = GetFact(arg)
	else													-- random fact from fact array
		fact = GetRandomFact(totalFactCount)
	end

	cmd = strupper(cmd)

	if (cmd == "1" or cmd == "GENERAL") then
		n = 1
	elseif (cmd == "2" or cmd == "TRADE") then
		n = 2
	elseif (cmd == "3" or cmd == "LOCALDEFENSE") then
		n = 3
	elseif (cmd == "4" or cmd == "WORLD") then
		n = 4
	elseif (cmd == "S" or cmd == "SAY") then
		channel = "SAY"
	elseif (cmd == "Y" or cmd == "YELL") then
		channel = "YELL"
	elseif (cmd == "P" or cmd == "PARTY") then
		channel = "PARTY"
	elseif (cmd == "G" or cmd == "GUILD") then
		channel = "GUILD"
	elseif (cmd == "O" or cmd == "OFFICER") then
		channel = "OFFICER"
	elseif (cmd == "T" or cmd == "TEST") then
		print(fact)
		do return end
	else
		n = 1	
	end

	SendChatMessage(fact, channel, nil, n)
end

function SlashCmdList.NORRIS(args)
	PostFact(args)
end