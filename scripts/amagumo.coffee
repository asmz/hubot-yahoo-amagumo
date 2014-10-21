# Description:
#   A hubot script return Yahoo Rain-cloud(Amagumo) Radar infomation.
#
# Commands:
#   hubot amagumo me <area> - Returns a Yahoo Rain-Cloud(Amagumo) Rader map view of <area>
#   hubot amagumo zoom me <area> - Returns a zoom Rader map view of <area>
#   hubot amagumo japan - Returns a Rader map view of the whole japan area
#
# Author:
#   asmz

module.exports = (robot) ->

  unless process.env.HUBOT_YAHOO_AMAGUMO_APP_ID?
    robot.logger.warning 'Required HUBOT_YAHOO_AMAGUMO_APP_ID environment.'
    return

  width = process.env.HUBOT_YAHOO_AMAGUMO_WIDTH ? "500"
  height = process.env.HUBOT_YAHOO_AMAGUMO_HEIGHT ? "500"

  robot.respond /amagumo japan/i, (msg) ->
    msg.send getAmagumoRaderUrl "37.9072841", "137.1255805", "6", "500", "500"

  robot.respond /amagumo( zoom)? me (.+)/i, (msg) ->
    zoom = if msg.match[1] then "14" else "12"
    area = msg.match[2]

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

        msg.send getAmagumoRaderUrl lat, lon, zoom, width, height

getAmagumoRaderUrl = (lat, lon, zoom, width, height) ->
  url = "http://map.olp.yahooapis.jp/OpenLocalPlatform/V1/static?appid=" +
         process.env.HUBOT_YAHOO_AMAGUMO_APP_ID +
        "&lat=" + lat +
        "&lon=" + lon +
        "&z=" + zoom +
        "&width=" + width +
        "&height=" + height +
        "&overlay=" + "type:rainfall"
