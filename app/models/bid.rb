class Bid < ActiveRecord::Base
  belongs_to :item
  belongs_to :bidder
  accepts_nested_attributes_for :bidder
  validates_associated :bidder
  
  after_save :notify_bidder_of_status
  
  attr :accepted, :rejected
  
  def accepted=(accepted)
    if accepted && !['0', 0].include?(accepted)
      self.accepted_at = Time.now
    else
      self.accepted_at = nil
    end
  end
  
  def accepted?
    !!accepted_at
  end
  
  def rejected=(rejected)
    if rejected && !['0', 0].include?(rejected)
      self.rejected_at = Time.now 
    else
      self.rejected_at = nil
    end
  end
  
  def rejected?
    !!rejected_at
  end
  
  def offer=(n)
    write_attribute :offer, n ? (n.to_f*100.0).to_i : n
  end
  
  def offer
    read_attribute(:offer) / 100.0 if read_attribute(:offer)
  end
  
  def notify_bidder_of_status
    case
    when accepted?
      BidNotification.deliver_accepted(self)
    when rejected?
      BidNotification.deliver_rejected(self)
    end
  end
  
end
