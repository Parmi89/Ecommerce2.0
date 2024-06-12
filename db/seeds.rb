# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
admin = Admin.create(email: 'admin@admin.com', password: '123123', password_confirmation: '123123', username: 'admin')
if admin.errors.any?
  puts admin.errors.full_messages
end

user = User.create(email: 'user@user.com', password: '123123', password_confirmation: '123123', username: 'user')
if user.errors.any?
  puts user.errors.full_messages
end