require('./assets/lib/piety')($, document)

refreshFrequency: 30000 # ms

command: "date '+%a %d %b %H:%M'"

render: (output) ->
  """
  <div class="clock">
    <span class='number'></span>
  </div>
  """

update: (output, el) ->
  clock = output

  ## Set Text
  $(".clock .number", el).text("#{clock}")

style: """
  right: 10px
  top: 5px

  color: white
  font: 12px Inconsolata, monospace, Helvetica Neue, sans-serif
  -webkit-font-smoothing: antialiased

  .number
    vertical-align top

"""
