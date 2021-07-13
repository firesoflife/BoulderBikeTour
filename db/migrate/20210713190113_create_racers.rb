class CreateRacers < ActiveRecord::Migration[6.1]
  def change
    create_table :racers do |t|
      t.string :f_name
      t.string :l_name
      t.string :city
      t.string :state
      t.decimal :lat, precision: 10, scale: 6
      t.decimal :lng, precision: 10, scale: 6

      t.timestamps
    end
  end
end
