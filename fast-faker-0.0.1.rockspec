package = 'fast-faker'
version = '0.0.1'

source = {
	url = 'git://github.com/RedNeath/lua-faker.git',
	tag = "0.0.1"
}

description = {
	summary = 'Forked from Faker, Fast-Faker is a lua library that generates fake data for you.',
	detailed = [[
Forked from Faker, Fast-Faker is a lua library that generates fake data for you.
Whether you need to bootstrap your database, create good-looking XML documents, fill-in your persistence to stress test it, or anonymize data taken from a production service, Fast-Faker is for you.
]],
	homepage = 'github.com/RedNeath/lua-faker',
	license = 'MIT'
}

dependencies = {
	'lua >= 5.1',
}

build = {
	type = 'none',
	install = {
		lua = {
			['fast-faker.init'] = 'faker/init.lua',
			['fast-faker.generators.en_US'] = 'faker/generators/en_US.lua',
			['fast-faker.generators.pt_BR'] = 'faker/generators/pt_BR.lua',
			['fast-faker.generators.fr_FR'] = 'faker/generators/fr_FR.lua',
			['fast-faker.data.en_US.cities'] = 'faker/data/en_US/cities.lua',
			['fast-faker.data.en_US.countries'] = 'faker/data/en_US/countries.lua',
			['fast-faker.data.en_US.firstnames_female'] = 'faker/data/en_US/firstnames_female.lua',
			['fast-faker.data.en_US.firstnames_male'] = 'faker/data/en_US/firstnames_male.lua',
			['fast-faker.data.en_US.states'] = 'faker/data/en_US/states.lua',
			['fast-faker.data.en_US.surnames'] = 'faker/data/en_US/surnames.lua',
			['fast-faker.data.pt_BR.cities'] = 'faker/data/pt_BR/cities.lua',
			['fast-faker.data.pt_BR.countries'] = 'faker/data/pt_BR/countries.lua',
			['fast-faker.data.pt_BR.firstnames_female'] = 'faker/data/pt_BR/firstnames_female.lua',
			['fast-faker.data.pt_BR.firstnames_male'] = 'faker/data/pt_BR/firstnames_male.lua',
			['fast-faker.data.pt_BR.states'] = 'faker/data/pt_BR/states.lua',
			['fast-faker.data.pt_BR.surnames'] = 'faker/data/pt_BR/surnames.lua',
			['fast-faker.data.fr_FR.cities'] = 'faker/data/fr_FR/cities.lua',
			['fast-faker.data.fr_FR.countries'] = 'faker/data/fr_FR/countries.lua',
			['fast-faker.data.fr_FR.firstnames_female'] = 'faker/data/fr_FR/firstnames_female.lua',
			['fast-faker.data.fr_FR.firstnames_male'] = 'faker/data/fr_FR/firstnames_male.lua',
			['fast-faker.data.fr_FR.states'] = 'faker/data/fr_FR/states.lua',
			['fast-faker.data.fr_FR.surnames'] = 'faker/data/fr_FR/surnames.lua',
		}
	}
}
