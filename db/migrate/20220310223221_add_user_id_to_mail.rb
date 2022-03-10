class AddUserIdToMail < ActiveRecord::Migration[5.2]
  def change
    add_reference :emails, :user, index: true
  end
end
