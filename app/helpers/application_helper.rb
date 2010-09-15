module ApplicationHelper
  def authorized?
    session[:secret].eql?(ENV['sekret'] || "hi n00b")
  end
  
  def bid_class(bid)
    case 
    when bid.rejected?
      'rejected'
    when bid.accepted?
      'accepted'
    else
      'in-play'
    end
  end
  
  def link_to_delete(text='Delete', url=nil, success="alert('deleted')")
    link_to_function(text, "$.ajax({type: 'DELETE', url: '#{url}', success: function(data) {
      #{success}
    }})")
  end
end
