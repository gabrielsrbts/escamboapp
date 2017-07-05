class Site::AdDetailController < SiteController

  def show
    set_ad
  end

  private
    def set_ad
      @ad = Ad.find(params[:id])
    end
end
