class API
    @@regions = {'1' => 'br1',
                 '2' => 'eun1',
                 '3' => 'euw1',
                 '4' => 'jp1',
                 '5' => 'kr',
                 '6' => 'la1',
                 '7' => 'la2',
                 '8' => 'na1',
                 '9' => 'oc1',
                 '10' => 'tr1',
                 '11' => 'ru'
                }
    @@region

    def self.retrieve_summoner
        select_region
        print "Enter a summoner name: "
        summoner = gets().gsub(' ', '%20').chomp

        url = "https://#{@@region}.api.riotgames.com/lol/summoner/v4/summoners"+
        "/by-name/#{summoner}?api_key=#{ENV['API_KEY']}"
        
        response = JSON.parse(Net::HTTP.get(URI(url)))
        #binding.pry
        summoner_valid?(response)
        accountID = response['accountId']

        url = "https://#{@@region}.api.riotgames.com/lol/match/v4/matchlists/"+
        "by-account/#{accountID}?api_key=#{ENV['API_KEY']}"

        response = JSON.parse(Net::HTTP.get(URI(url)))
    end

    def self.set_region(region)        
        if !@@regions.keys.include?(region)
            puts "Invalid selection, try again."
            select_region
        end
        @@region = @@regions[region]
    end

    def self.select_region
        puts "1. Brazil\n2. Europe Northeast\n3. Europe Northwest\n4. Japan\n"+
        "5. Korea\n6. Latin America North\n7. Latin America South\n8. North "+
        "America\n9. Oceania\n10. Turkey\n11. Russia"
        print "Enter a region #: "
        region = gets().chomp
        set_region(region)
    end

    def self.summoner_valid?(response)
        #error = response['status']['status code']
        if response['status']
            if response['status']['status_code'] == 404
                puts 'Summoner not found.'
            end
            retrieve_summoner
        end
    
    end


    

end
