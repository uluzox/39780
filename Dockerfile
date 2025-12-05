FROM ghcr.io/renovatebot/renovate:42.37.1@sha256:8c6fbfee26e55542a61c1a1a88ba0388e8efcffb06485702147fd543e2f803b8

# renovate: datasource=github-releases depName=helm/helm
ENV HELM_VERSION="v3.19.1"