class API

    def self.retrieve_summoner(summoner)
        url = "https://na1.api.riotgames.com/lol/summoner/v4/summoners/by-name"+
        "/#{summoner}?api_key=#{ENV['API_KEY']}"
        
        response = JSON.parse(Net::HTTP.get(URI(url)))
        accountID = response['accountId']

        url = "https://na1.api.riotgames.com/lol/match/v4/matchlists/"+
        "by-account/#{accountID}?api_key=#{ENV['API_KEY']}"
        
        puts response
        
    end

end
