class CreateTangentComputations < ActiveRecord::Migration[6.1]
  def change
    create_table :tangent_computations do |t|
      t.string :point
      t.string :expression
      t.string :result

      t.timestamps
    end
  end
end
