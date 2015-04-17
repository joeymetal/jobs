class AddUserRefToPhones < ActiveRecord::Migration
  def change
    add_reference :phones, :user, index: true
  end
end
