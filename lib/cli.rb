class CLI

    def start
        puts "Welcome to CLI_League_Stats!"   
        API.retrieve_summoner
    end

    def self.summoner_matches(summoner)
        puts "#{summoner.name} has played matches in the following queues:"
        x = 1
        summoner.sorted_matches.keys.sort.each do |queue|
            puts "#{x}. #{queue}"
            x += 1
        end
        puts "Enter a queue # to see matches: "
    end

    def self.get_input
        gets.chomp
    end

end