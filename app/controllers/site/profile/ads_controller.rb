class Site::Profile::AdsController < Site::ProfileController
  before_action :set_ad, only: [:edit, :update]

	def index
		#@ads = current_member.ads
		#@ads = Ad.where(member_id: current_member.id)
    @ads = Ad.to_the(current_member)
	end

  def edit
    @categories_for_select = Category.all
    #
  end

  def update
    if @ad.update(params_ad)
      redirect_to site_profile_ads_path, notice: "O anúncio (#{@ad.title}) foi atualizado com sucesso!"
    else
      render :edit
    end
  end

  def new
    @ad = Ad.new
  end

  def create
    @ad = Ad.new(params_ad)
    @ad.member = current_member

    if @ad.save
      redirect_to site_profile_ads_path, notice: "O anúncio (#{@ad.title}) foi criado com sucesso!"
    else
      render :new
    end
  end



  private

  def set_ad
    @ad = Ad.find(params[:id])
  end

  def params_ad
    params.require(:ad).permit(:id, :title, :description, :category_id, :picture, :price)
  end
end
