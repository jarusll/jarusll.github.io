all: assets update-submodules build

.PHONY: assets
assets:
	# copy from posts
	cp content/posts/images/* static/images/.
	# copy from diary
	find ./content/diary -type f -name "*jpg" -exec cp {} static/images/. \;

.PHONY: update-submodules
update-submodules:
	git submodule update --init --recursive
	git submodule update --recursive --remote

.PHONY: build
build:
	hugo --minify
