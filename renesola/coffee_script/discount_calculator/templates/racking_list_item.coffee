# full_list_item.tmpl.coffee
#
# used for list item of racking system
# WARNING = this must be in perfect sync with product_line_layout.coffee
#
racking_list_item_tpl = """
<div id="racking-line-item-row-<%= row %>" class="racking-line-item-row row">
  <!-- racking system add_racking_package.coffee  -->
  <!-- product_line_layout ROW=<%= row %> -->
  <div class="col-md-3" id="classifications-<%= row %>">Solar Racking System</div>
  <div class="col-md-3" id="products-<%= row %>"><%= prod['description']%></div>
  <div class="col-md-1" id="line-item-inputs-<%= row %>">

      <input id="racking-price-<%= row %>" size=5 name="sales-price"/ placeholder="Sales Price" class="racking-line-item-input sales-price">

  </div>
  <div class="col-md-1" id="line-item-inputs-<%= row %>">

      <!-- user_input_quantity_price.coffee -->
      <!-- NOTE: ids must be 3 tokens wide -->

    <input id="racking-quantity-<%= row %>" size=5 name="quantity" placeholder="Quantity"  class="racking-line-item-input sales-price"/>

  </div>
  <div class="col-md-1 calulation-float" id="racking-line-item-guiden-price-<%= row %>">&nbsp;</div>
  <div class="col-md-1" id="racking-line-item-discount-message-<%= row %>"></div>
  <div class="col-md-1 calulation-float" id="racking-line-item-subtotal-<%= row %>"></div>
  <div class="col-md-1" id="racking-line-item-actions-<%= row %>">
      <span id="line-item-delete-action-<%= row %>" class="delete-racking-line-item-button btn not-first minus-button"></span>
  </div>
  <!-- CALCULATIONS RESULTS THAT ARE HIDDEN -->
  <div id="racking-input-category-hidden-<%= row %>"  class='hidden-data'>Solar Racking System</div>
  <div id="racking-input-product-hidden-<%= row %>"  class='hidden-data'><%= prod['description']%></div>
</div>
"""




# NOTE - BLANK LINE BELOW NECESSARY



