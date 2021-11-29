class CreateComputations < ActiveRecord::Migration[6.1]
  def change
    create_table :computations do |t|
      t.string :function
      t.string :expression

      t.timestamps
    end
  end
end
