package main

import "net/http"

func main() {
	mux := http.NewServeMux()
	mux.HandleFunc("/process", func(writer http.ResponseWriter, request *http.Request) {
		writer.WriteHeader(http.StatusOK)
	})
	err := http.ListenAndServeTLS(":8443", "server.cert", "server.key", mux)
	if err != nil {
		panic(err)
	}
}
