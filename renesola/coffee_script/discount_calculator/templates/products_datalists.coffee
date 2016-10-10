PRODUCTS_DATALISTS_TPL = """

<!-- products_datalists.coffee -->
    <% _.each(data, function(category) { %>
      <datalist id="<%= S(category['description']).slugify().s %>">
        <% _.each(category['products'], function(product) { %>
            <option value="<%= product['description'] %>">
            </option>
        <% }); %>
      </datalist>
    <% }); %>

"""
# setup products datalists
compiled = _.template(PRODUCTS_DATALISTS_TPL)
rendered = compiled
  data: CategoryList
$('#discount-calculator-datalists').append(rendered)
# NOTE - BLANK LINE BELOW NECESSARY
