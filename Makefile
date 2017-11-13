all: build

build:
	docker build -t lsstsqre/gitlfs:latest .
