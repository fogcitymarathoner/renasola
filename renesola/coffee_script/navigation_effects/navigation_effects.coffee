# navigation_effects.coffee
#
# manages sidebars and tabs based on <title>
#
TITLE_ELE = $('#title')
HOME_NAVBAR_LINK_ELE = $('#navbar-home-link')
DISCOUNT_CALCULATOR_NAVBAR_LINK_ELE = $('#navbar-discount-calculator-link')
TOOLS_NAVBAR_DROPDOWN_MENU_ELE = $('#navbar-tools-dropdown-menu')

SetMenuItemToActive = (ele) ->
  ele.removeClass('inactive')
  ele.addClass('active')
SetMenuItemToInactive = (ele) ->
  ele.removeClass('active')
  ele.addClass('inactive')
SetAllMenuItemsToInactive = () ->
  SetMenuItemToInactive(HOME_NAVBAR_LINK_ELE)
  SetMenuItemToInactive(DISCOUNT_CALCULATOR_NAVBAR_LINK_ELE)
  return true
OpenDropDownMenu = (ele) ->
  ele.addClass('open')
CloseDropDownMenu = (ele) ->
  ele.removeClass('open')

ClossAllDropDownMenus = () ->
  CloseDropDownMenu(TOOLS_NAVBAR_DROPDOWN_MENU_ELE)
SetMenuItemActiveWithTitle = () ->
  title = TITLE_ELE.text().trim()
  console.log 'setting effects for page titled ' + title
  SetAllMenuItemsToInactive()
  ClossAllDropDownMenus()
  if title == 'Discount Calculator'
    OpenDropDownMenu(TOOLS_NAVBAR_DROPDOWN_MENU_ELE)
    SetMenuItemToActive(DISCOUNT_CALCULATOR_NAVBAR_LINK_ELE)
    return true
  else if title == 'Upload Pricelist'
    return true
  else if title == 'Pricelist'
    return true

  return true
SetMenuItemActiveWithTitle()
####################################################################

# NOTE - BLANK LINE BELOW NECESSARY
