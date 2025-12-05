FROM ghcr.io/renovatebot/renovate:40.62.1@sha256:ae81e55a741faea2befce0caeafc8ae0ef2de014a104d63a67df59c7d168b1e7

# renovate: datasource=github-releases depName=helm/helm
ENV HELM_VERSION="v3.19.1"