class Dashing.Bchart extends Dashing.Chartjs
  ready: ->
    @pieChart("myChart",
      [{
        value: 12.58
        colorName: 'gray'
        label: "805室"
      }, {
        value: 21.5
        colorName: 'green'
        label: "809室"
      }, {
        value: 42.88
        colorName: 'yellow'
        label: "811室"
      }, {
        value: 80.45
        colorName: 'red'
        label: "812室"
      }])


