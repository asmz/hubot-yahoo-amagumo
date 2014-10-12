# Description:
#   Adds Yahoo Rain-cloud(Amagumo) Radar infomation.
#
# Commands:
#   hubot amagumo me <area> - Returns a Yahoo Rain-Cloud(Amagumo) Rader map view of <areae>
#
# Author:
#   asmz

module.exports = (robot) ->

  unless process.env.HUBOT_YAHOO_AMAGUMO_APP_ID?
    robot.logger.warning 'Required HUBOT_YAHOO_AMAGUMO_APP_ID environment.'
    return

  robot.respond /amagumo me (.+)/i, (msg) ->
    area = msg.match[1]

    msg.http('http://geo.search.olp.yahooapis.jp/OpenLocalPlatform/V1/geoCoder')
      .query({
        appid: process.env.HUBOT_YAHOO_AMAGUMO_APP_ID
        query: area
        results: 1
        output: 'json'
      })  
      .get() (err, res, body) ->
        geoinfo = JSON.parse(body)
        unless geoinfo.Feature?
          msg.send "Not match \"#{area}\""
          return

        coordinates = (geoinfo.Feature[0].Geometry.Coordinates).split(",")
        lon = coordinates[0]
        lat = coordinates[1]

        url = getAmagumoRaderUrl lat, lon
        msg.send url

getAmagumoRaderUrl = (lat, lon) ->
  url = "http://map.olp.yahooapis.jp/OpenLocalPlatform/V1/static?appid=" +
         process.env.HUBOT_YAHOO_AMAGUMO_APP_ID +
        "&lat=" + lat +
        "&lon=" + lon +
        "&z=" + "12" +
        "&width=" + "500" +
        "&height=" + "500" +
        "&overlay=" + "type:rainfall|datelabel:on"
