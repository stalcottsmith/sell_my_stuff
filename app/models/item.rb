class Item < ActiveRecord::Base
  
  has_many :bids
  
  has_attached_file :pic, :styles => { :medium => "800x800>", :thumb => "50x50>" },
                          :path => ":attachment/:id/:style/:filename",
                          :storage => (Rails.env.production? ? :s3 : :s3),
                          :s3_credentials => {:access_key_id     => ENV['S3_KEY'],
                                              :secret_access_key => ENV['S3_SECRET'],
                                              :bucket => 'sell_my_stuff'}

  

  def suggested_offer=(n)
    write_attribute :suggested_offer, n ? (n.to_f*100.0).to_i : n
  end
  
  def suggested_offer
    read_attribute(:suggested_offer) / 100.0 if read_attribute(:suggested_offer)
  end

  def bidding_closed?
    bids.detect {|b| b.accepted? }
  end
  
end
