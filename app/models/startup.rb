class Startup
    @@all = []
    
    def self.all
        @@all
    end
    
    attr_accessor :name
    attr_reader :founder, :domain
    
    def initialize(name,founder,domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end
    
    def pivot(domain,name)
        @domain = domain
        self.name = name
    end
    
    def self.find_by_founder(founder_name)
        self.all.find {|startup| startup.founder == founder_name}
    end

    def self.domains
        self.all.map {|startup| startup.domain}
    end

    def sign_contract(venture_capitalist,type,investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def funding_rounds
        FundingRound.all.select{|funding_round| funding_round.startup == self}
    end

    
    def num_funding_rounds
        self.funding_rounds.count
    end

    def total_funds
        self.funding_rounds.inject(0) {|memo,funding_round| memo + funding_round.investment}
    end
    
    def investors
        funding_rounds.map {|funding_round| funding_round.venture_capitalist}.uniq
    end

    def big_investors
        self.investors.select {|venture_capitalist| VentureCapitalist.tres_commas_club.include?(venture_capitalist)}
    end 

end
