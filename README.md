# asg2024

## Run gofetch

### In Docker

```
docker run -ti --rm ghcr.io/alban/asg2024/worker /worker
```

### In Kubernetes

```
kubectl apply -f server/server-ds.yaml
kubectl apply -f server/server-svc.yaml
kubectl apply -f worker/worker-ds.yaml
```

## Run gotls gadget

### With ig

```
sudo -E ig run ghcr.io/alban/asg2024/gotls -o jsonpretty
```

### With Kubernetes

```
kubectl gadget deploy --gadgets-public-keys="$(cat gotls/cosign.pub)"
kubectl gadget run ghcr.io/alban/asg2024/gotls -o jsonpretty
```

Example of output:

```json
{
  "buf": "GET /robots.txt HTTP/1.1\r\nHost: www.w3.org\r\nUser-Agent: Go-http-client/1.1\r\nAccept-Encoding: *\r\n\r\n",
  "fd": 0,
  "len": 98
}
{
  "buf": "HTTP/1.1 200 OK\r\nDate: Thu, 19 Sep 2024 14:11:58 GMT\r\nContent-Type: text/plain\r\n(...)",
  "fd": 824635465736,
  "len": 1369
}
```
