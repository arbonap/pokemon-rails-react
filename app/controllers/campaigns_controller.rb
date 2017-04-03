class CampaignsController < ApplicationController
  def index
   @campaigns = Campaign.all
  if params[:search]
    @campaigns = Campaign.where('title LIKE ? OR tagline LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%" )
  end
  @campaigns
  end

  def api_search
    @campaigns = Campaign.all
   if params[:search]
     @campaigns = Campaign.where('title LIKE ? OR tagline LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%" )
   end
   render json: @campaigns
  end
end
