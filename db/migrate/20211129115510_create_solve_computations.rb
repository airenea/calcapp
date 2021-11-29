class CreateSolveComputations < ActiveRecord::Migration[6.1]
  def change
    create_table :solve_computations do |t|
      t.string :left_hand
      t.string :right_hand
      t.string :result

      t.timestamps
    end
  end
end
