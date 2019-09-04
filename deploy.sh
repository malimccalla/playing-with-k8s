docker build -t malimccalla/multi-client:latest -t malimccalla/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t malimccalla/multi-server:latest -t malimccalla/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t malimccalla/multi-worker:latest -t malimccalla/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push malimccalla/multi-client:latest
docker push malimccalla/multi-server:latest
docker push malimccalla/multi-worker:latest

docker push malimccalla/multi-client:$SHA
docker push malimccalla/multi-server:$SHA
docker push malimccalla/multi-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/server-deployment server=malimccalla/multi-server:$SHA
kubectl set image deployments/client-deployment client=malimccalla/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=malimccalla/multi-worker:$SHA