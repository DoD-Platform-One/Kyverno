# Changelog

Format: [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)

## [2.6.0-bb.0] - 2022-11-15

### Changed

- Updated Helm chart to v2.6.1
- Updated Kyverno image to v1.8.1
- Updated kubectl image to v1.25.4
- Updated ubi image to 8.7

## [2.6.0-bb.2] - 2022-10-5-28

### Added

- Added pull policy arg to kyverno deployment and network policy for container registries

## [2.6.0-bb.1] - 2022-11-01

### Changed

- Updated Kubectl image to 1.25.3

## [2.6.0-bb.0] - 2022-10-19

### Changed

- Updated Helm chart to v2.6.0
- Updated Kyverno to v1.8.0

## [2.5.4-bb.0] - 2022-10-06

### Changed

- Updated Helm chart to v2.5.4
- Updated Kyverno to v1.7.4

## [2.5.3-bb.1] - 2022-09-28

### Changed

- Updated kubectl to v1.25.2
- Update gluon to 0.3.1

## [2.5.3-bb.0] - 2022-08-30

### Changed

- Updated Helm chart to v2.5.3
- Updated Kyverno to v1.7.3
- updated kubectl from v1.22.2 to v1.24.4

## [2.5.2-bb.0] - 2022-08-12

### Changed

- Updated Helm chart to v2.5.2
- Updated Kyverno to v1.7.2

## [2.2.0-bb.5] - 2022-04-11

### Added

- OSCAL documentation with initial 800-53b controls satisfied

## [2.2.0-bb.4] - 2022-03-22

### Changed

- Added kyverno introduction
- Updated overview with instructions to migrate from gatekeeper

## [2.2.0-bb.3] - 2021-03-08

### Changed

- Increase default QPS and burst rates to eliminate client throttling

## [2.2.0-bb.2] - 2021-02-17

### Changed

- Fixed datasource for Grafana dashboard

## [2.2.0-bb.1] - 2021-02-14

### Changed

- Added tag to kubectl image for test

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
