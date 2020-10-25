class CLI

    def start
        puts "Welcome to CLI_League_Stats!"
        
        print "Enter a summoner name: "
        summoner = gets()
        summoner = summoner.gsub(' ', '%20').chomp        
        API.retrieve_summoner(summoner)
    end

end