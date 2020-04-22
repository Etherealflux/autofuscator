.PHONY: run build

run-gen: build
	docker run --rm -v $(shell pwd)/output:/root/output autofuscator:dev bash gen-program.sh csmith-gen.sh "" insert-opaque

run-hello: build
	docker run --rm -v $(shell pwd)/output:/root/output autofuscator:dev bash gen-program.sh copy.sh "hello-world.c" insert-opaque

build:
	docker build -t autofuscator:dev .

clean:
	rm -rf output
