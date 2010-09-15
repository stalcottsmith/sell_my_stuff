class CreateBids < ActiveRecord::Migration
  def self.up
    create_table :bids do |t|
      t.integer :item_id
      t.integer :bidder_id
      t.integer :offer
      t.datetime :rejected_at
      t.datetime :accepted_at

      t.timestamps
    end
  end

  def self.down
    drop_table :bids
  end
end
