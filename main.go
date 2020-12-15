package main

import (
	"fmt"
	"html"
	"log"
	"net/http"
)

func main() {

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello, %q", html.EscapeString(r.URL.Path))
	})

	port := 8080
	portString := fmt.Sprintf(":%d", port)

	fmt.Printf("server is listening on port: %d", port)
	log.Fatal(http.ListenAndServe(portString, nil))
}
