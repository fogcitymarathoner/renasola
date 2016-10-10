

CATEGORY_SLUG_LOOKUP = []

for c in Object.keys(CategoryList)
  CATEGORY_SLUG_LOOKUP.push({ 'slug': c, 'category': CategoryList[c]['category']})
CATEGORIES_DATALIST_TPL = """

<!-- classifications_datalist.coffee -->
<datalist id="product-categories">
    <% _.each(data, function(category) { %>
        <option value="<%= category['category'] %>"></option>
    <% }); %>
</datalist>

"""
# setup categories datalist
compiled = _.template(CATEGORIES_DATALIST_TPL)
rendered = compiled
  data: CATEGORY_SLUG_LOOKUP
$('#freight-calculator-datalists').append(rendered)
# NOTE - BLANK LINE BELOW NECESSARY
