#!/usr/bin/env bash
# Do cross compilation for the go app
GOOS=linux GOARCH=amd64 go build -v server.go 
