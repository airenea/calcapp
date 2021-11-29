class CreateDefIntegralComputations < ActiveRecord::Migration[6.1]
  def change
    create_table :def_integral_computations do |t|
      t.string :lower_bound
      t.string :upper_bound
      t.string :expression
      t.string :result

      t.timestamps
    end
  end
end
