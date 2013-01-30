class @LongTermPlanner
  constructor: (selector) ->
    @width = 1000
    @height = 500
    @padding = 40
    @graphRoot = d3.select(selector).append("svg:svg")
    @graphRoot.attr("width", @width + @padding).attr("height", @height + @padding)

    @graphGroup = @graphRoot.append("svg:g").
      attr("transform", "translate(0,#{@height})")

    @graphData = []
    @graphMinimum = 10000000
    @graphMaximum = 0

  addLine: (lineData, lineColor) ->
    # Update our knowledge of the extent of this graph
    @graphMinimum = d3.min([@graphMinimum, d3.min(lineData)])
    @graphMaximum = d3.max([@graphMaximum, d3.max(lineData)])
    @graphDataLength = lineData.length

    @graphData.push {
      data: lineData
      lineColor: lineColor
    }

  draw: ->
    xScale = d3.scale.linear().
      domain([0, @graphDataLength]).
      range([0, @width])

    yScale = d3.scale.linear().
      domain([@graphMinimum, @graphMaximum]).
      range([0, @height])

    graphLine = d3.svg.line().interpolate("monotone").
      x( (data, index) -> xScale(index) ).
      y( (data) -> yScale(data) * -1 )

    # Probably a way to do this w/out the for loop
    for graphEntry in @graphData
      @graphGroup.append("svg:path").
        attr("d", graphLine(graphEntry.data)).
        attr("stroke", graphEntry.lineColor).
        attr("stroke-width", 2).
        attr("fill", "none")

