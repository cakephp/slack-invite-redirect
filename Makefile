URL:=https://join.slack.com/t/cakesf/shared_invite/zt-1s8uiynk7-sGawTqD~0ctcU_x5aZlYoA

public/index.html: public/index-template.html
	# Janky templating.
	php -r '$$f = file_get_contents("./public/index-template.html"); $$d = str_replace(["{URL}", "{DATE}"], ["$(URL)", date("Y-m-dTH:i:s")], $$f); file_put_contents("./public/index.html", $$d);'

.PHONY: build
build: public/index.html

.PHONY: clean
clean:
	rm public/index.html
