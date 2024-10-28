.PHONY: deploy
deploy:
	@hugo
	@rsync -avz --delete -e "ssh -i ~/.ssh/id_ed25519_jtyocum" public/ jtyocum@phx01.publicmx.com:/srv/sites/www.publicmx.com/

.PHONE: clean
clean:
	@rm -rf public/
