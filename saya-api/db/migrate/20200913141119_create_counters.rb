class CreateCounters < ActiveRecord::Migration[6.0]
  def change
    create_table :counters do |t|
      t.integer :count

      t.timestamps
    end
  end
end
