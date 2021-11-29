class AddResultToComputations < ActiveRecord::Migration[6.1]
  def change
    add_column :computations, :result, :string
  end
end
