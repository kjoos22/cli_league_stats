# CLI_League_Stats

A Ruby CLI app to retrieve a summoner's match history form the League of Legends API. It will then sort the matches by queue, only accounting for match types 400, 420, 430, 440, 450, 700, 830, 840, and 850. It will then list the queues the entered summoner has played games in, and allow the user to select a queue to view the match history, and subsequently select a match to see some basic stats.

## Installation
To install the program, run the following:

```bash
git clone git@github.com:kjoos22/cli_league_stats.git
```
### API Key
The program requires an API key, which can be obtained for free at http://developer.riotgames.com.

In order to protect the API key, the program makes use of https://github.com/bkeepers/dotenv and stores the API key in the .env file with the variable name API_KEY.

## Launching the program
Once installed and configured with an API key, navigate to the appropriate directory and launch the program via:

```bash
ruby bin/run
```

## Usage
Upon launching the program the user will be welcomed then enter the following flow:

1. Select region.
2. Enter summoner.
3. Select queue.
4. Select match.
5. Enter new summoner (starts at 1), return to match history (starts at 3), or exit.

Users can enter 'EXIT!' anytime the program prompts for input to immediately exit.

## Contributing
Pull requests are welcome. To propose substantial changes please open an issue.

## Future Features
1. Color formatting match history.
2. More advanced statistics.
3. Color formatting of statistics to indicate relative performance.
4. Champion based statistics for a summoner (all games played on X champion by summoner).
5. Insights derived from statistics to suggest areas of improvement.

## License

