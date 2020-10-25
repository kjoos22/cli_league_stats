class CLI

    def start
        puts "Welcome to CLI_League_Stats!"
        print "Please enter a summoner name: "
        summoner = gets()
        summoner = summoner.gsub(' ', '%20')
        puts summoner
        API.retrieve_summoner(summoner)
    end

end