MARP_CLI=marpteam/marp-cli:v1.1.1

help::	## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

up:: 	## up serve
	@docker run --rm --init --name marp -v ${PWD}/docs:/home/marp/app -e LANG=${LANG} -e MARP_USER="$(id -u):$(id -g)" -p 8081:8080 -p 37717:37717 -d $(MARP_CLI) -s --allow-local-files .

down::	## stop
	@docker stop marp

pdf::	## pdf
	@mkdir -p docs/tmp; \
	docker run --rm --init \
		-v ${PWD}/docs:/home/marp/app/ -e LANG=${LANG} -e MARP_USER="$(id -u):$(id -g)" \
		$(MARP_CLI) \
		20201125-jazugn29-bicep.md \
		-o tmp/20201125-jazugn29-bicep.pdf \
		--pdf --allow-local-files

marp::	## marp-cli
	@docker run --rm --init \
		-v ${PWD}/docs:/home/marp/app/ -e LANG=${LANG} -e MARP_USER="$(id -u):$(id -g)" \
		$(MARP_CLI)

