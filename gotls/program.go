package main

import (
	"bufio"
	"bytes"
	"io"
	"net/http"

	api "github.com/inspektor-gadget/inspektor-gadget/wasmapi/go"
)

//export gadgetInit
func gadgetInit() int {
	ds, err := api.GetDataSource("raw")
	if err != nil {
		api.Warnf("failed to get datasource: %v", err)
		return 1
	}

	bufField, err := ds.GetField("buf")
	if err != nil {
		api.Warnf("failed to get buf: %v", err)
		return 1
	}

	opField, err := ds.GetField("op")
	if err != nil {
		api.Warnf("failed to get op: %v", err)
		return 1
	}

	readBuf := make([]byte, 0)
	writeBuf := make([]byte, 0)
	var tmpReq *http.Request

	ds.Subscribe(func(ds api.DataSource, data api.Data) {
		buf, _ := bufField.Bytes(data)
		op, _ := opField.String(data)
		switch op {
		case "WRITE":
			writeBuf = append(writeBuf, buf...)
			req, err := http.ReadRequest(bufio.NewReader(bytes.NewBuffer(writeBuf)))
			if err == io.EOF {
				// incomplete, wait for more
				return
			}
			api.Infof("Requested URL is: %s", req.URL.String())
			username, password, ok := req.BasicAuth()
			if ok {
				api.Infof("Received credentials: username=%s, password=%s", username, password)
			}
			body, _ := io.ReadAll(req.Body)
			req.Body.Close()
			api.Infof("Body is: %s", string(body))
			writeBuf = make([]byte, 0)
			tmpReq = req
		case "READ":
			readBuf = append(readBuf, buf...)
			res, err := http.ReadResponse(bufio.NewReader(bytes.NewBuffer(readBuf)), tmpReq)
			if err == io.EOF {
				// incomplete, wait for more
				return
			}
			res.Body.Close()
			readBuf = make([]byte, 0)
		}
		return
	}, 0)
	return 0
}

func main() {}
