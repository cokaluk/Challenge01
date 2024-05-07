#Cokaluk Challenge01 WEBD 3011

#2) Create an array of hashes named ‘ghosts’ to hold the following information:
#Inky is 4 years old, loves reindeers and has 25 dollars in the bank.
#Pinky is 5 years old, loves garden tools and has 14 dollars in the bank.
#Blinky is 7 years old, loves ninjas and has 18.03 dollars in the bank.
#Clyde is 6 years old, loves yarn and has 0 dollars in the bank.
#The following snippet of code should be able to process your ghosts array and generate the above italicized text.

ghosts = [
 {:name => 'Inky', :age => 4, :loves => 'reindeers', :net_worth => 25},
 {:name => 'Pinky', :age => 5, :loves => 'garden', :net_worth => 14},
 {:name => 'Blinky', :age => 7, :loves => 'ninjas', :net_worth => 18.03},
 {:name => 'Clyde', :age => 6, :loves => 'yarn', :net_worth => 0}
]

ghosts.each do |ghost|
 ghost_info  = "#{ghost[:name]} is #{ghost[:age]} years old, "
 ghost_info += "loves #{ghost[:loves]} and "
 ghost_info += "has #{ghost[:net_worth]} dollars in the bank."
 puts ghost_info
end


#3.
#Write a script that uses the JSON provided by the dog.ceo API to print out a nicely formatted list of dog breeds and sub-breeds.
#Some starter code:

require 'net/http'
require 'json'
require 'pp'

url = 'https://dog.ceo/api/breeds/list/all'
uri = URI(url)
response = Net::HTTP.get(uri)
dog_breeds = JSON.parse(response) # Convert JSON data into Ruby data.
#pp dog_breeds # pp stands for pretty print.

#puts "#{dog_breeds}"

for dog in dog_breeds["message"]
  puts "*#{dog[0]}"
  for sub_breed in dog[1]
    puts "    *#{sub_breed}"
  end
end

#4
#small dataset
url = 'https://data.winnipeg.ca/resource/d3jk-hb6j.json'
#large dataset 91721 ash
#url = 'https://data.winnipeg.ca/resource/d3jk-hb6j.json?$limit=306000'
uri = URI(url)
response = Net::HTTP.get(uri)
trees = JSON.parse(response)
#pp trees

ashCount = 0

for tree in trees
  if(tree["common_name"].include? "ash")
    ashCount += 1
  end
end

puts "#{ashCount}"
