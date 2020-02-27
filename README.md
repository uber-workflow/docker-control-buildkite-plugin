# docker-control-buildkite-plugin

Bootstraps a web-code docker-compose run from a docker build image. Overrides the checkout hook to avoid hitting git.

# usage

```
steps:
  - command: '<optional script to run in service>'
    plugins:
      - 'uber-workflow/docker-control':
        compose-file: '<PATH TO DOCKER COMPOSE FILE>'
        image: '<ECR IMAGE>'
        package: '<WEB_CODE PACKAGE>'
        service: '<SERVICE>'
```

# example

```
steps:
  - command: path/to/script.sh
    plugins:
      - 'uber-workflow/docker-control':
        compose-file: 'projects/monorepo-tools/scripts/docker/docker-compose.yml'
        image: '<ecr image from previous build step>'
        package: 'projects/example-trips-viewer-fusion'
        service: 'web-code-run'
```

# Additional Configuration

### `build` (optional)

Will trigger a docker-compose build of the specified service.

```
steps:
  - command: path/to/script.sh
    plugins:
      - 'uber-workflow/docker-control':
        # Required properties
        build: true
```

### `logs` (optional)

Set to true to output docker-compose logs for running services.

```
steps:
  - command: path/to/script.sh
    plugins:
      - 'uber-workflow/docker-control':
        # Required properties
        logs: true
```

### `verbose` (optional)

Sets `docker-compose` to run with `--verbose`

The default is `false`.

```
steps:
  - command: path/to/script.sh
    plugins:
      - 'uber-workflow/docker-control':
        # Required properties
        verbose: true
```

### `artifact-download` (optional)

Downloads the specified artifacts prior to running docker.

```
steps:
  - command: path/to/script.sh
    plugins:
      - 'uber-workflow/docker-control':
        # Required properties
        artifact-download: 'artifacts/foo/bar.txt'
```
