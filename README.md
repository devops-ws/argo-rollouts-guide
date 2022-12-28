# argo-rollouts-guide

## 安装
首先，你需要有一套 [Kubernetes](https://github.com/kubernetes/kubernetes/) 环境。下面的工具可以帮助你快速按照好一套 Kubernetes 环境：

> 推荐使用 [hd](https://github.com/LinuxSuRen/http-downloader) 安装下面的工具
>
> 安装 `hd` 的命令为：`curl https://linuxsuren.github.io/tools/install.sh|bash`

| 工具 | 工具安装 |使用 |
|---|---|---|
| [k3d](https://k3d.io/) | `hd i k3d` | `k3d cluster create` |
| [kubekey](https://github.com/kubesphere/kubekey) | `hd i kk` | `kk create cluster` |
| [minikube](https://github.com/kubernetes/minikube) | `hd i minikube` | `minikube start` |

当 Kubernetes 环境就绪后，就可以通过下面的命令会在命名空间（`argo`）下安装最新版本的 `Argo Rollouts`：

```shell
kubectl create namespace argo-rollouts
kubectl apply -n argo-rollouts -f https://github.com/argoproj/argo-rollouts/releases/latest/download/install.yaml
```

如果你的环境访问 GitHub 时有网络问题，可以使用下面的命令来安装：

```shell
docker run -it --rm -v $HOME/.kube/:/root/.kube --network host ghcr.io/linuxsuren/argo-rollouts-guide:master
```

推荐使用的工具：

|||
|---|---|
| [k9s](https://k9scli.io/) | K9s is a terminal based UI to interact with your Kubernetes clusters. |

## 金丝雀部署
部署 Rollout 以及 Service
```shell
kubectl apply -f https://raw.githubusercontent.com/devops-ws/learn-pipeline-go/master/argo/rollouts/rollout.yaml
kubectl apply -f https://raw.githubusercontent.com/devops-ws/learn-pipeline-go/master/argo/rollouts/service.yaml
```

通过上面的步骤，会部署有 5 个 Pod 实例的应用。

我们可以通过下面的命令在终端里观察到渐进式部署的过程：
```shell
kubectl argo rollouts get rollout rollouts-demo -w
```

也可以在 UI 界面上看到更详细的内容：
```shell
kubectl argo rollouts dashboard
```

通过下面的命令观察版本号的改变：
```shell
watch "curl http://localhost:30698/version -s"
```
