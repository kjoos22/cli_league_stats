class CLI

    def start
        system('clear')
        puts "Welcome to CLI_League_Stats!"
        puts "Enter 'EXIT!' at anytime to quit."
        API.retrieve_summoner
    end

    def self.get_input
        input = gets.chomp
        if input == 'EXIT!'
            puts "\nThank you for using CLI_League_Stats!"
            exit
        end
        input
    end

    def self.select_region
        puts "\n1. Brazil\n2. Europe Northeast\n3. Europe Northwest\n4. Japan\n"+
            "5. Korea\n6. Latin America North\n7. Latin America South\n8. " + 
            "North America\n9. Oceania\n10. Turkey\n11. Russia"
        print "\nEnter a region #: "
        region = CLI.get_input
        API.set_region(region)
    end

    def self.set_summoner
        system('clear')
        print "Enter a summoner name: "
        summoner = CLI.get_input.gsub(' ', '%20')
    end

    def self.summoner_matches(summoner)
        puts "#{summoner.name} has played matches in the following queues:\n\n"
        x = 1
        summoner.sorted_matches.keys.sort.each do |queue|
            puts "#{x}. #{queue}"
            x += 1
        end
        print "\nEnter a queue # to see matches: "
        input = CLI.get_input.to_i - 1
        if input < 0 or input > summoner.sorted_matches.keys.length - 1
            system('clear')
            puts "Enter 'EXIT!' at anytime to quit."
            puts "Invalid queue #, try again."
            summoner_matches(summoner)
        end
        queue = summoner.sorted_matches.keys.sort[input]
        system('clear')
        show_matches(queue, summoner)
    end

    def self.show_matches(queue, summoner)
        x = 1
        puts "#{summoner.name}'s #{queue} matches:\n\n"
        summoner.sorted_matches[queue].each do |match|
            puts "#{x}"+". " + "#{match.date_time.strftime('%b %d %Y %H:%M')}" +
            " Champion Played: #{$champions[match.champion]}"
            x += 1
        end
        print "\nEnter a match # to see stats: " 
        input = CLI.get_input.to_i - 1
        if input < 0 or input > summoner.sorted_matches[queue].length - 1
            system('clear')
            puts "Enter 'EXIT!' at anytime to quit."
            puts "Invalid match #, try again."
            show_matches(queue, summoner)
        end
        match = summoner.sorted_matches[queue][input]
        API.get_match_details(match)
    end

    def self.show_match_details(match)
        system('clear')
        puts "#{match.summoner.name}'s stats for #{$champions[match.champion]}"+
        " on #{match.date_time.strftime('%b %d %Y %H:%M')}\n\n"
        puts "Result: #{match.result}"
        puts "Kills: #{match.kills}"
        puts "Assits: #{match.assists}"
        puts "Deaths: #{match.deaths}"
        puts "KDA: #{match.kda}"
        puts "CS: #{match.cs}"
        puts "Gold: #{match.gold}"
        puts "Vision Score: #{match.vision_score}\n\n"
        print "Press Enter to contine..."
        CLI.get_input
        system('clear')
        CLI.options(match)
    end

    def self.options(match)
        puts "Options: \n\n"
        puts "1. Enter a new summoner"
        puts "2. Return to #{match.summoner.name}'s match history"
        puts "3. Exit"
        print "\nEnter an option: "
        input = CLI.get_input.to_i
        case input
            when 1
                system('clear')
                API.retrieve_summoner
            when 2
                system('clear')
                summoner_matches(match.summoner)
            when 3
                puts "\nThank you for using CLI_League_Stats"
                exit
            else
                system('clear')
                puts "Invalid selection, try again."
                options(match)
        end
    end

end