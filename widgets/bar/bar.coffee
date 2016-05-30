class Dashing.Bar extends Dashing.Chartjs
  createBar:  (bar_counts) ->
    @barChart 'mybar',
      ["10小时前", "9小时前", "8小时前", "7小时前", "6小时前","5小时前","4小时前","3小时前", "2小时前", "1小时前" ],
      [
        label: '10小时内用电量'
        colorName: 'yellow'
        data: bar_counts
      ]
  onData: (data) ->
    @createBar(data.bar_counts)


