{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "customer360.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "customer360.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "customer360.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "customer360.labels" -}}
helm.sh/chart: {{ include "customer360.chart" . }}
{{ include "customer360.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "customer360.selectorLabels" -}}
app.kubernetes.io/name: {{ include "customer360.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "customer360.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "customer360.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Playing with Helper Templates for Use Case processing
*/}}

{{/* Used to put the right TLD on the P1 URLs based on the Region */}}
{{- define "customer360.pingOneTld" -}}
    {{ if .Values.global.pingOne.usePingOneServices }}
        {{- if eq ( default "NA" .Values.global.pingOne.envRegion ) "EU" }}
            {{- print "eu" }}
        {{- else if eq ( default "NA" .Values.global.pingOne.envRegion ) "AP" }}
            {{- print "asia" }}
        {{- else }}
            {{- print "com" }}
        {{- end}}
    {{- end }}
{{- end }}

{{/* Used to create the Admin Console Client URLs used in Software */}}
{{- define "customer360.pingOneAdminUrl" }}
    {{- print "https://auth.pingone." }}{{ include "customer360.pingOneTld" . }}{{ print "/" .Values.global.pingOne.adminConsole.envId "/as" }}
{{- end }}

{{/* Used to build the additional URLs passed into the job/pingconfig */}}
{{- define "customer360.useCaseUrls" -}}
    {{- $useCaseGlobal :=  .Values.global.useCases }}
    {{- $useCaseDetails := .Values.collections.useCases }}
    {{- $merged := merge $useCaseDetails $useCaseGlobal }}
    {{- printf .Values.collections.solutions.customer360.url }},
    {{- range $key, $val := $merged }}
        {{- if $val.enabled }}
            {{- printf $val.url }}, 
        {{- end }}
    {{- end }}
{{- end }}

{{/* Used to build the of the collections URLs passed into the job/pingconfig */}}
{{- define "customer360.useCaseNames" -}}
    {{- $useCaseGlobal :=  .Values.global.useCases }}
    {{- $useCaseDetails := .Values.collections.useCases }}
    {{- $merged := merge $useCaseDetails $useCaseGlobal }}
    {{- printf .Values.collections.solutions.customer360.name }}{{- print " --> "}}  
    {{- range $key, $val := $merged }}
        {{- if $val.enabled }}
            {{- printf $val.name }}{{ printf " : " }}  
        {{- end }}
    {{- end }}
{{- end }}

{{/* Helper for the Ingress Hostname */}}
{{- define "customer360.hostname" -}}
    {{- if .Values.global.clientConnection.externalDNS.enabled }}
        {{- .Values.global.clientConnection.externalDNS.externalHostname }}
    {{- else }}
        {{- .Release.Name }}{{- print }}.ping-devops.com
    {{- end }}
{{- end }}



{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "pingdelegator.name" -}}
{{- default .Chart.Name .Values.pingdelegator.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "pingdelegator.fullname" -}}
{{- if .Values.pingdelegator.fullnameOverride -}}
{{- .Values.pingdelegator.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.pingdelegator.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "pingdelegator.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
