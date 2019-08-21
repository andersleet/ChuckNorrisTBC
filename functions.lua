function arrLen(a)
	local i = 1
	for _ in pairs(a) do i = i + 1 end
	return i
end

function GetFact(index)
	return facts[index]
end

function GetRandomFact(max)
	local fN = random(1, max-1)
	print("Norris Fact #" .. fN)
	return GetFact(fN)
end