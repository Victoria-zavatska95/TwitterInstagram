class CreateUserparams < ActiveRecord::Migration[5.2]
  def change
    create_table :userparams do |t|
      t.integer :user_id
      t.string :nick_name
      t.string :avatar

      t.timestamps
    end
  end
end
