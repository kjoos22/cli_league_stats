class Summoner
    attr_accessor :name, :matches, :sorted_matches

    def initialize(name, match_history)
        @name = name
        @matches = []
        @sorted_matches = {}
        match_history['matches'].each do |match|          
            @matches << Match.new(self, match['gameId'], match['champion'],
                                 match['queue'], match['timestamp'])       
        end
        @matches = @matches.sort_by {|match| match.date_time}.reverse
        sort_matches
    end

    def sort_matches
        @matches.each do |match|
            if !@sorted_matches[match.queue]
                @sorted_matches[match.queue] = []
                @sorted_matches[match.queue] << match
            else
                @sorted_matches[match.queue] << match
            end
        end
        @matches = []
        binding.pry
    end

end