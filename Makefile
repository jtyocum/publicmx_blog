.PHONY: deploy
deploy:
	@hugo
	@rsync -avz --delete -e "ssh -i ~/.ssh/id_ed25519_jtyocum" public/ jtyocum@sea01.publicmx.com:/var/www/publicmx.com/html/

.PHONE: clean
clean:
	@rm -rf public/
