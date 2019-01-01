class Follower < ActiveRecord::Base
  belongs_to :user

  def fullname # something like this. probably not needed
    @follower = user.first_name && user.last_name
  end
end
