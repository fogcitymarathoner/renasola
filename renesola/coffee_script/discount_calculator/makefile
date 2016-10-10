BASE_SETTINGS_DIR = ../
TEMPLATES_DIR = templates/
DATA_DIR = data/
LOCAL_DATA_DIR = locally_built_data/

discount_calculator.coffee: $(BASE_SETTINGS_DIR)settings.coffee \
$(BASE_SETTINGS_DIR)is_integer.coffee \
$(BASE_SETTINGS_DIR)is_numeric.coffee \
$(BASE_SETTINGS_DIR)is_odd.coffee \
$(BASE_SETTINGS_DIR)is_positive.coffee \
$(BASE_SETTINGS_DIR)urls.coffee \
$(TEMPLATES_DIR)product_line_layout.coffee \
$(TEMPLATES_DIR)classifications_datalist.coffee \
$(TEMPLATES_DIR)products_datalists.coffee \
$(TEMPLATES_DIR)_classification_column.coffee \
$(TEMPLATES_DIR)_product_column.coffee \
$(TEMPLATES_DIR)racking_list_item.coffee \
discount_calculator_settings.coffee \
line_subtotal.coffee \
bottom_line_totals.coffee \
calculate_discount_display.coffee \
row_category_product.coffee \
discount_message.coffee \
product_sales_prices.coffee \
racking_sales_prices.coffee \
set_price_warning.coffee \
get_current_product_id.coffee \
do_racking_price_or_quantity_changed.coffee \
do_product_price_or_quantity_changed.coffee \
window_check_model.coffee \
calculate_line_total.coffee \
price_breaks.coffee \
set_guiden_price.coffee \
subtotal_rounding.coffee \
validate_price_do_line_calculations.coffee \
discount_calculator_base.coffee \
get_next_product_row.coffee \
get_next_racking_row.coffee \
do_add_delete_buttons.coffee \
reregister_add_delete_button_click_hover_callbacks.coffee \
add_row.coffee \
delete_row.coffee \
racking.coffee \
is_discount_eligible.coffee \
fill_in_racking_item_row_default_data.coffee \
fill_in_product_item_row_default_data.coffee \
fill_in_racking_descriptions.coffee \
get_guiden_price_fill_in_itemline.coffee \
alternate_row_backgrounds.coffee \
$(LOCAL_DATA_DIR)categories.coffee \
$(LOCAL_DATA_DIR)racking_descriptions.coffee \
categories_products.coffee \
$(DATA_DIR)racking_package_lists.coffee
	cat $(BASE_SETTINGS_DIR)settings.coffee  \
	discount_calculator_settings.coffee \
	$(LOCAL_DATA_DIR)categories.coffee    \
	$(LOCAL_DATA_DIR)racking_descriptions.coffee    \
	categories_products.coffee \
	$(BASE_SETTINGS_DIR)is_integer.coffee \
	$(BASE_SETTINGS_DIR)is_numeric.coffee \
	$(BASE_SETTINGS_DIR)is_odd.coffee \
	$(BASE_SETTINGS_DIR)is_positive.coffee \
	$(BASE_SETTINGS_DIR)urls.coffee \
	$(DATA_DIR)racking_package_lists.coffee \
	$(TEMPLATES_DIR)classifications_datalist.coffee    \
	$(TEMPLATES_DIR)products_datalists.coffee \
	$(TEMPLATES_DIR)product_line_layout.coffee    \
	$(TEMPLATES_DIR)_classification_column.coffee    \
	$(TEMPLATES_DIR)_product_column.coffee    \
	$(TEMPLATES_DIR)racking_list_item.coffee \
	line_subtotal.coffee \
	bottom_line_totals.coffee \
	calculate_discount_display.coffee \
	row_category_product.coffee \
	fill_in_racking_item_row_default_data.coffee \
	fill_in_product_item_row_default_data.coffee \
	fill_in_racking_descriptions.coffee \
	get_guiden_price_fill_in_itemline.coffee \
	alternate_row_backgrounds.coffee \
	get_next_product_row.coffee \
	get_next_racking_row.coffee \
	do_add_delete_buttons.coffee \
	reregister_add_delete_button_click_hover_callbacks.coffee \
	add_row.coffee \
	delete_row.coffee \
	racking.coffee \
	is_discount_eligible.coffee \
	discount_message.coffee \
	product_sales_prices.coffee \
	racking_sales_prices.coffee \
	set_price_warning.coffee \
	calculate_line_total.coffee \
	price_breaks.coffee \
	set_guiden_price.coffee \
	get_current_product_id.coffee \
	subtotal_rounding.coffee \
	validate_price_do_line_calculations.coffee \
	do_racking_price_or_quantity_changed.coffee \
	do_product_price_or_quantity_changed.coffee \
	window_check_model.coffee \
	discount_calculator_base.coffee  > \
	discount_calculator.coffee

#
# import starter data in makefiles
#
$(LOCAL_DATA_DIR)categories.coffee:
	cd ../../.. && python manage.py import_xlpricelist
	cd ../../.. && python manage.py build_categories_coffee

$(LOCAL_DATA_DIR)racking_descriptions.coffee:
	cd ../../.. && python manage.py import_racking_descriptions
	cd ../../.. && python manage.py build_racking_descriptions
