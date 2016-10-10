BASE_SETTINGS_DIR = ../
TEMPLATES_DIR = templates/
DATA_DIR = data/
LOCAL_DATA_DIR = locally_built_data/

freight_calculator.coffee: $(BASE_SETTINGS_DIR)settings.coffee \
$(BASE_SETTINGS_DIR)is_integer.coffee \
$(BASE_SETTINGS_DIR)is_numeric.coffee \
$(BASE_SETTINGS_DIR)is_odd.coffee \
$(BASE_SETTINGS_DIR)is_positive.coffee \
$(BASE_SETTINGS_DIR)urls.coffee \
$(LOCAL_DATA_DIR)categories.coffee \
$(TEMPLATES_DIR)product_line_layout.coffee \
$(TEMPLATES_DIR)_classification_column.coffee \
$(TEMPLATES_DIR)classifications_datalist.coffee \
do_product_quantity_changed.coffee \
set_product_package_set.coffee \
do_add_delete_buttons.coffee \
window_check_model.coffee \
categories_products.coffee \
alternate_row_backgrounds.coffee \
reregister_add_delete_button_click_hover_callbacks.coffee \
freight_calculator_settings.coffee \
freight_calculator_base.coffee \
get_next_product_row.coffee \
add_row.coffee \
freight_calculator_base.coffee
	cat $(BASE_SETTINGS_DIR)settings.coffee  \
	freight_calculator_settings.coffee \
	$(LOCAL_DATA_DIR)categories.coffee \
	$(BASE_SETTINGS_DIR)is_integer.coffee \
	$(BASE_SETTINGS_DIR)is_numeric.coffee \
	$(BASE_SETTINGS_DIR)is_odd.coffee \
	$(BASE_SETTINGS_DIR)is_positive.coffee \
	$(BASE_SETTINGS_DIR)urls.coffee \
	$(TEMPLATES_DIR)product_line_layout.coffee \
	$(TEMPLATES_DIR)_classification_column.coffee \
	$(TEMPLATES_DIR)classifications_datalist.coffee \
	do_product_quantity_changed.coffee \
	set_product_package_set.coffee \
	do_add_delete_buttons.coffee \
	window_check_model.coffee \
	categories_products.coffee \
	alternate_row_backgrounds.coffee \
	reregister_add_delete_button_click_hover_callbacks.coffee \
	get_next_product_row.coffee \
	add_row.coffee \
	freight_calculator_base.coffee  > \
	freight_calculator.coffee


$(LOCAL_DATA_DIR)categories.coffee:
	cd ../../..; python manage.py build_products_packagin_coffee