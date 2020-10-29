class Match
    attr_accessor :matchid, :champion_played, :result, :queue, :date_time,
                  :summoner

    def initialize(summoner, matchid, champion_played, queue, date_time)
        @summoner = summoner
        @matchid = matchid
        @champion_played = champion_played
        @queue = $queue_id[queue]
        @date_time = Time.at(0, date_time, :millisecond)
    end

    def sort_match(summoner)

              
            
    end

end