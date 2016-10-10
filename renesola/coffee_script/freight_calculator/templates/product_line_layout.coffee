# product_line_layout.tmpl.coffee
product_line_layout_tpl = """
  <!-- put guard on first item
      add class 'first' to main row div
      make sure three is no delete button
  -->
  <% if (first == true) { %>
      <div id="product-line-item-row-<%= row %>" class="discount-line-item-row row first">
  <% } else { %>
      <div id="product-line-item-row-<%= row %>" class="discount-line-item-row row ">
  <% } %>

  <!-- product_line_layout ROW=<%= row %> -->
  <div class="col-md-3" id="classifications-<%= row %>"></div>

  <div class="col-md-1" id="line-item-inputs-quantity-<%= row %>">
    <input id="product-quantity-<%= row %>" size=5 name="quantity" placeholder="Quantity"  class="freight-calculator-input quantity" disabled/>
  </div>
  <div class="col-md-5 calulation-float" id="line-item-guiden-price-<%= row %>">&nbsp;</div>
  <div class="col-md-1" id="line-item-discount-message-<%= row %>"></div>
  <div class="col-md-1 calulation-float" id="line-item-subtotal-<%= row %>"></div>
  <div class="col-md-1" id="line-item-actions-<%= row %>">

    <% if (first == true) { %>

      <span  id="line-item-add-action-<%= row %>" class="add-line-item-button btn first plus-button"></span>
    <% } %>
    <% if (first != true) { %>
      <span id="line-item-delete-action-<%= row %>" class="delete-line-item-button btn not-first minus-button"></span>
    <% } %>

  </div>
  <!-- CALCULATIONS RESULTS THAT ARE HIDDEN -->
  <div id="input-category-hidden-<%= row %>" class='hidden-data' ></div>
  <div id="input-product-hidden-<%= row %>"  class='hidden-data' ></div>
</div>

"""

# NOTE - BLANK LINE BELOW NECESSARY
