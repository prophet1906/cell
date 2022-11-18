update:
	bundle update
exec:
	bundle exec
clean:
	bundle exec jekyll build
build:
	bundle exec jekyll build
serve:
	bundle exec jekyll serve
build-prod:
	JEKYLL_ENV=production bundle exec jekyll build
clean:
	bundle exec jekyll clean
minima-path:
	bundle info --path minima