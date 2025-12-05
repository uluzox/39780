FROM ghcr.io/renovatebot/renovate:40.0.0@sha256:8ec35bb52d6cd45ddd4f793de5406b2e1396cec14b33f7a8e9f238c220556f23

# renovate: datasource=github-releases depName=helm/helm
ENV HELM_VERSION="v3.19.1"