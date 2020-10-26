class Summoner
    attr_accessor :name, :matches

    def initialize(name, match_history)
        @name = name
        @matches = []
        match_history['matches'].each do |match|          
            @matches << Match.new(match['gameID'], match['champion'],
                                 match['queue'])       
        end
        puts @matches
    end
end