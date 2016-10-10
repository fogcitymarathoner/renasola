
# discount_calculator_base.coffee

# Dependencies in makefile target

#################################################
# Setup layout

add_row(true)
##############
# THESE CLICK EVENTS DON'T WORK
#
$('input:radio[name=racking-choice]').change set_racking_package
# fill in racking descriptions in table holding radio buttons
fill_in_racking_descriptions()
$('#bottom-remove-racking-selection-action').click  ->
    remove_racking_package()
    $('#r1').attr('checked', false)
    $('#r2').attr('checked', false)
    $('#r3').attr('checked', false)
    return
# NOTE - BLANK LINE BELOW NECESSARY
