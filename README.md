# Introduction

This repository is a Proof of Concept showing NGINX Plus can route to both TKGI and OCP through simple configuration. 

`tkgi.compose.yml` represents the NGINX Plus deployed on TKGI as well as a http server representing one of the sherlock service. 

`ocp.compose.yaml` represents NGINX Plus deployed in OpenShift along with http service representing one of the sherlock service. 

Both the compose instances shared a common network called `corp_network` represnting the internal network of Globe. 

`nginx_reverse_proxy_test.sh` is an utility script that spins up containers and curls the nginx endpoint on TKGI. 

`nginxplus:latest` represents the nginx image built using [Latest NGINX Plus official Dockerfile](https://gist.githubusercontent.com/nginx-gists/36e97fc87efb5cf0039978c8e41a34b5/raw/0b18ade0d3a9a384b38fd79197743bc7f59581e4/Dockerfile)

Use the correct `nginx-repo.crt` and `nginx-repo.key` to generate the image.

### Build command:

```bash
docker build  --no-cache --secret id=nginx-key,src=nginx-repo.key --secret id=nginx-crt,src=nginx-repo.crt -t nginxplus .
```