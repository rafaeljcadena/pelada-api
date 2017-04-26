class AddAdminToUsers < ActiveRecord::Migration[5.0]
  def change
  	if (User.where(email: "admin@admin.com").count == 0)
      u = User.new(email: "admin@admin.com", password: "pelada1234", password_confirmation: "pelada1234")
      u.save!
    end
  end
end
