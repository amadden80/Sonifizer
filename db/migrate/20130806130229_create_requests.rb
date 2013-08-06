class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :request_type
      t.integer :requester_id

      t.timestamps
    end
  end
end
