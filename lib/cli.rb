class CLI

    def start
        puts "Welcome to CLI_League_Stats!"
        puts "1. Brazil\n2. Europe Northeast\n3. Europe Northwest\n4. Japan\n"+
        "5. Korea\n6. Latin America North\n7. Latin America South\n8. North "+
        "America\n9. Oceania\n10. Turkey\n11. Russia"
        print "Please enter a region #: "
        region = gets().chomp
        print "Please enter a summoner name: "
        summoner = gets()
        summoner = summoner.gsub(' ', '%20').chomp        
        API.retrieve_summoner(summoner)
    end

end