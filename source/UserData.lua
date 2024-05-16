class('UserData').extends()

function UserData:init()
	local table = playdate.datastore.read()
	self.code = table and table["userCode"] or ""
end

function UserData:verify()
	return self.code ~= ""
end

function UserData:save()
	local table = playdate.datastore.read()
	table["userCode"] = self.code
	playdate.datastore.write(table)
end