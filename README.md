# circleci-autocancel

CircleCI doesn't support auto-cancellation of redundant builds for the same
branch for workflows in V2. This docker image patches the ability into V2
workflows.

```yaml
---
version: 2
jobs:
  autocancel_redundant_builds:
    parallelism: 1
    docker:
      - image: lawrjone/circleci-autocancel
    steps:
      - run: cancel-redundant-builds --force

workflows:
  version: 2
  tests:
    jobs:
      - autocancel_redundant_builds
      - ... # other build steps
```

## Deployment

```bash
$ docker build . -t lawrjone/circleci-autocancel && docker push lawrjone/circleci-autocancel
```
