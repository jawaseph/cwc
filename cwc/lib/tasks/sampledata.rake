namespace :db do
 desc "Fill database with sample data"
 task populate: :environment do
   User.create!(name: "Candy Creeper",
                email: "example@creeper.org",
                password: "123456",
                password_confirmation: "123456",
                zipcode: 'new haven ',
                age: 25,
                gender: 'male',
                lookingfor: 'male',
                height: "6'0''",
                status: 'single',
                occupation: 'developer',
                bodytype: 'fluffy',
                haircolor: 'brown'
                )
   99.times do |n|
     fred  = Faker::Name.name
     email = Faker::Internet.email
     password  = "password"
     age = rand(18..89)
     zipcode = craigcitiess(1).sample.to_s
     gender = ['male', 'female'].sample
     lookingfor = ['male', 'female'].sample
     User.create!(name: fred,
                  email: email,
                  password: password,
                  password_confirmation: password,
                  zipcode: zipcode,
                  age: age,
                  gender: gender,
                  lookingfor: lookingfor
                  )
   end

   users = User.all
   5.times do
     content = Faker::Lorem.sentence(5)
     users.each { |user| user.posts.create!(content: content) }
   end
 end
end

  def craigcitiess(input)
    addresses = Array.new()
    cities = Array.new()
    str1_webmarkerstring = '"'
  str2_webmarkerstring = '"'
  str1_citymarkerstring = 'org/"'
  str2_citymarkerstring = '@'
    list = Nokogiri::HTML(open('http://geo.craigslist.org/iso/us')) 
    allcities = list.css("#list").to_s.gsub('<div id="list">', "").gsub('<a href=', "").gsub('><b>', "").gsub('</b>', "").gsub('</a>', "").gsub('</div>', "").gsub('>', "")
    addressvscity = allcities.split('<br')
    addressvscity.each do | element |
      addresses.push(element[/#{str1_webmarkerstring}(.*?)#{str2_webmarkerstring}/m, 1])
      element += '@'
      cities.push(element[/#{str1_citymarkerstring}(.*?)#{str2_citymarkerstring}/m, 1])
    end
    if (input==0)
      Hash[cities.zip(addresses)]
    elsif (input==1)
      cities
    else 
      Hash[addresses.zip(cities)]
     end
  end