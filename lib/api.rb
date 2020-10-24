class API

    def self.retrieve_summoner
        url = "https://na1.api.riotgames.com/lol/summoner/v4/summoners/by-name"+
        "/Lord%20Juicifer?api_key=#{ENV['API_KEY']}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
    end

end