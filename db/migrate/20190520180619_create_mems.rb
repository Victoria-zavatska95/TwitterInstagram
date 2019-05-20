class CreateMems < ActiveRecord::Migration[5.2]
  def change
    create_table :mems do |t|
      t.string :image

      t.timestamps
    end
  end
end
