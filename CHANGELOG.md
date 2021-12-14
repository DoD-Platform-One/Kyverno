# Changelog

Format: [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)

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
