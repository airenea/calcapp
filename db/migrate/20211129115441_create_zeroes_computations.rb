class CreateZeroesComputations < ActiveRecord::Migration[6.1]
  def change
    create_table :zeroes_computations do |t|
      t.string :expression
      t.string :result

      t.timestamps
    end
  end
end
