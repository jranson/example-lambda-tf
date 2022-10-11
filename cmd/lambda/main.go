package main

import (
	"fmt"

	"github.com/aws/aws-lambda-go/lambda"
)

func main() {
	lambda.Start(helloWorld)
}

func helloWorld(event interface{}) error {
	fmt.Println("Hello World!")
	return nil
}
