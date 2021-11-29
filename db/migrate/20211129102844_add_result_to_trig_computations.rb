class AddResultToTrigComputations < ActiveRecord::Migration[6.1]
  def change
    add_column :trig_computations, :result, :string
  end
end
