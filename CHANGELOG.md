# Changelog

Format: [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)

## [2.2.0-bb.0] - 2021-02-09

### Changed

- Bumped chart to v2.2.0, which contains Kyverno version 1.6.0

## [2.1.10-bb.0] - 2021-01-28

### Changed

- Bumped chart to Kyverno version 1.5.8

## [2.1.7-bb.2] - 2021-01-27

### Changed

- Update Chart.yaml to follow new standardization for release automation

## [2.1.7-bb.1] - 2021-01-27

### Changed

- Bumped chart to Kyverno version 1.5.7
- Fix deployment for Helm release name overrides causing kyverno-pre to fail
- Updated test library (gluon) to 0.2.5

## [2.1.7-bb.0] - 2021-01-21

### Changed

- Bumped chart to Kyverno version 1.5.5
- Increased CPU to 0.5 default for main pod to handle larger number of policies

## [2.1.3-bb.3] - 2021-12-15

### Changed

- Updated Memory and CPU resources for kyverno in values.yaml

## [2.1.3-bb.2] - 2021-12-14

### Changed

- Adjusted Helm test to use curl so Iron Bank base image could be used
- Moved Helm test configuration (`bbtest`) to values.yaml

## [2.1.3-bb.1] - 2021-12-14

### Changed

- Added namespaces to test resources
- Updated dashboard to fix JSON syntax

## [2.1.3-bb.0] - 2021-12-07

### Added

- Grafana dashboard
- Overview document

### Changed

- Updated Helm chart to 2.1.3 from upstream
- Replaced `PodMonitor` with `ServiceMonitor`
- Updated test resources to latest images (gluon, kubectl)
- Split test resources into one resource per file
- Updated labels and annotations on test resources to fix upgrade issue
- Added timeout to scripted Helm test

## [2.0.3-bb.0] - 2021-10-18

### Added

- Initial creation of the chart
