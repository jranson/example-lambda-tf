install: # installs required golang pkgs and tf modules for dev environment
	go mod tidy && go mod vendor && go mod tidy && go mod vendor && \
	cd terraform && terraform init

test: # runs unit tests
	go test -v ./... 

build: # builds the binary file for distribution as a lambda
	mkdir -p ./bin/lambda && \
	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o ./bin/lambda/main -a -v ./cmd/lambda

clean: # removes built binaries and other artifacts
	rm -rf ./bin

plan: # a dry-run of a terraform deployment
	cd terraform && terraform plan

fmt: # fixes any formatting issues in the terraform configs
	cd terraform && terraform fmt

deploy: # deploys the lambda out to AWS
	cd terraform && terraform apply

destroy: # removes the deployed lambda from AWS
	cd terraform && terraform destroy
