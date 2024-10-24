.PHONY: image
DOCKER_REPO = registry.us-west-1.aliyuncs.com/labex-course

image:
	docker buildx build --platform linux/amd64 -t ${DOCKER_REPO}/claude-computer-use:latest .
