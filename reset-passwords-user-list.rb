ActiveRecord::Base.connection.execute('set statement_timeout to 900000')

user_id = 0

begin
    users = User.joins(:identities).where('users.id > ?', user_id)
          
    users.in_batches(of: 20).each_record do |user|
      # put the user IDs in the array below
      if [1, 2, 3].include? user.id
        new_password = ::User.random_password
        user.password = new_password
        user.password_confirmation = new_password
        user.save!

        printf("Changed password for user %s\n", user.username)
      end
      user_id = user.id
    end
rescue
    retry  
end
