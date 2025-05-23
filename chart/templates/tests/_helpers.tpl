{{/* vim: set filetype=mustache: */}}

{{- define "kyverno.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 15 | trimSuffix "-b" -}}
{{- end -}}

{{- define "kyverno.chartVersion" -}}
  {{- .Chart.Version | replace "+" "_" | trunc 5 | trimSuffix "-" -}}
{{- end -}}

{{- define "kyverno.test-labels" -}}
{{- with (include "kyverno.labels.helm" .) }}
{{ . }}
{{- end }}
app: kyverno
app.kubernetes.io/component: kyverno
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/name: {{ include "kyverno.name" . }}-test
app.kubernetes.io/part-of: {{ include "kyverno.name" . }}
app.kubernetes.io/version: "{{ .Chart.Version | replace "+" "_" }}"
{{- end -}}

{{- define "kyverno.test.image" -}}
{{- include "kyverno.image" (dict "image" .Values.test.image "defaultTag" "latest") -}}
{{- end -}}

{{- define "kyverno.test.imagePullPolicy" -}}
{{- default .Values.global.image.pullPolicy .Values.test.image.pullPolicy -}}
{{- end -}}
