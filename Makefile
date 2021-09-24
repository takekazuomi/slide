MARP_CLI=marpteam/marp-cli:v1.4.0
MD_FILES=$(wildcard docs/*.md)
PDF_FILES=$(MD_FILES:md=pdf)

help::	## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

up:: 	## up serve
	@docker run --rm --init --name marp -v ${PWD}/docs:/home/marp/app -e LANG=${LANG} -e MARP_USER="$$(id -u):$$(id -g)" -p 8081:8080 -p 37717:37717 -d $(MARP_CLI) -s --allow-local-files .

down::	## stop
	@docker stop marp

docs/%.pdf: docs/%.md
	docker run --rm --init \
		-v ${PWD}:/home/marp/app/ -e LANG=${LANG} -e MARP_USER="$$(id -u):$$(id -g)" \
		$(MARP_CLI) \
		$< \
		-o $@ \
		--pdf --allow-local-files

marp::	## marp-cli
	@docker run --rm --init \
		-v ${PWD}/docs:/home/marp/app/ -e LANG=${LANG} -e MARP_USER="$$(id -u):$$(id -g)" \
		$(MARP_CLI)

pdf:: 	## generate pdfs
pdf:: $(PDF_FILES)
