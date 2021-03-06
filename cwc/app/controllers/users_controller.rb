class UsersController < ApplicationController

 before_action :signed_in_user, only: [:edit, :update]
 before_action :correct_user,   only: [:edit, :update]


  def new
  	@user = User.new
  end

  def show

    @user = User.find(params[:id])
        @posts = Array.new #Filter matches here? Exclude User's own posts.

    Post.all.each do |p|
      if (craiglove_for(findauthor(p)) == craiglove_for(@user).reverse) && (findauthor(p).zipcode == @user.zipcode) && (findauthor(p) != @user)
        @posts.push(p)
      end
    end
    @city = @user.zipcode.gsub(/\s+/, "").to_sym
    @results = Craigslist.city(@city).missed_connections.fetch(7)
    @results
  end

  def create
    @user = User.new(strong_user_params)
    if @user.save
      sign_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      @user.save
      redirect_to @user
    else
      render 'edit' 
    end

  end
  

  private

    def strong_user_params
      params.require(:user).permit(:name, :email, :zipcode, :gender, :lookingfor, :age, :password,
                                   :password_confirmation)
    end

    def user_params
      params.require(:user).permit(:name, :email, :zipcode,:gender, :lookingfor, :age, :password, :password_confirmation, :height, :status, :occupation, :bodytype, :haircolor)      
    end


   def correct_user
     @user = User.find(params[:id])
     redirect_to(root_url) unless current_user?(@user)
   end
end
