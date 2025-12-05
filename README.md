# 39780

Reproduction for [Renovate issue 39780](https://github.com/renovatebot/renovate/issues/39780).

## Current behavior

Renovate creates a combined pull request for major versions of different packages
and datasources witht the following package rule. However, `renovate-config-validator --strict`
fails with 

> cannot combine both matchUpdateTypes and separateMultipleMajor

```json5
{
  "matchManagers": [
    "dockerfile",
    "composer"
  ],
  "matchDatasources": [
    "docker",
    "packagist"
  ],
  "groupName": "ITZBund Major Update",
  "matchUpdateTypes": [
    "major"
  ],
  "separateMultipleMajor": false,
  "semanticCommits": "enabled",
  "semanticCommitType": "feat!",
  "semanticCommitScope": null
}
```

On the other hand, removing `separateMultipleMajor` from the above package rule
leads to a merge request for each renovated package's major version.

```json5
{
  "matchManagers": [
    "dockerfile",
    "composer"
  ],
  "matchDatasources": [
    "docker",
    "packagist"
  ],
  "groupName": "ITZBund Major Update",
  "matchUpdateTypes": [
    "major"
  ],
  // "separateMultipleMajor": false,
  "semanticCommits": "enabled",
  "semanticCommitType": "feat!",
  "semanticCommitScope": null
}
```

Resulting Merge Requests

- [Update Major Update to v3 (major)](https://github.com/uluzox/39780/pull/12)
- [Update ghcr.io/renovatebot/renovate Docker tag to v42](https://github.com/uluzox/39780/pull/11)
- [Update ghcr.io/renovatebot/renovate Docker tag to v41](https://github.com/uluzox/39780/pull/10)
- [Update dependency derhansen/form_crshield to v2](https://github.com/uluzox/39780/pull/9)
- [Update ghcr.io/renovatebot/renovate Docker tag to v40.62.1](https://github.com/uluzox/39780/pull/4)
- [Update dependency derhansen/form_crshield to v1.4.1](https://github.com/uluzox/39780/pull/3)
- [Update dependency b13/container to v2.3.6](https://github.com/uluzox/39780/pull/2)

Only `v3` major versions are combined. The desired `Update Major Update (major)`
would include
- b13/container (source)	2.2.5 -> 3.1.11
- derhansen/form_crshield	1.3.1 -> 3.0.0
- ghcr.io/renovatebot/renovate (source)	final	major	40.0.0 -> 42.37.1

## Expected behavior

No config validation error as it works: 

> cannot combine both matchUpdateTypes and separateMultipleMajor
