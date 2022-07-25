resource "signalfx_dashboard_group" "dashboard_group_workshop" {
  name        = "Workshop Dashboard"
  description = "Workshop Dashboard"
}

resource "signalfx_dashboard" "dashboard_workshop" {
  name            = "Workshop Dashboard"
  dashboard_group = signalfx_dashboard_group.dashboard_group_workshop.id

  chart {
    chart_id = signalfx_text_chart.chart_0.id
    width    = 6
    height   = 3
    row      = 1
    column   = 7
  }
  chart {
    chart_id = signalfx_time_chart.chart_1.id
    width    = 6
    height   = 1
    row      = 1
    column   = 0
  }
  chart {
    chart_id = signalfx_time_chart.chart_2.id
    width    = 6
    height   = 1
    row      = 2
    column   = 0
  }
  chart {
    chart_id = signalfx_time_chart.chart_3.id
    width    = 6
    height   = 1
    row      = 3
    column   = 0
  }
}
