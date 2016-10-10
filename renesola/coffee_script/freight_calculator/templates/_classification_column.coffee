# pricebook_product_dropdown.tmpl.coffee
_classification_column_tpl = """

<!- classification_column_tpl -->
  <input size=39 type="text" list="product-categories" id="autocomplete-input-category-<%= row %>" class="category-packaging"
  placeholder="Type a few characters of the product category">

  <!-- DOM type variables stored in product_line_layout.coffee -->
"""

# NOTE - BLANK LINE BELOW NECESSARY
