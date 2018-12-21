class User < ActiveRecord::Base

  def self.authenticate(email, password)
    @user = User.find_by_email_and_password(email, password)

#    if !@user.nil?
#      if @user.authenticate(password)
#        return @user
#      end
#    end

#    return nil
  end

#last end
end
