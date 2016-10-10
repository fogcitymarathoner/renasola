APP_NAME = freight_calculator

COFFEE_SRC_DIR = ../../coffee_script/

NAV_APP_SRC_DIR = $(COFFEE_SRC_DIR)$(NAV_APP_NAME)/

STATIC_JS_TARGET_DIR = static/js/
APP_JS_TARGET = $(APP_NAME).js

default: $(STATIC_JS_TARGET_DIR)$(APP_JS_TARGET) $(STATIC_JS_TARGET_DIR) \
$(STATIC_JS_TARGET_DIR)$(NAV_APP_JS_TARGET)
# START Freight Calculator
$(STATIC_JS_TARGET_DIR)$(APP_JS_TARGET): $(COFFEE_SRC_DIR)$(APP_NAME)/$(APP_NAME).coffee
	coffee -o $(STATIC_JS_TARGET_DIR) -c $(COFFEE_SRC_DIR)$(APP_NAME)/$(APP_NAME).coffee
	cp static/js/freight_calculator.js ../../../static/js


$(STATIC_JS_TARGET_DIR):
	mkdir -p $(STATIC_JS_TARGET_DIR)


$(COFFEE_SRC_DIR)$(APP_NAME)/$(APP_NAME).coffee:
	cd $(COFFEE_SRC_DIR); make