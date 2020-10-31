class API
    @@region

    def self.retrieve_summoner
        CLI.select_region
        summoner = CLI.set_summoner

        url = "https://#{@@region}.api.riotgames.com/lol/summoner/v4/summoners"+
        "/by-name/#{summoner}?api_key=#{ENV['API_KEY']}"
        
        response = JSON.parse(Net::HTTP.get(URI(url)))
        summoner_valid?(response)
        accountID = response['accountId']

        url = "https://#{@@region}.api.riotgames.com/lol/match/v4/matchlists/"+
        "by-account/#{accountID}?api_key=#{ENV['API_KEY']}"

        response = JSON.parse(Net::HTTP.get(URI(url)))
        Summoner.new(summoner.gsub('%20', ' '), response, accountID)
    end

    def self.set_region(region)        
        if !$regions.keys.include?(region)
            puts "Invalid selection, try again."
            CLI.select_region
        end
        @@region = $regions[region]
    end

    def self.summoner_valid?(response)
        if response['status']
            puts $error_codes[response['status']['status_code']]
            retrieve_summoner
        end
    end

    def self.get_match_details(match)
        url = "https://na1.api.riotgames.com/lol/match/v4/matches/" +
        "#{match.matchid}?api_key=#{ENV['API_KEY']}"

        response = JSON.parse(Net::HTTP.get(URI(url)))
        
        match.set_participantID(response)
        match.determine_result(response)
        match.set_stats(response)
        CLI.show_match_details(match)
    end    

end
