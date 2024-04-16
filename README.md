# github-runner-podman

This demonstrates a stubbed out a github runner container. You could check this out as your home directory to get things in place, but it would be better if you adapted it to your usage.

## Manual Steps
You must run the container's `/home/runner/config.sh` by hand once to create the `.credentials`, `.credentials_rsaparams`, and `.runner` files.

These are the secretes used by the runner to login to github.

They should be copied out and placed in `/home/github/<instance>/runner-config-files` under the names: `credentials`, `credentials_rsaparams`, `runner`.

These files will need to be readable by the container user.

### Example commands:

In terminal one:
```shell
podman run --name=github-config-runner --rm -it ghcr.io/actions/actions-runner:latest
/home/runner/config.sh
```

In terminal two:
```
podman cp github-config-runner:/home/runner/.credentials /home/github/runner-config-files/default/credentials
podman cp github-config-runner:/home/runner/.credentials_rsaparams /home/github/runner-config-files/default/credentials_rsaparams
podman cp github-config-runner:/home/runner/.runner /home/github/runner-config-files/default/runner
chmod 640 /home/github/runner-config-files/default/*
podman unshare chgrp 1001 /home/github/runner-config-files/default/*
```

## Multiple runners
You can run multiple independent runners by setting different systemd instances.  Inside `~/.config/containers/systemd/` run something like `ln -s github-runner@.container github-runner@something.container` to setup a new worker.
