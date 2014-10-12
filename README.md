# hubot-yahoo-amagumo

hubot-yahoo-amagumo adds Yahoo Rain-cloud(Amagumo) Radar infomation.

## Installation

Add `hubot-yahoo-amagumo` to your `package.json` dependencies, and run `npm install`.

```
"dependencies": {
  "hubot-yahoo-amagumo": ">= 0.0.1"
}
```

Add `hubot-yahoo-amagumo` to `external-scripts.json`.

```
> cat external-scripts.json
> ["hubot-yahoo-amagumo"]
```

Required HUBOT_YAHOO_AMAGUMO_APP_ID environment variable.

```
> export HUBOT_YAHOO_AMAGUMO_APP_ID="<Your Yahoo APPID>"
```

## Usage

```
hubot> hubot amagumo me 六本木
hubot> http://map.olp.yahooapis.jp/OpenLocalPlatform/V1/static?appid=<Your Yahoo APPID>&lat=35.66288632&lon=139.73359259&z=12&width=500&height=500&overlay=type:rainfall|datelabel:on 
```
