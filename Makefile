IDRIS_VERSION = 1.0
UNITY_VERSION = 5.6.1f1
PWD = $(shell pwd)
REPO = irreverentpixelfeats/idris-unity-build
BASE_TAG = ubuntu_xenial_${IDRIS_VERSION}_${UNITY_VERSION}

git-sha:
	bin/git-version ./latest-version
	diff -q latest-version data/version || cp -v latest-version data/version
	rm latest-version

deps: git-sha

build: deps Dockerfile
	docker pull "${REPO}:${BASE_TAG}" || true
	docker build --cache-from "${REPO}:${BASE_TAG}" --tag "${REPO}:${BASE_TAG}" --tag "${REPO}:${BASE_TAG}-$(shell cat data/version)" .

images/idris-unity-build-${BASE_TAG}.tar.gz: build
	docker image save -o "images/idris-unity-build-${BASE_TAG}.tar" "${REPO}:${BASE_TAG}"
	cd images && gzip -v "idris-unity-build-${BASE_TAG}.tar"

image: images/idris-unity-build-${BASE_TAG}.tar.gz

# The hashes calculated for ADD and COPY content seem to be different
# on different platforms, so the "${REPO}:${BASE_TAG}" image
# doesnt serve as a useful cache on some local dev machines
local-cache:
	docker pull "${REPO}:${BASE_TAG}" || true
	docker build --cache-from "${REPO}:${BASE_TAG}" --tag "${REPO}:local_cache" .
	docker image save -o "images/local-cache.tar" "${REPO}:local_cache"
	cd images && gzip -v "local-cache.tar"

quick:
	docker build --cache-from "${REPO}:local_cache" .

all: build image
