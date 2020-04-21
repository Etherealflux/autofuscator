.PHONY: run build

run: build
	docker run --rm -v $(pwd)/output:/root/output autofuscator:dev bash gen-program.sh

build:
	docker build -t autofuscator:dev .
