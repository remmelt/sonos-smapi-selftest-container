PWD := $(shell pwd)

.PHONY: build
build:
	docker build -t sonos-test .

.PHONY: run
run:
	docker run -it -v ${PWD}/logs:/test/smapi/content_workflow/log_files -v ${PWD}/conf:/test/smapi/service_configs sonos-test
