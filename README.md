# apod-slack
Get NASA's Astronomy Picture of the Day in Slack

![example](http://i.imgur.com/fVQAylK.png)

### What you will need
* A [Heroku](http://www.heroku.com) account
* A [NASA](https://api.nasa.gov/api.html#authentication) developer api key
* An [outgoing webhook token](https://api.slack.com/outgoing-webhooks) for your Slack team

### Setup
* Clone this repository locally
* Create a new Heroku app and follow the instructions to initialize the ```apod-slack``` repository
* Use the [NASA api](https://api.nasa.gov/api.html#authentication) page to generate a developer key
* Navigate to the settings page of the Heroku app and add the following config variables:
  * ```OUTGOING_WEBHOOK_TOKEN``` The token for your outgoing webhook integration in Slack (more on this in a bit)
  * ```BOT_USERNAME``` The name the bot will use when posting to Slack
  * ```BOT_ICON``` The emoji icon for the bot
  * ```NASA_API_KEY``` Your NASA api developer key
* Navigate to the integrations page for your Slack team. Create an outgoing webhook, choose a channel and a trigger word (ex: ".apod"), use the URL for your heroku app, and copy the webhook token to your ```OUTGOING_WEBHOOK_TOKEN``` config variable.
* Push the repository to the Heroku app
* Use the trigger word in the channel. You should see the APOD results.

### Thanks
[NASA](https://api.nasa.gov/index.html)

[@gesteves](https://github.com/gesteves/) Who's code I am constantly referencing.

