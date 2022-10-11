package main

import "testing"

func TestHelloWorld(t *testing.T) {
	err := helloWorld(map[string]string{"hello": "world?"})
	if err != nil {
		t.Error(err)
	}
}
