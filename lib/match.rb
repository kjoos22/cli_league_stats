class Match
    attr_accessor :matchid, :champion, :result, :queue, :date_time,
                  :summoner, :participantID

    def initialize(summoner, matchid, champion, queue, date_time)
        @summoner = summoner
        @matchid = matchid
        @champion = champion
        @queue = $queue_id[queue]
        @date_time = Time.at(0, date_time, :millisecond)
    end


end