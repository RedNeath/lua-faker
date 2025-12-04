-- init.lua
-- Generates random names, emails, numbers and etc

local Faker = {}

math.randomseed(math.ceil(os.clock() * 100000000000))
local random = math.random

function Faker:new(o)
	o = o or {locale = 'en_US'}
	local generator = require('fast-faker.generators.' .. o.locale)
	for k, v in pairs(generator) do
		o[k] = v
	end
	setmetatable(o, self)
	self.__index = self
	return o
end

function Faker.randstring(size)
	local piece = tostring(Faker.randint(size or 10))
	if #piece < 7 then piece = '0' .. piece end
	local rstring = {}
	for char in string.gmatch(piece, '.') do
		rstring[#rstring + 1] = string.char((char % 122) + 97)
	end
	return table.concat(rstring)
end

function Faker.randint(size)
	if size then
		local first = '1' .. string.rep('0', size - 1)
		local second = string.rep('9', size)
		return random(first, second)
	else
		return random(9999999999)
	end
end

function Faker:firstname(properties)
	-- Very sus code here
	--

	self.firstnames = {{}, {}}
		-- 1 - feminine
	self.firstnames[1] = require('fast-faker.data.' .. self.locale .. '.firstnames_female')
	-- 2 - masculine
	self.firstnames[2] = require('fast-faker.data.' .. self.locale .. '.firstnames_male')
	function self:firstname(properties)
		properties = properties or {}
		local gender = 1
		if properties.gender == 'masculine' then
			gender = 2
		elseif properties.gender ~= 'feminine' then
			gender = math.random(1, 2)
		end
		return self.firstnames[gender][math.random(1, #self.firstnames[gender])]
	end
	return self:firstname(properties)
end

function Faker:surname()
	self.surnames = require('fast-faker.data.' .. self.locale .. '.surnames')
	function self:surname()
		return self.surnames[math.random(1, #self.surnames)]
	end
	return self:surname()
end

function Faker:name(properties)
	return self:firstname(properties or {}) .. ' ' .. self:surname()
end

function Faker:email(properties)
	local username = self:firstname(properties) .. '.' .. string.gsub(self:surname(), '%s+', '')
	local domain_name = self:company()
	local tld = self:tld()
	return string.gsub(string.lower(self.normalize(username)), "'", '') .. '@' .. string.gsub(string.lower(self.normalize(domain_name)), "'", '') '.' .. tld
end

function Faker:country()
	self.countries = require('fast-faker.data.' .. self.locale .. '.countries')
	function self:country()
		return self.countries[math.random(1, #self.countries)]
	end
	return self:country()
end

function Faker:state()
	self.states = require('fast-faker.data.' .. self.locale .. '.states')
	function self:state()
		return self.states[math.random(1, #self.states)]
	end
	return self:state()
end

function Faker:city()
	self.cities = require('fast-faker.data.' .. self.locale .. '.cities')
	function self:city()
		return self.cities[math.random(1, #self.cities)]
	end
	return self:city()
end

function Faker:company()
	self.companies = require('fast-faker.data.' .. self.locale .. '.companies')
	function self:company()
		return self.companies[math.random(1, #self.companies)]
	end
	return self:company()
end

function Faker:tld()
	self.tlds = require('fast-faker.data.tlds')
	function self:tld()
		return self.tlds[math.random(1, #self.tlds)]
	end
	return self:tld()
end

return Faker
