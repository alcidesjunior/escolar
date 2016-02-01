# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create([{level:1,password: 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'},
	{level:2,password: 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'}])
Discipline.create([
{name: "Português"},
{name: "Matemática"},
{name: "História"},
{name: "Geografia"},
{name: "Química"},
{name: "Física"},
{name: "Biologia"},
{name: "Inglês"}
])
