module ItemsHelper  
  def current_bidder
    session[:bidder_id] ? Bidder.find(session[:bidder_id]) : Bidder.new
  end
end
