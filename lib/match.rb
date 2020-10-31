class Match
    attr_accessor :matchid, :champion, :result, :queue, :date_time,
                  :summoner, :participantID, :teamID

    def initialize(summoner, matchid, champion, queue, date_time)
        @summoner = summoner
        @matchid = matchid
        @champion = champion
        @queue = $queue_id[queue]
        @date_time = Time.at(0, date_time, :millisecond)
    end

    def determine_result(response)
        if response['participants'][self.participantID - 1]['stats']['win']
            @result = 'Win'
        else
            @result = 'Loss'
        end
    end

    def set_participantID(response)
        response['participantIdentities'].each do |participant|
            if participant['player']['accountId'] == self.summoner.accountID
                @participantID = participant['participantId']
            end
        end
    end

end