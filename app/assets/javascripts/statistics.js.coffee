# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $.getJSON 'posts.json', (obj) ->
    console.log obj
    sliceArray = (item) ->
      returnedObj = []
      returnedObj.push item.title
      returnedObj.push item.count
      returnedObj
    post = _.map(obj.posts, sliceArray)
    console.log post
    $('#container').highcharts
      chart: type: 'column'
      title: text: 'MyBlog popularity'
      subtitle: text: 'Source: <a href="http://en.wikipedia.org/wiki/List_of_cities_proper_by_population">Wikipedia</a>'
      xAxis:
        type: 'category'
        labels:
          rotation: -45
          style:
            fontSize: '13px'
            fontFamily: 'Verdana, sans-serif'
      yAxis:
        min: 0
        title: text: 'Comments (number)'
      legend: enabled: false
      tooltip: pointFormat: 'Comments in March 2015: <b>{point.y:.1f} </b>'
      series: [ {
        name: 'Population'
        data: post,
        dataLabels:
          enabled: true
          rotation: -90
          color: '#FFFFFF'
          align: 'right'
          format: '{point.y:.1f}'
          y: 10
          style:
            fontSize: '13px'
            fontFamily: 'Verdana, sans-serif'
      } ]
  return