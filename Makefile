.PHONY: run build

run: build
	docker run --rm -v $(shell pwd)/output:/root/output autofuscator:dev bash gen-program.sh

build:
	docker build -t autofuscator:dev .

clean:
	rm -rf output
