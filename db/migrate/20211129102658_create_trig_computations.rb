class CreateTrigComputations < ActiveRecord::Migration[6.1]
  def change
    create_table :trig_computations do |t|
      t.string :function
      t.string :expression
      t.boolean :radians

      t.timestamps
    end
  end
end
