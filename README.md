# 39780

Reproduction for [Renovate issue 39780](https://github.com/renovatebot/renovate/issues/39780).

## Current behavior

Renovate creates a combined pull request for major versions of different packages
and datasources witht the following package rule. However, `renovate-config-validator --strict`
fails with 

> cannot combine both matchUpdateTypes and separateMultipleMajor

```json
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

## Expected behavior

### Commit hash pinning disabled

If commit hash pinning is disabled, then Renovate keeps the original comment.


```yaml
jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v1 # Renovate keeps comment if commit hash pinning disabled

      - name: Run a one-line script
        run: echo Hello, world!
```

### Commit hash pinning enabled

If commit hash pinning is enabled, then Renovate puts the tag right behind the action name, and moves the original comment further down the line.

```yaml
jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v1e204e9a9253d643386038d443f96446fa156a97 # renovate: tag=v2.3.5 # Comment that Renovate bot has moved

      - name: Run a one-line script
        run: echo Hello, world!
```
