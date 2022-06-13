assets:
	# copy from posts
	cp content/posts/images/* static/images/.
	# copy from diary
	find ./content/diary -type f -name "*jpg" -exec cp {} static/images/. \;
	find ./content/diary -type f -name "*png" -exec cp {} static/images/. \;

develop: assets
	docker-compose up --build

production: assets
	docker-compose -f docker-compose.yml -f production.yml up --build -d

update: 
	cd /home/jarusll/source/jarusll.github.io
	git pull origin master
	cd content/posts && git pull origin master
	cd content/diary && git pull origin main

down:
	docker-compose down
