class Match
    attr_accessor :matchid, :champion_played, :result, :queue, :date_time

    def initialize(matchid, champion_played, queue, date_time)
        @matchid = matchid
        @champion_played = champion_played
        @queue = queue
        @date_time = Time.at(0, date_time, :millisecond)
    end

end