class Match
    attr_accessor :matchid, :champion, :result, :queue, :date_time,
                  :summoner, :participantID, :teamID, :kills, :deaths, :assists,
                  :kda, :cs, :gold, :vision_score

    def initialize(summoner, matchid, champion, queue, date_time)
        @summoner = summoner
        @matchid = matchid
        @champion = champion
        @queue = $queue_id[queue]
        @date_time = Time.at(0, date_time, :millisecond)
    end

    def set_participantID(response)
        response['participantIdentities'].each do |participant|
            if participant['player']['accountId'] == self.summoner.accountID
                @participantID = participant['participantId']
            end
        end
    end

    def determine_result(response)
        if response['participants'][@participantID - 1]['stats']['win']
            @result = 'Win'
        else
            @result = 'Loss'
        end
    end

    def set_stats(response)
        stats = response['participants'][@participantID - 1]['stats']
        @kills = stats['kills']
        @deaths = stats['deaths']
        @assists = stats['assists']
        @kda = (@kills + @assists) / @deaths
        @vision_score = stats['visionScore']
        @gold = stats['goldEarned']
        @cs = stats['totalMinionsKilled']
    end


end