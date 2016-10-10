PRODUCTS_TPL = """

<!-- products.coffee -->
    <ul>
      <% _.each(products, function(prod) { %>
        <li><%= prod %></li>
      <% }); %>
    </ul>
"""