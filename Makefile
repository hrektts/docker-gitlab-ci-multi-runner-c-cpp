all: build

build:
	@docker build --tag=hrektts/gitlab-ci-multi-runner-c-cpp:latest .

release: build
	@docker build --tag=hrektts/gitlab-ci-multi-runner-c-cpp:$(shell cat VERSION) .
