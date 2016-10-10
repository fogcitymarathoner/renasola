CATEGORIES_DATALIST_TPL = """

<!-- classifications_datalist.coffee -->
<datalist id="product-categories">
    <% _.each(data, function(category) { %>
        <option value="<%= category['description'] %>">
        </option>
    <% }); %>
</datalist>

"""
# setup categories datalist
compiled = _.template(CATEGORIES_DATALIST_TPL)
rendered = compiled
  data: CategoryList
$('#discount-calculator-datalists').append(rendered)
# NOTE - BLANK LINE BELOW NECESSARY
