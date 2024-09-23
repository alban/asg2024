package main

import (
	"bytes"
	"crypto/tls"
	"encoding/json"
	"io"
	"net/http"
	"os"
	"time"
)

var duration time.Duration

func init() {
	var err error
	duration, err = time.ParseDuration(os.Getenv("TICKER"))
	if err != nil {
		duration = time.Minute
	}
}

type Result struct {
	Status        string `json:"status"`
	CriticalValue int    `json:"criticalValue"`
}

type Client struct {
}

func (c *Client) RunUploader() {
	ticker := time.NewTicker(duration)
	defer ticker.Stop()
	for range ticker.C {
		// 1. Read "status" file
		fc, err := os.ReadFile("./status.json")
		if err != nil {
			continue
		}
		// 2. Send "status" file to remote; using HTTP1 for greater readability
		client := &http.Client{
			Transport: &http.Transport{
				TLSNextProto: make(map[string]func(authority string, c *tls.Conn) http.RoundTripper),
				TLSClientConfig: &tls.Config{
					InsecureSkipVerify: true,
				},
			},
		}
		req, err := http.NewRequest("POST", "https://server:8443", bytes.NewBuffer(fc))
		if err != nil {
			continue
		}
		req.Header.Add("Accept-Encoding", "*")
		res, err := client.Do(req)
		if err != nil {
			continue
		}
		io.Copy(io.Discard, res.Body)
		res.Body.Close()
	}
}

func (c *Client) RunWorker() {
	ticker := time.NewTicker(duration)
	defer ticker.Stop()
	for range ticker.C {
		ds := &Result{
			Status:        "not crashed",
			CriticalValue: 42,
		}
		xd, _ := json.MarshalIndent(ds, "", "  ")
		os.WriteFile("./status.json", xd, 0o755)
		// enough to run once for the demo
	}
}

func main() {
	cli := &Client{}
	go cli.RunWorker()
	cli.RunUploader()
}
