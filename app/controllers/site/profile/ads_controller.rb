class Site::Profile::AdsController < Site::ProfileController
  before_action :set_ad, only: [:edit]

	def index
		#@ads = current_member.ads
		#@ads = Ad.where(member_id: current_member.id)
    @ads = Ad.to_the(current_member)
	end

  def edit
    #
  end



  private

  def set_ad
    @ad = Ad.find(params[:id])
  end
end
