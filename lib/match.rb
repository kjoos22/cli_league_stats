class Match
    attr_accessor :id, :champion_played, :result, :queue

    def initialize(id, champion_played, queue)
        @id = id
        @champion_played = champion_played
        @queue = queue
    end

end