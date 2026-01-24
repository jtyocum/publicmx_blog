.PHONY: deploy
deploy:
	@hugo
	@rsync -avz --delete -e "ssh -i ~/.ssh/id_ed25519_jtyocum" public/ jtyocum@fsn01.publicmx.com:/srv/www/vhosts/publicmx.com/html/

.PHONE: clean
clean:
	@rm -rf public/
