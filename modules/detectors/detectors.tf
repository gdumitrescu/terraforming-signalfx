resource "signalfx_detector" "infra_static_threshold_latency" {
  name         = "Static Threshold - Latency vs. Load Detector"
  description  = "Static Threshold - Latency vs. Load Detector"
  program_text = <<-EOF
    A = data('demo.trans.latency').percentile(pct=95).publish(label='A')
    detect(when(A > threshold(290))).publish('The value of demo.trans.latency - P95 is above 290')
  EOF
  rule {
    description        = "demo.trans.latency P95 is above 290"
    detect_label       = "The value of demo.trans.latency - P95 is above 290"
    severity           = "Major"
    parameterized_body = var.message_body
  }
}