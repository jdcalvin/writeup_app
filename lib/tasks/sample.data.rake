namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Admin User",
                 email: "admin@admin.com",
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin: true)
	end
end
