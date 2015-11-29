# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#users
me =    User.create(username: 'dcousette', first_name: 'DeShawn', last_name: 'Cousette',
            email_address: 'dcousette@gmail.com', password: 'dcousette')
niven = User.create(username: 'niven', first_name: 'Niven', last_name: 'Cousette',
            email_address: 'niven@gmail.com', password: 'niven')
#expenses
house =    Expense.create(name: 'Mortgage', amount: 1000.00 )
gas =      Expense.create(name: 'Gas', amount: 200.00 )
electric = Expense.create(name: 'Electric', amount: 100.00 )

#payments
