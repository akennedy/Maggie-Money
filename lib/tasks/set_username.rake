namespace :maggiemoney do
  task :set_username => :environment do
    User.all.each do |u|
      u.update_attribute(:username, u.email)
    end
  end
end