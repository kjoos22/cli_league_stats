class Summoner
    attr_accessor :name, :matches

    def initialize(name, match_history)
        @name = name
        @matches = []
        match_history['matches'].each do |match|          
            @matches << Match.new(match['gameId'], match['champion'],
                                 match['queue'], match['timestamp'])       
        end
        @matches = @matches.sort_by {|match| match.date_time}.reverse
        binding.pry
    end

    def sort_matches
        #@matches.each do 
    end

end