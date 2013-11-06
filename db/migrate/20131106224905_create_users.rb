class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer(10); :phone_number
      t.integer(6); :zipcode
      t.string :username
      t.string :password_digest

      t.timestamps
    end
  end
end
