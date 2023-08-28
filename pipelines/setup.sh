# create pvc
kubectl create -f pvc.yaml -n work

# the imagePullSecret
kubectl create secret generic docker-chains     --from-file=.dockerconfigjson=docker.config  --type=kubernetes.io/dockerconfigjson -n work

# create docker-credentials for buildah
kubectl create secret generic docker-credentials --from-file=config.json=docker.config -n work

# add buildah task
kubectl apply -f https://api.hub.tekton.dev/v1/resource/tekton/task/buildah/0.5/raw -n work

kubectl create -f git-clone.yaml -n work

kubectl create -f pipeline.yaml -n work

