FROM ghcr.io/renovatebot/renovate:41.173.1@sha256:e998e1218fe572e23278d8808186a310784f7cb2ac8055307183ffc51d3a59e5

# renovate: datasource=github-releases depName=helm/helm
ENV HELM_VERSION="v3.19.1"