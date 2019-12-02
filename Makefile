PWD := $(shell pwd)

.PHONY: build
build:
	docker build --tag sonos-test --no-cache --pull .

.PHONY: run
run:
	docker run \
		--rm --interactive --tty \
		--network host \
		--volume ${PWD}/logs/$(shell date +"%Y-%m-%dT%H-%M-%S")/:/test/smapi/content_workflow/log_files \
		--volume ${PWD}/conf/smapiConfig.cfg:/test/smapi/service_configs/smapiConfig.cfg \
		sonos-test
