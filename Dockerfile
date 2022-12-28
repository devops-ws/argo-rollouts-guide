FROM ghcr.io/linuxsuren/hd:v0.0.70

RUN hd i kubernetes-sigs/kubectl
RUN hd get https://github.com/argoproj/argo-rollouts/releases/download/v1.3.2/install.yaml

CMD ["kubectl", "apply", "-f", "install.yaml"]
