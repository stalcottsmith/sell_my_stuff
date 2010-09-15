class BidNotification < ActionMailer::Base
  default :from => "steve@talcottsystems.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.bid_notification.accepted.subject
  #
  def accepted(bid)
    @bid = bid
    
    mail :to => bid.bidder.email
    body :bid => bid
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.bid_notification.rejected.subject
  #
  def rejected(bid)
    @bid = bid
    mail :to => bid.bidder.email
    body :bid => bid
  end
end
