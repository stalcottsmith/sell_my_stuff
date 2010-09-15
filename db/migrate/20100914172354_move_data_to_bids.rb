class MoveDataToBids < ActiveRecord::Migration
  def self.up
    Item.all(:conditions => "offer IS NOT NULL").each do |item|
      item.bids.create(:offer => item.offer, :bidder => item.bidder)
    end
    remove_column :items, :offer
    remove_column :items, :bidder_id
  end

  def self.down
    raise IrreversibleMigration
  end
end
