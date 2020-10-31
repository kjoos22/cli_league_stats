class CLI

    def start
        puts "Welcome to CLI_League_Stats!" 
        API.retrieve_summoner
    end

    def self.get_input
        gets.chomp
    end

    def self.select_region
        puts "1. Brazil\n2. Europe Northeast\n3. Europe Northwest\n4. Japan\n"+
        "5. Korea\n6. Latin America North\n7. Latin America South\n8. North "+
        "America\n9. Oceania\n10. Turkey\n11. Russia"
        print "Enter a region #: "
        region = CLI.get_input
        API.set_region(region)
    end

    def self.summoner_matches(summoner)
        puts "#{summoner.name} has played matches in the following queues:"
        x = 1
        summoner.sorted_matches.keys.sort.each do |queue|
            puts "#{x}. #{queue}"
            x += 1
        end
        print "Enter a queue # to see matches: "
        queue = summoner.sorted_matches.keys.sort[CLI.get_input.to_i - 1]
        show_matches(queue, summoner)
    end

    def self.show_matches(queue, summoner)
        x = 1
        summoner.sorted_matches[queue].each do |match|
            puts "#{x}"+". " + "#{match.date_time.strftime('%b %d %Y %H:%M')}" +
            " Champion Played: #{$champions[match.champion]}"
            x += 1
        end
        match = summoner.sorted_matches[queue][CLI.get_input.to_i - 1]
        API.get_match_details(match)
    end

    def self.show_match_details(match)
        puts "#{match.summoner.name}'s stats for #{$champions[match.champion]}"+
        " on #{match.date_time.strftime('%b %d %Y %H:%M')}"
        puts "Result: #{match.result}"
        puts "Kills: #{match.kills}"
        puts "Assits: #{match.assists}"
        puts "Deaths: #{match.deaths}"
        puts "KDA: #{match.kda}"
        puts "CS: #{match.cs}"
        puts "Gold: #{match.gold}"
        puts "Vision Score: #{match.vision_score}"
    end

end