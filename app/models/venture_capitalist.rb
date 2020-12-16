class VentureCapitalist
    @@all = []
    
    def self.all
        @@all
    end
    
    attr_accessor :name, :total_worth
    
    def initialize(name,total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end
    
    def self.tres_commas_club
        self.all.select {|venturecapitalist| venturecapitalist.total_worth >= 1000000000} 
    end

    def offer_contract(startup,type,investment)
        FundingRound.new(startup,self,type,investment)
    end

    def funding_rounds
        FundingRound.all.select{|funding_round| funding_round.venture_capitalist == self}
    end

    def portfolio
        self.funding_rounds.map {|funding_round| funding_round.startup}.uniq
    end

    def biggest_investment
        self.funding_rounds.max_by(&:investment)
        # self.funding_rounds.max_by {|funding_round| funding_round.investment} same!!
    end

    def invested(domain)
        domains = self.funding_rounds.select {|funding_round| funding_round.startup.domain == domain}
        domains.inject(0){|memo, funding_round| memo + funding_round.investment }
    end

end
