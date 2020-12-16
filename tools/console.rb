require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

quibi = Startup.new("Quibi", "Jeffery Katzenberg", "Entertainment")
bones = Startup.new("bones", "King Skellington", "Spooks")

sharkman = VentureCapitalist.new("Sharkmen", 25000000000)
sharklady = VentureCapitalist.new("Sharklady", 150000000000)
sharkboy = VentureCapitalist.new("Sharkboy", 150)


first = FundingRound.new(bones,sharkman,"Angel",300000)
second = FundingRound.new(quibi,sharklady,"Seed",5000000)
third = FundingRound.new(quibi,sharkman,"Seed 2",2000000)
fourth = FundingRound.new(quibi,sharkman,"Seed 3",1000000)
fifith = FundingRound.new(quibi,sharkboy,"Seed 4",100)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line