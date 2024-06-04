class('UserData').extends()

function UserData:init()
	local table = playdate.datastore.read()
	self.code = table and table["userCode"] or ""
end

function UserData:verify()
	return self.code ~= ""
end

function UserData:save()
	-- Jon - I had to add a default table here to prevent a crash
	local table = playdate.datastore.read() or {}
	table["userCode"] = self.code
	playdate.datastore.write(table)
end
