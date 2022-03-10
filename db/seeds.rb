# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


6.times do |i|
    post = Note.create(title:"noteTitle n°#{i + 1}", content:"AJAX Training for the real", completed: false)
    email = Email.create(object: "Email Object", body: "Email Body")
end