# helm-chart

# Reference: https://helm.sh/docs/topics/chart_repository/


``` 
$ helm package helm-chart
$ mkdir fantastic-charts
$ mv alpine-0.1.0.tgz fantastic-charts/
$ helm repo index helm-chart --url https://mariosneo.github.io/helm-chart/
```

```
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ${KEY_FILE} -out ${CERT_FILE} -subj "/CN=${HOST}/O=${HOST}"
```

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout demo-secret -out demo-secret -subj "/CN=demo.ingress.com/O=demo.ingress.com"

```
kubectl create secret tls demo-secret --key demo-secret --cert demo-secret
```

# local install

```
helm install helm-chart-demo helm-chart --version=x.x.x
```

# upgrade app
```
helm upgrade helm-chart-demo helm-chart --version=0.7.0

```

# helm dependency update

```
helm dependency update
```

# Ingess controller install guide 

```

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-0.32.0/deploy/static/provider/aws/deploy.yaml

https://platform9.com/learn/v1.0/tutorials/nginix-controller-helm

https://www.digitalocean.com/community/tutorials/how-to-set-up-an-nginx-ingress-on-digitalocean-kubernetes-using-helm
```
# helm https://kubernetes.github.io/ingress-nginx/
```

helm upgrade --install ingress-nginx ingress-nginx \                                                              
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress-nginx
```

# Kubernetes switch cluster

```
aws eks update-kubeconfig --region region-code --name my-cluster
```


# ingress example

```
The ingress-nginx controller has been installed.
It may take a few minutes for the LoadBalancer IP to be available.
You can watch the status by running 'kubectl --namespace default get services -o wide -w ingress-nginx-controller'

An example Ingress that makes use of the controller:
  apiVersion: networking.k8s.io/v1
  kind: Ingress
  metadata:
    name: example
    namespace: foo
  spec:
    ingressClassName: nginx
    rules:
      - host: www.example.com
        http:
          paths:
            - pathType: Prefix
              backend:
                service:
                  name: exampleService
                  port:
                    number: 80
              path: /
    # This section is only required if TLS is to be enabled for the Ingress
    tls:
      - hosts:
        - www.example.com
        secretName: example-tls

If TLS is enabled for the Ingress, a Secret containing the certificate and key must also be provided:

  apiVersion: v1
  kind: Secret
  metadata:
    name: example-tls
    namespace: foo
  data:
    tls.crt: <base64 encoded cert>
    tls.key: <base64 encoded key>
  type: kubernetes.io/tls

```