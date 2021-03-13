class CreateGyms < ActiveRecord::Migration[6.1]
  def change
    create_table :gyms do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :lat
      t.string :lon

      t.timestamps
    end
  end
end
