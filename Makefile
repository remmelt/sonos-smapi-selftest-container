PWD := $(shell pwd)

.PHONY: build
build:
	docker build -t sonos-test .

.PHONY: run
run:
	docker run \
		--rm --interactive --tty \
		--network host \
		--volume ${PWD}/logs:/test/smapi/content_workflow/log_files \
		--volume ${PWD}/conf:/test/smapi/service_configs \
		sonos-test
