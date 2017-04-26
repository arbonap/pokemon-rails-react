class CampaignsController < ApplicationController
  def index
   @campaigns = Campaign.all
  if params[:search]
    @campaigns = Campaign.where('title ILIKE ? OR tagline ILIKE ?', "%#{params[:search]}%", "%#{params[:search]}%" )

    fresh_when @campaigns
  end
  @campaigns
  end

  def api_search
    @campaigns = Campaign.all
   if params[:search]
     @campaigns = Campaign.where('title ILIKE ? OR tagline ILIKE ?', "%#{params[:search]}%", "%#{params[:search]}%" )
   end
   if stale?(@campaigns)
     render json: @campaigns
   end
   @campaigns
  end

end
