class StaticPagesController < ApplicationController
  def home
    @users = User.paginate page: params[:page]
    @list_microposts = Micropost.paginate page: params[:page], per_page: 8
    if logged_in?
      @user_micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate page: params[:page], per_page: 8
    end
  end
end
