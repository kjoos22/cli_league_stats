class API
    @@region

    def self.retrieve_summoner
        select_region
        print "Enter a summoner name: "
        summoner = CLI.get_input.gsub(' ', '%20')

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
            select_region
        end
        @@region = $regions[region]
    end

    def self.select_region
        puts "1. Brazil\n2. Europe Northeast\n3. Europe Northwest\n4. Japan\n"+
        "5. Korea\n6. Latin America North\n7. Latin America South\n8. North "+
        "America\n9. Oceania\n10. Turkey\n11. Russia"
        print "Enter a region #: "
        region = CLI.get_input
        set_region(region)
    end

    def self.summoner_valid?(response)
        #error = response['status']['status code']
        if response['status']
            puts $error_codes[response['status']['status_code']]
            retrieve_summoner
        end
    
    end

    def self.get_match_details(match)
        url = "https://na1.api.riotgames.com/lol/match/v4/matches/" +
        "#{match.matchid}?api_key=#{ENV['API_KEY']}"

        response = JSON.parse(Net::HTTP.get(URI(url)))
        
        response['participantIdentities'].each do |participant|
            if participant['player']['accountId'] == match.summoner.accountID
                match.participantID = participant['participantId']
            end
        end
        binding.pry
        match.result = response[]
    end


    

end
