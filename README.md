# CLI_League_Stats

A Ruby CLI app to retrieve a summoner's match history form the League of Legends API. It will then sort the matches by queue, only accounting for match types 400, 420, 430, 440, 450, 700, 830, 840, and 850. It will then list the queues the entered summoner has played games in, and allow the user to select a queue to view the match history, and subsequently select a match to see some basic stats.

## Installation
To install the program, run the following command in your terminal:

```bash
git clone git@github.com:kjoos22/cli_league_stats.git
```
### API Key
The program requires an API key, which can be obtained for free at http://developer.riotgames.com

The program is configured to make use of https://github.com/bkeepers/dotenv and stores the API key in the .env file with the variable name API_KEY
