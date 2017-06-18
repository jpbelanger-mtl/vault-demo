package main

import (
	"io/ioutil"
	"log"
	"os"
	"strings"
)

func main() {
	env := os.Environ()

	log.Printf("Injected DEMO* env variables: ")
	for _, v := range env {
		if strings.HasPrefix(v, "DEMO") {
			log.Printf("\t%s", v)
		}
	}

	log.Print("")
	log.Printf("Injected files:")
	files, err := ioutil.ReadDir("/injected")
	if err != nil {
		log.Fatal(err)
	}

	for _, file := range files {
		log.Printf("\t%s", file.Name())
	}
}
