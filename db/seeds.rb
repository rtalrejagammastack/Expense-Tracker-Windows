# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create([{name:"Rohit",email:"rohit@yopmail.com",password:"123456",phone_number:1234567891}])

# User.find_by_name("Rohit").categories.create([{name:"Personal"},{name:"Family"},{name:"Hidden"}])

# TransactionStatus.create([{name:"Complete"},{name:"Pending"}])

# TransactionType.create([{name:"Expense"},{name:"Income"}])

# TransactionMode.create([{name:"Cash"},{name:"Upi"},{name:"Debt Card"},{name:"Credit Card"}])

ExpenseCategory.create([{name:"Food"},{name:"Health"},{name:"Travel"}])

ExpenseCategory.find_by_name("Food").sub_categories.create([{name:"Zomato"},{name:"Swiggy"}])
ExpenseCategory.find_by_name("Health").sub_categories.create([{name:"Dental"},{name:"Medicines"},{name:"Eye Care"},{name:"Insurance"}])
ExpenseCategory.find_by_name("Travel").sub_categories.create([{name:"Bus"},{name:"Taxi"},{name:"Airplane"},{name:"Train"}])



# User.first.transactions.new(title:"Food Item",amount:420,description:"Good Food",status_id:1,type_id:1,mode_id:2,expense_category_id:1,user_category_id:1,receiver_id:2).
# save 
# OR 
# User.first.categories.first.transactions.new(title:"Food Item",amount:420,description:"Good Food",status_id:1,type_id:1,mode_id:2,expense_category_id:1,payer_id:1,receiver_id:2).save