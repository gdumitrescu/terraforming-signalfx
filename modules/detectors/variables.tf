variable "message_body" {
  type = string
  description = "Custom notification message body when an alert is triggered"

  default = <<-EOF
    {{#if anomalous}}
	    Rule "{{{ruleName}}}" in detector "{{{detectorName}}}" triggered at {{timestamp}}.
    {{else}}
	    Rule "{{{ruleName}}}" in detector "{{{detectorName}}}" cleared at {{timestamp}}.
    {{/if}}
    {{#if anomalous}}
      Triggering condition: {{{readableRule}}}
    {{/if}}
    {{#if anomalous}}
      Signal value: {{inputs.A.value}}
    {{else}}
      Current signal value: {{inputs.A.value}}
    {{/if}}
    {{#notEmpty dimensions}}
      Signal details: {{{dimensions}}}
    {{/notEmpty}}
    {{#if anomalous}}
      {{#if runbookUrl}}
        Runbook: {{{runbookUrl}}}
      {{/if}}
      {{#if tip}}
        Tip: {{{tip}}}
      {{/if}}
    {{/if}}
  EOF
}