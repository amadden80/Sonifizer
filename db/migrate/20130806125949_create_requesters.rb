class CreateRequesters < ActiveRecord::Migration
  def change
    create_table :requesters do |t|
      t.string :ip
      t.integer :recent_requests
      t.integer :total_requests
      t.boolean :black_list

      t.timestamps
    end
  end
end
