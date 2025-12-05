FROM ghcr.io/renovatebot/renovate:40.0.0

# renovate: datasource=github-releases depName=helm/helm
ENV HELM_VERSION="v3.19.1"