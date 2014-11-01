# hubot-yahoo-amagumo

A hubot script return Yahoo Rain-cloud(Amagumo) Radar infomation.

## Installation

Add `hubot-yahoo-amagumo` to your `package.json` dependencies, and run `npm install`.

```
"dependencies": {
  "hubot-yahoo-amagumo": ">= 0.0.3"
}
```

Add `hubot-yahoo-amagumo` to `external-scripts.json`.

```
> cat external-scripts.json
> ["hubot-yahoo-amagumo"]
```

## Configuration

Required HUBOT_YAHOO_AMAGUMO_APP_ID environment variable.

```
> export HUBOT_YAHOO_AMAGUMO_APP_ID=<Your Yahoo APPID>
```

The following settings are optional.

```
> export HUBOT_YAHOO_AMAGUMO_WIDTH=<image size width(px)>   # default : 500px
> export HUBOT_YAHOO_AMAGUMO_HEIGHT=<image size height(px)> # default : 500px
```

## Usage

```
hubot amagumo me <area> - Returns a Yahoo Rain-Cloud(Amagumo) Rader map view of <area>
hubot amagumo zoom me <area> - Returns a zoom Rader map view of <area>
hubot amagumo japan - Returns a Rader map view of the whole japan area
```

## See Also

* [Slack上で現在雨が降ってるか確認できるHubotスクリプトを作ってみた - OTOBANK Engineering Blog] (http://engineering.otobank.co.jp/2014/10/23/hubot-yahoo-amagumo-on-slack/)
