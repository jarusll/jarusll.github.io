assets:
	# copy from posts
	cp content/posts/images/* static/images/.
	# copy from diary
	find ./content/diary -type f -name "*jpg" -exec cp {} static/images/. \;
	find ./content/diary -type f -name "*png" -exec cp {} static/images/. \;

develop: update assets
	docker-compose up --build

production: update assets
	docker-compose -f docker-compose.yml -f production.yml up --build -d

deploy: production
	./convert-to-webp.sh
	# replace 
	sed -r 's_(=/images/\w*)\.(jpg|png)_\1.webp_g' ./public/diary/index.html > ./public/diary/temp.html
	rm ./public/diary/index.html
	mv ./public/diary/temp.html ./public/diary/index.html 
	# clean up diary images
	find public/diary -type f -not -name "index.html" -exec rm -rf {} \;

experimental:
	# gzip everything
	gzip -f -k -6 $(find public -type f)
	# delete everything but gzipped
	find public -type f -not -name "*.gz" -exec rm -rf {} \;

update: 
	cd /home/jarusll/source/jarusll.github.io
	git pull origin master
	cd content/posts && git pull origin master
	cd content/diary && git pull origin main

down:
	docker-compose down
