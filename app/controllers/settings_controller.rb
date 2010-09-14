class SettingsController < ApplicationController
  include ApplicationHelper
  
  def update
    @setting.update_attributes(params[:setting]) if authorized?
    redirect_to :back
  end

end
