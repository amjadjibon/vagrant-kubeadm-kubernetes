## FLUX

- Install fluxctl
  With Bash for macOS and Linux:

```
curl -s https://fluxcd.io/install.sh | sudo bash
```

To configure your shell to load flux bash completions add to your profile:

```
. <(flux completion bash)
```

- Bootstrap

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

```
flux bootstrap github \
  --owner=amjadjibon \
  --repository=vagrant-kubeadm-kubernetes \
  --path=clusters/cluster-1 \
  --personal
```
