
STATIC_DIR = static/
STATIC_JS_DIR = $(STATIC_DIR)js
COFFEE_DIR = renesola/coffee_script/

all: static/js/discount_calculator.js static/js/freight_calculator.js

php:
	mkdir -p /var/www/html/ups
	rsync -ahv --delete --exclude="vendor" renesola/php_apps/ups /var/www/html
	#cd /var/www/html/ups ; yes | composer install

static/js/discount_calculator.js:
	cd $(STATIC_DIR); make
	echo 'EVERYTHING MADE!!'
static/js/freight_calculator.js:
	cd $(STATIC_DIR); make
	echo 'EVERYTHING MADE!!'


clean:
	echo $(STATIC_JS_DIR); cd $(STATIC_JS_DIR); rm -f discount_calculator.js
	cd $(STATIC_JS_DIR); rm -f freight_calculator.js
	cd $(STATIC_JS_DIR); rm -f pricelist_upload_status.js

	cd $(STATIC_JS_DIR); rm -f racking_descriptions_status.js
	cd $(STATIC_JS_DIR); rm -f navigation_effects.js

	cd renesola/apps/pricing/crm/static/js; rm -f discount_calculator.js

	cd renesola/apps/pricing/crm/static/js; rm -f pricelist_upload_status.js
	cd renesola/apps/pricing/crm/static/js; rm -f racking_descriptions_status.js
	cd renesola/apps/pricing/crm/static/js; rm -f navigation_effects.js
	cd renesola/coffee_script/discount_calculator; rm -f discount_calculator.coffee
	cd renesola/coffee_script/freight_calculator ; rm -f freight_calculator.coffee

	cd renesola/apps/pricing/crm/static/js/ ; rm -f discount_calculator.js js/
	cd renesola/apps/freight/static/js/; rm -f freight_calculator.js js/
	cd renesola/coffee_script/discount_calculator/locally_built_data/; rm -f categories.coffee
	cd renesola/coffee_script/discount_calculator/locally_built_data/; rm -f racking_descriptions.coffee


	make

doc: doc/build/html
	rsync -rahv doc/build/html /var/www/html/ups/webroot/doc

doc/build/html:
	cd doc/ ; make html
