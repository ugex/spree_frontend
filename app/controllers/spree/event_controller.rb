module Spree
  class EventsController < Spree::StoreController
  	include Spree::Core::ControllerHelpers::Auth
	before_action :correct_user
    before_action :check_authorization
    before_action :logged_in_user
  	def show
  		redirect_to root_url
  	end
	  def logged_in_user
	    unless logged_in?
	      flash[:danger] = "Please log in."
	      redirect_to login_url
	    end
	  end
  	
  	def check_authorization
      authorize!(:edit, current_order, cookies.signed[:guest_token])
    end
    def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
  end

end
