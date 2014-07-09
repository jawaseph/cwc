module SessionsHelper

  # def current_user
  #    remember_token = User.digest(cookies[:remember_token])
  #    @current_user ||= User.find_by(remember_token: remember_token)
  #  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end

   def current_user?(user)
     user == current_user
   end

    def sign_in(user)
      remember_token = User.new_remember_token
      cookies.permanent[:remember_token] = remember_token
      user.update_attribute(:remember_token, User.digest(remember_token))
      self.current_user = user
    end

  def signed_in?
      !current_user.nil?
  end


   def redirect_back_or(default)
   redirect_to(session[:return_to] || default)
   session.delete(:return_to)
  end

  def store_location
   session[:return_to] = request.url if request.get?
  end
 	
  def current_user=(user)
    	@current_user = user
  	end

  	def current_user
    	remember_token = User.digest(cookies[:remember_token])
    	@current_user ||= User.find_by(remember_token: remember_token)
  	end

  	def sign_out
    	current_user.update_attribute(:remember_token,
                                  User.digest(User.new_remember_token))
    	cookies.delete(:remember_token)
    	self.current_user = nil
  	end

    def craiglove_for(user)
    answer = ''
      if user.gender == 'male' 
        answer += 'm'
      elsif user.gender == 'female'
        answer += 'w'
      else
        answer += 't'
    end

    if user.lookingfor == 'male'
      answer += '4m'
    elsif user.lookingfor == 'female'
      answer += '4w'
    else
      answer += '4t'
    end

  return answer.reverse 
   end

  def findauthor(post)
    usernumber = post.user_id
    User.find_by(id: usernumber)
  end
  
end
