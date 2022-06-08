assets:
	# copy from posts
	cp content/posts/images/* static/images/.
	# copy from diary
	find ./content/diary -type f -name "*jpg" -exec cp {} static/images/. \;

develop: assets
	docker-compose up --build

production: assets
	docker-compose -f docker-compose.yml -f production.yml up --build
