#
# row_category.coffee
#
# pulls hidden product selection an returns category
#

row_category = (row_id) ->

    hiddencol = "div#input-category-hidden-"+row_id

    selected_product = $(hiddencol).text()

    substr = selected_product.split(':')
    # read hidden elements off dom
    cat = substr[0]
    prod = substr[1]

    return cat

row_product = (row_id) ->

    hiddencol = "div#input-product-hidden-"+row_id

    selected_product = $(hiddencol).text()

    substr = selected_product.split(':')
    # read hidden elements off dom
    prod = substr[0]

    return prod
row_racking_product = (row_id) ->

    hiddencol = "div#racking-input-product-hidden-"+row_id

    selected_product = $(hiddencol).text()

row_racking_category = (row_id) ->

    hiddencol = "div#racking-input-category-hidden-"+row_id

    selected_category = $(hiddencol).text()

# NOTE - BLANK LINE BELOW NECESSARY
