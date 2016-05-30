class Dashing.Line extends Dashing.Chartjs
  ready: ->
    @lineChart 'myline',
      ["5天前", "4天前", "3天前", "2天前", "1天前"],
      [
        label: '空气质量'
        colorName: 'blue'
        data: [110, 139, 20, 94, 39]
      ]



