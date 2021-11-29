class CreateLogComputations < ActiveRecord::Migration[6.1]
  def change
    create_table :log_computations do |t|
      t.string :base
      t.string :number
      t.string :result

      t.timestamps
    end
  end
end
