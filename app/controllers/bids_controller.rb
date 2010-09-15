class BidsController < ApplicationController

  def create
    @bid = Bid.new(params[:bid])

    respond_to do |format|
      if @bid.save
        session[:bidder] = @bid.bidder
        format.html { redirect_to(root_path, :notice => 'Bid was successfully created.') }
        format.xml  { render :xml => @bid, :status => :created, :location => @bid }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bid.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bids/1
  # PUT /bids/1.xml
  def update
    @bid = Bid.find(params[:id])
    respond_to do |format|
      if @bid.update_attributes(params[:bid])
        format.html { redirect_to(root_path, :notice => 'Bid was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { redirect_to(root_path, :notice => 'Bid could not be updated.') }
        format.xml  { render :xml => @bid.errors, :status => :unprocessable_entity }
      end
    end
  end
  
end
