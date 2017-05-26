class Site::Profile::AdsController < Site::ProfileController

	def index
		#@ads = current_member.ads
		@ads = Ad.where(member_id: current_member.id)
	end
end
