class AddUserRefToPins < ActiveRecord::Migration
  def change
    add_reference :pins, :user, index: true, foreign_key: true

    user = User.create(
      first_name: "Sally",
      last_name: "Skillcrusher",
      email: "sallyskillcrusher@example.com",
      password: "s411yg1rl"
    )
    if user.present?
      Pin.all.each do |pin|
        pin.user = user
        pin.save
      end
    else
      puts "User not present"
    end 
  end
end
