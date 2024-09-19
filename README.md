# asg2024

## Run gofetch in Docker

```
docker run -ti --rm ghcr.io/alban/asg2024/gofetch /gofetch https://www.wikipedia.org
```

## Run gofetch in Kubernetes

```
kubectl apply -f gofetch/gofetch-ds.yaml
```
