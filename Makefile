	
# Variables
IMAGE_NAME=n158-sample # Replace with desired image name
ACCOUNT_NAME=dsilva2401 # Replace with your docker hub account 
CURRENT_VERSION=v1.0.0 # Update with the current server version

# Commands
build:
	@docker build -t ${IMAGE_NAME} .

start:
	@docker run -p 3000:3000 -t ${IMAGE_NAME}

publish-image:
	@docker tag ${IMAGE_NAME} ${strip $(ACCOUNT_NAME)}/${strip $(IMAGE_NAME)}:${CURRENT_VERSION}
	@docker push ${strip $(ACCOUNT_NAME)}/${strip $(IMAGE_NAME)}:${CURRENT_VERSION}

deploy-image:
	@kubectl --kubeconfig="connection-config.yaml" apply -f k8s-manifest.yaml

deploy: publish-image deploy-image
