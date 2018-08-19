require('./assets/lib/piety')($, document)

colors =
  low: 'rgb(255,44,37)'
  med: 'orange'
  high: 'rgb(133, 188, 86)'
  back: 'rgba(0,0,0,0.3)'

chartWidth = 15

chartType = 'donut'

refreshFrequency: 3000

command: "pmset -g batt | egrep \"([0-9]+\%).*\" -o --colour=auto | cut -f1 -d'%'"

render: (output) ->
  """
  <div class="battery">
    <span class="chart"></span>
    <span class='number'></span>
  </div>
  """

update: (output, el) ->
  level = Number(output)
  fill = colors.low

  if level > 20
    fill = colors.med

  if level > 40
    fill = colors.high

  $(".battery .number", el).text("  #{level}%")

  $(".battery .chart", el).text("#{level}/100").peity chartType,
    fill: [fill, colors.back]
    width: chartWidth


style: """
  right: 150px
  top: 5px

  color: white
  font: 12px Inconsolata, monospace, Helvetica Neue, sans-serif
  -webkit-font-smoothing: antialiased

  .number
    vertical-align top

  .chart
    vertical-align top
"""
