# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Person.create(name: 'Taro',age: 38, mail: 'taro@yamada');
Person.create(name: 'Hanako',age: 34, mail: 'hanako@flower');
Person.create(name: 'sechiko',age: 56, mail: 'sachiko@happy');

Topic.create(title: 'Rubyでhello world', body: 'おはようございます。サンプルです')
Topic.create(title: 'Perlでhello world', body: 'こんにちは。サンプルです')
Topic.create(title: 'PHPでhello world', body: 'こんばんわ。サンプルです')
Topic.create(title: 'Rubyでhello world no.2', body: 'おはようございます。サンプルです')
Topic.create(title: 'Perlでhello world no.2', body: 'こんにちは。サンプルです')
Topic.create(title: 'PHPでhello world no.2', body: 'こんばんわ。サンプルです')
