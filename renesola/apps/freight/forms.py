__author__ = 'marc'


from django import forms

from django.conf import settings
class UpsRateForm(forms.Form):

    """
    from_addr_name = forms.CharField(max_length=100, required=False, initial='Google')
    from_addr_address1 = forms.CharField(max_length=100, required=False, initial='1600 Amphitheatre Parkway')
    from_addr_city = forms.CharField(max_length=100, required=False, initial='Mountain View')
    from_addr_state = forms.CharField(max_length=100, required=False, initial='CA')
    from_addr_country = forms.CharField(max_length=100, required=False, initial='US')
    """
    from_addr_postal_code = forms.CharField(max_length=100, initial='94043')
    """
    from_addr_phone = forms.CharField(max_length=100, required=False, initial='6502530000')


    to_addr_name = forms.CharField(max_length=100, required=False, initial='President')
    to_addr_address1 = forms.CharField(max_length=100, required=False, initial='1600 Pennsylvania Ave')
    to_addr_city = forms.CharField(max_length=100, required=False, initial='Washington')
    to_addr_state = forms.CharField(max_length=100, required=False, initial='DC')
    to_addr_country = forms.CharField(max_length=100, required=False, initial='US')
    """
    to_addr_postal_code = forms.CharField(max_length=100, initial='20500')
    """
    to_addr_phone = forms.CharField(max_length=100, required=False, initial='2024561111')
    """
    dim_length = forms.IntegerField(initial=1)
    dim_width = forms.IntegerField(initial=4)
    dim_height = forms.IntegerField(initial=9)

    weight = forms.IntegerField(initial=10)
    quantity = forms.IntegerField(initial=1)
    number_of_pieces = forms.IntegerField(initial=25)
    freight_class = forms.IntegerField(initial=85)

    payer_name = forms.CharField(max_length=100, required=False, initial='Payer inc')
    payer_address1 = forms.CharField(max_length=100, required=False, initial='435 SOUTH STREET')
    payer_city = forms.CharField(max_length=100, required=False, initial='RIS TOWNSHIP')
    payer_state = forms.CharField(max_length=100, required=False, initial='NJ')
    payer_postal_code = forms.CharField(max_length=100, initial='94105')

    user_id = forms.CharField(max_length=100, required=False, initial=settings.UPS_USER_ID)
    password = forms.CharField(max_length=100, required=False, initial=settings.UPS_USER_PASSWORD)
    access_key = forms.CharField(max_length=100, required=False, initial=settings.UPS_ACCESS_KEY)
    ups_endpoint_url = forms.CharField(max_length=100, required=False, initial=settings.UPS_ENDPOINT_URL,
                                       help_text='sandbox https://wwwcie.ups.com/webservices/FreightRat')
    service_name = forms.CharField(max_length=100, required=False, initial='Freight Rate WS',
                                   help_text='was RateChecking Option, makes no difference')

