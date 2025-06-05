{{/* vim: set filetype=mustache: */}}

{{- define "kyverno.test-labels" -}}
{{- with (include "kyverno.labels.helm" .) }}
{{ . }}
{{- end }}
app: kyverno
app.kubernetes.io/component: kyverno
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/name: {{ include "kyverno.name" . }}-test
app.kubernetes.io/part-of: {{ include "kyverno.name" . }}
app.kubernetes.io/version: {{ include "kyverno.chartVersion" . }}
{{- end -}}
