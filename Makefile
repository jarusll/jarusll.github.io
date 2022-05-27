assets:
	cp content/fragments/images/* static/images/.
	cp content/posts/images/* static/images/.
	find ./content/diary -type f -name "*jpg" -exec cp {} static/images/. \;
