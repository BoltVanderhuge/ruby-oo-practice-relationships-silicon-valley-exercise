class FundingRound
    @@all = []
    
    def self.all
        @@all
    end
    
    attr_reader :venture_capitalist, :startup, :type, :investment
    
    def initialize(startup, venture_capitalist, type, investment)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        @investment = investment.to_f
        @@all << self
    end
    



end
