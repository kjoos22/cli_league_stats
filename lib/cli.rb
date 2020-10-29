class CLI

    def start
        puts "Welcome to CLI_League_Stats!"   
        API.retrieve_summoner
    end

    def self.get_input
        gets.chomp
    end

    def self.summoner_matches(summoner)
        puts "#{summoner.name} has played matches in the following queues:"
        x = 1
        summoner.sorted_matches.keys.sort.each do |queue|
            puts "#{x}. #{queue}"
            x += 1
        end
        print "Enter a queue # to see matches: "
        input = CLI.get_input.to_i - 1
        queue = summoner.sorted_matches.keys.sort[input]
        show_matches(queue, summoner)
    end

    def self.show_matches(queue, summoner)
        summoner.sorted_matches[queue].each do |match|
            puts match.date_time.strftime('%b %d %Y %H:%M') + "#{match.champion}"
        end
    end

end