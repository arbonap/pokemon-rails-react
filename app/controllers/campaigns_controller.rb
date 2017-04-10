class CampaignsController < ApplicationController
  def index
   @campaigns = Campaign.all
  if params[:search]
    @campaigns = Campaign.where('title LIKE ? OR tagline LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%" )

    fresh_when @campaigns
  end
  @campaigns
  end

  def api_search
    @campaigns = Campaign.all
   if params[:search]
     @campaigns = Campaign.where('title LIKE ? OR tagline LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%" )
   end
   if stale?(@campaigns) #does this stale? method actually work?
     render json: @campaigns
   end
  end
end
