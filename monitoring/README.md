# Observabilidade

Prometheus + Grafana via chart `kube-prometheus-stack`. O `values.yaml` aqui é
só o diff em cima do default do chart.

Pré-requisitos: cluster acessível via kubectl e o Helm instalado.

```sh
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

kubectl create namespace monitoring

# senha do Grafana fica fora do values
kubectl -n monitoring create secret generic grafana-admin \
  --from-literal=admin-user=admin \
  --from-literal=admin-password="$(openssl rand -base64 16)"

helm install kube-prometheus-stack \
  prometheus-community/kube-prometheus-stack \
  -n monitoring -f values.yaml

# o sidecar do Grafana importa o dashboard pelo label grafana_dashboard
kubectl -n monitoring create configmap pod-health-dashboard \
  --from-file=dashboards/pod-health.json
kubectl -n monitoring label configmap pod-health-dashboard grafana_dashboard=1

kubectl apply -f alerts/pod-alerts.yaml
```

Pra abrir o Grafana sem expor nada:

```sh
kubectl -n monitoring port-forward svc/kube-prometheus-stack-grafana 3000:80
```
