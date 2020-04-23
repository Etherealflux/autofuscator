.PHONY: run build
DOCKER=docker run --env ORIG_UID=`id -u` --env ORIG_GID=`id -g` --rm -v $(shell pwd)/output:/root/output

run-gen: build
	$(DOCKER) autofuscator:dev bash gen-program.sh csmith-gen.sh "" insert-opaque all-functions.sh "" 1

run-hello: build
	$(DOCKER) autofuscator:dev bash gen-program.sh copy.sh "hello-world.c" insert-opaque all-functions.sh "" 3

build:
	docker build -t autofuscator:dev .

clean:
	rm -rf output
