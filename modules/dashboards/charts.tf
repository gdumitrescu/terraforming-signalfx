resource "signalfx_text_chart" "chart_0" {
  name     = "Example text chart"
  markdown = <<-EOF
    <h1>h1 Big headings</h1>
    <h6>h6 To small headings</h6>
    <h5>Emphasis</h5>
    <p><strong>This is bold text</strong>, <em>This is italic text</em> , <del>Strikethrough</del></p>
    <h5>Lists</h5>
    <p>Unordered</p>
    <ul>
    <li>Create a list by starting a line with <code class="prettyprint">+</code>, <code class="prettyprint">-</code>, or <code class="prettyprint">*</code></li>
    <li>Sub-lists are made by indenting 2 spaces:</li>
    <li>Marker character change forces new list start:<ul>
    <li>Ac tristique libero volutpat at</li>
    <li>Facilisis in pretium nisl aliquet</li></ul></li>
    <li>Very easy!</li>
    </ul>
    <p>Ordered</p>
    <ol>
    <li>Lorem ipsum dolor sit amet</li>
    <li>Consectetur adipiscing elit</li>
    <li>Integer molestie lorem at massa</li>
    </ol>
    <h5>Tables</h5>
    <table>
    <thead>
    <tr>
    <th>Option</th>
    <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <tr>
    <td>chart</td>
    <td>path to data files to supply the data that will be passed into templates.</td>
    </tr>
    <tr>
    <td>engine</td>
    <td>engine to be used for processing templates. Handlebars is the default.</td>
    </tr>
    <tr>
    <td>ext</td>
    <td>extension to be used for dest files.</td>
    </tr>
    </tbody>
    </table>
    <h4>Links</h4>
    <p><a href="https://www.splunk.com" rel="noopener noreferrer">link to webpage</a></p>
    <p><a href="https://app.eu0.signalfx.com/#/dashboard/EaJHrbPAEAA?groupId=EaJHgrsAIAA&amp;configId=EaJHsHzAEAA" title="Link to the Sample chart Dashboard!" rel="noopener noreferrer">link to dashboard with title</a></p>
  EOF
}

resource "signalfx_time_chart" "chart_1" {
  name        = "Active Latency"
  description = "Spread of latency values across time"

  program_text = <<-EOF
    A = data('demo.trans.latency').publish(label='A')
  EOF

  time_range = 3600

  plot_type         = "LineChart"
  show_data_markers = true

  axis_left {
    label = "Latency (ms)"
  }
}

resource "signalfx_time_chart" "chart_2" {
  name        = "Latency Chart"
  description = "My fun description"

  program_text = <<-EOF
    A = data('demo.trans.latency').percentile(pct=95).publish(label='A', enable=False)
    B = data('demo.trans.latency').percentile(pct=95).timeshift('1w').publish(label='B', enable=False)
    C = (A-B).publish(label='C')
  EOF

  time_range = 3600

  plot_type         = "AreaChart"
  show_data_markers = true

  axis_left {
    label = "Latency (ms)"
  }
}

resource "signalfx_time_chart" "chart_3" {
  name        = "Latency vs. Load"
  description = "My fun description"

  program_text = <<-EOF
    A = data('demo.trans.latency').percentile(pct=95).publish(label='A')
    B = data('demo.trans.latency').percentile(pct=95).timeshift('1w').publish(label='B', enable=False)
    C = (A-B).publish(label='C', enable=False)
    D = data('demo.trans.count', filter=filter('demo_datacenter', 'Paris'), rollup='rate').publish(label='D')
    E = alerts(detector_id='${var.detector_id_latency}').publish(label='E')
  EOF

  time_range = 3600

  plot_type         = "AreaChart"
  show_data_markers = true
}

