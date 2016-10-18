DEPLOY_DIR:=/var/www/html/learngitthehardway/dec

all:
	asciidoctor -T asciidoctor-reveal.js/templates/slim docker_enterprise_checklist.asciidoc
	rm -f docker_enterprise_checklist.pdf docker_enterprise_checklist.tar
	asciidoctor-pdf docker_enterprise_checklist.asciidoc
	rm -f docker_enterprise_checklist.tar.gz && tar -zcvf /tmp/docker_enterprise_checklist.tar.gz . && mv /tmp/docker_enterprise_checklist.tar.gz .
	mkdir -p $(DEPLOY_DIR)
	cp -R docker_enterprise_checklist.html $(DEPLOY_DIR)/index.html
	cp -R images $(DEPLOY_DIR)
	cp -R reveal.js $(DEPLOY_DIR)

setup: install asciidoctor-reveal.js reveal.js

asciidoctor-reveal.js:
	git clone git://github.com/asciidoctor/asciidoctor-reveal.js.git

reveal.js:
	git clone git://github.com/hakimel/reveal.js.git

install:
	sudo gem install asciidoctor slim thread_safe




