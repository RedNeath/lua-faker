# Faker

Faker is a [lua](https://www.lua.org/) library that generates fake data for you.

Whether you need to bootstrap your database, create good-looking XML documents, fill-in your persistence to stress test it, or anonymize data taken from a production service, Faker is for you.
Faker is heavily inspired by PHP Faker, Perl Faker, Ruby Faker and by Python Faker.

## Example

The default **locale** is `en_US`. Every function that uses a lazy initialization need to be called with `:`:

```lua
local Faker = require('fast-faker')

local faker = Faker:new()
for i = 1, 10 do
        print(faker.randstring())
        print(faker.randint(10))
        print(faker:name())
        print(faker:email())
        print(faker:country())
        print(faker:state())
        print(faker:city())
        print(faker.ssn())
end

-- bbfchjdhaa
-- 1314612416
-- Paul Simmon
-- jack.mccullough@example.com
-- Pitcairn
-- Vermont
-- Locustdale
-- 983-77-4987
```

### Name
The name function generates a couple `<firstname> <surname>`. It takes a table as parameter, which can contain the key `gender`, with a value of:
- `'masculine'` for masculine firstnames;
- or `'feminine'` for feminine firstnames.

### Surname
The surname function generates a surname.

### Firstname
The firstname function generates a first name. It takes a table as parameter, which can contain the key `gender`, with a value of:
- `'masculine'` for masculine first names;
- or `'feminine'` for feminine first names.

### Email
The email function generates a string in the format `<firstname>.<surname>@example.com`. It takes a table as parameter, which can contain the key `gender`, with a value of:
- `'masculine'` for masculine firstnames;
- or `'feminine'` for feminine firstnames.

### City
The city function generates a city name.

### State
The state function generates a state name.

### Country
The country function generates a country name.


## Locales

<details>
        <summary>See supported locales</summary>
        <ul>
                <li>- English (United States of America): <code>en_US</code></li>
                <li>- French: <code>fr_FR</code></li>
                <li>- French (Funny): <code>fr_FN</code></li>
                <li>- Portugese (Brazil): <code>pt_BR</code></li>
        </ul>
</details>

### Change locale

To change `locale`, simply pass a `table` on constructor `new` with this option:

```lua
local Faker = require('faker')

local faker = Faker:new({locale = 'pt_BR'})
for i = 1, 10 do
	print(faker:name())
	print(faker:email())
	print(faker.cpf())
	print(faker.cep())
end

-- Maria da Silva
-- joao.soares@example.com
-- 744.524.429-86
-- 95194-526
```

### Locale specific functions

#### English (United States of America)
| Name | Description | Example result |
|------|-------------|----------------|
| `ssn()` | Generates a random social security number | 983-77-4987 |

#### French
| Name | Description | Example result |
|------|-------------|----------------|
| `siren()` | Generates a random company number | 123456789 |
| `siret()` | Generates a random full company number | 12345678901234 |

#### French (funny)
No specific function for locale.

#### Portugese (Brazil)
| Name | Description | Example result |
|------|-------------|----------------|
| `cep()` |  | 95194-526 |
| `cpf()` |  | 744.524.429-86 |
