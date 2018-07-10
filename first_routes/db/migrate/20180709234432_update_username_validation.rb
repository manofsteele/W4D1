class UpdateUsernameValidation < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.remove :username 
      t.string :username, null: false 
    end 
    
    add_index :users, :username, unique: true
  end
end
