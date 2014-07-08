module UsersHelper
	# Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  # Returns standard craigslist string m4m w4w m4w...

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

  def craigcities()
  	list = Nokogiri::HTML(open('http://geo.craigslist.org/iso/us')) 
  	allcities = list.css("#list").to_s.gsub('<div id="list">', "").gsub('<a href=', "").gsub('><b>', "").gsub('</b>', "").gsub('</a>', "").gsub('</div>', "").gsub('>', "")
  	allcities.split('<br')
  end
end
