ActiveRecord::Base.connection.execute('set statement_timeout to 900000')

user_id = 0

begin
    users = User.joins(:identities).where('users.id > ?', user_id)
          
    users.in_batches(of: 20).each_record do |user|
      new_password = ::User.random_password
      user.password = new_password
      user.password_confirmation = new_password
      user.password_automatically_set = false
      user.save!

      printf("Changed password for user %s\n", user.username)
      user_id = user.id
    end
rescue
    retry  
end
