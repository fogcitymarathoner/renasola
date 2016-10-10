APP_NAME = discount_calculator
NAV_APP_NAME = navigation_effects
RACK_UP_APP_NAME = racking_descriptions_status

COFFEE_SRC_DIR = ../../../coffee_script/

NAV_APP_SRC_DIR = $(COFFEE_SRC_DIR)$(NAV_APP_NAME)/
RACK_UP_APP_SRC_DIR = $(COFFEE_SRC_DIR)$(RACK_UP_APP_NAME)/

STATIC_JS_TARGET_DIR = static/js/
APP_JS_TARGET = $(APP_NAME).js
NAV_APP_JS_TARGET = $(NAV_APP_NAME).js

default: $(STATIC_JS_TARGET_DIR)$(APP_JS_TARGET) $(STATIC_JS_TARGET_DIR) \
$(STATIC_JS_TARGET_DIR)$(NAV_APP_JS_TARGET) \
$(STATIC_JS_TARGET_DIR)pricelist_upload_status.js \
$(STATIC_JS_TARGET_DIR)racking_descriptions_status.js \
../../../coffee_script/pricelist_upload_status/pricelist_upload_status.coffee

# START Discount Calculator
$(STATIC_JS_TARGET_DIR)$(APP_JS_TARGET): $(COFFEE_SRC_DIR)$(APP_NAME)/$(APP_NAME).coffee
	coffee -o $(STATIC_JS_TARGET_DIR) -c $(COFFEE_SRC_DIR)$(APP_NAME)/$(APP_NAME).coffee
	cp static/js/discount_calculator.js ../../../../static/js

$(COFFEE_SRC_DIR)$(APP_NAME)/$(APP_NAME).coffee:
	cd $(COFFEE_SRC_DIR); make

# END Discount Calculator
$(STATIC_JS_TARGET_DIR)$(NAV_APP_JS_TARGET): $(NAV_APP_SRC_DIR)$(NAV_APP_NAME).coffee
	coffee -o $(STATIC_JS_TARGET_DIR) -c $(NAV_APP_SRC_DIR)$(NAV_APP_NAME).coffee
	cp static/js/navigation_effects.js ../../../../static/js

$(STATIC_JS_TARGET_DIR):
	mkdir -p $(STATIC_JS_TARGET_DIR)


$(STATIC_JS_TARGET_DIR)pricelist_upload_status.js: ../../../coffee_script/pricelist_upload_status/pricelist_upload_status.coffee

	coffee -o $(STATIC_JS_TARGET_DIR) -c ../../../coffee_script/pricelist_upload_status/pricelist_upload_status.coffee
	cp static/js/pricelist_upload_status.js ../../../../static/js

$(STATIC_JS_TARGET_DIR)racking_descriptions_status.js: ../../../coffee_script/racking_descriptions_status/racking_descriptions_status.coffee

	coffee -o $(STATIC_JS_TARGET_DIR) -c ../../../coffee_script/racking_descriptions_status/racking_descriptions_status.coffee
	cp static/js/racking_descriptions_status.js ../../../../static/js

../../../coffee_script/pricelist_upload_status/pricelist_upload_status.coffee:
	cd ../../../coffee_script/; make


$(NAV_APP_SRC_DIR)$(NAV_APP_NAME).coffee:
	cd ../../../coffee_script/; make