package main

import (
	"log"
	"os"
	"text/template"
)

type BuildConfig struct {
	ImageName string
	OS_Type   string
}

type RenderData struct {
	MetaData     string
	BuildConfigs []BuildConfig
}

func main() {

	baseTemplate, err := template.ParseFiles("source.tmpl")
	if err != nil {
		panic(err)
	}

	data := RenderData{
		MetaData: "TestData",
		BuildConfigs: []BuildConfig{
			BuildConfig{"Test-Image-1", "Windows"},
			BuildConfig{"Test-Image-2", "Linux"},
		},
	}

	f, err := os.Create("output.pkr.hcl")
	if err != nil {
		log.Println("Error creating output file: ", err)
	}

	baseTemplate.Execute(f, data)

}
