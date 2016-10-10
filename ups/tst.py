from ClassicUPS import UPSConnection
license_number = "7CEACE3E25A4C796"
user_id = "fogcitymarathone"
shipper_number = "Y2E259"
password = "F1amingred"
# Credentials obtained from the UPS website
ups = UPSConnection(license_number,
                    user_id,
                    password,
                    shipper_number,  # Optional if you are not creating a shipment
                    debug=True)      # Use the UPS sandbox API rather than prod
					
					
					
					
from_addr = {
    'name': 'Google',
    'address1': '1600 Amphitheatre Parkway',
    'city': 'Mountain View',
    'state': 'CA',
    'country': 'US',
    'postal_code': '94043',
    'phone': '6502530000'
}
to_addr = {
    'name': 'President',
    'address1': '1600 Pennsylvania Ave',
    'city': 'Washington',
    'state': 'DC',
    'country': 'US',
    'postal_code': '20500',
    'phone': '2024561111'
}
dimensions = {  # in inches
    'length': 1,
    'width': 4,
    'height': 9
}
weight = 10  # in lbs

# Create the shipment. Use file_format='EPL' for a thermal-printer-compatible EPL
shipment = ups.create_shipment(from_addr, to_addr, dimensions, weight,
                               file_format='GIF')

# Print information about our shipment
print shipment.cost
print shipment.tracking_number

# Save the shipping label to print, email, etc
shipment.save_label(open('label.gif', 'wb'))

