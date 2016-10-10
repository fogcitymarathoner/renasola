__author__ = 'marc'
import json
import requests
from xml.etree import ElementTree
from django.conf import settings
from django.views.generic.edit import FormView

from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.core.urlresolvers import reverse
from freight.forms import UpsRateForm
from django.shortcuts import render

from django.template import RequestContext
from ClassicUPS import UPSConnection
def pretty_print_xml(xml):
    import subprocess
    proc = subprocess.Popen(
        ['xmllint', '--format', '/dev/stdin'],
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
    )
    (output, error_output) = proc.communicate(xml);
    return output
# TEMPLATE VIEWS
class FreightIndexView(FormView):
    template_name = "freight/index.html"

    form_class = UpsRateForm

    def get_success_url(self):
        return reverse('upload_racking_descriptions')
    def form_valid(self, form):
        # This method is called when valid form data has been POSTed.
        # It should return an HttpResponse.


        return super(UploadRackingDescriptionsInfoView, self).form_valid(form)

    def get(self, request, **kwargs):

        form_class = self.get_form_class()
        form = self.get_form(form_class)
        return render(request, self.template_name,
            {
                'title': 'Freight Calculator Test',
                'form': form,
                'cost': 0,
                'tracking_number': '',
            },
            context_instance=RequestContext(request))
    def post(self, request, *args, **kwargs):
        form = self.form_class(request.POST, request.FILES)
        if form.is_valid():
            data = form.cleaned_data
            payload = {
                'from_addr_postal_code': data['from_addr_postal_code'],
                'to_addr_postal_code': data['to_addr_postal_code'],
                'weight': data['weight'],
                'dim_length': data['dim_length'],
                'dim_width': data['dim_width'],
                'dim_height': data['dim_height'],
                'quantity': data['quantity'],
                'number_of_pieces': data['number_of_pieces'],
                'freight_class': data['freight_class'],
                'payer_name': data['payer_name'],
                'payer_address1': data['payer_address1'],
                'payer_city': data['payer_city'],
                'payer_state': data['payer_state'],
                'payer_postal_code': data['payer_postal_code'],
                'userid': data['user_id'],
                'passwd': data['password'],
                'access': data['access_key'],
                'endpointurl': data['ups_endpoint_url'],
                'service_name': data['service_name'],
                #'userid': settings.UPS_USER_ID,
                #'passwd': settings.UPS_USER_PASSWORD,
                #'access': settings.UPS_ACCESS_KEY,
                #'endpointurl': settings.UPS_ENDPOINT_URL,


            }

            r = requests.post(settings.UPS_RATE_GATEWAY_URL, params=payload)
            try:
                root = ElementTree.fromstring(r.content.replace('freightRate:', '').replace('common:','').replace('soapenv:', ''))

                cost =  root.findall('./Body/FreightRateResponse/TotalShipmentCharge/MonetaryValue')[0].text
            except:
                results = r.text
                cost = 'in error'
            # Print information about our shipment
            return render(request, self.template_name,
                {
                    'title': 'Freight Calculator Test',
                    'form': form,
                    'results': pretty_print_xml(r.content.replace('freightRate:', '').replace('common:','').replace('soapenv:', '')),
                    'cost': cost
                },
                context_instance=RequestContext(request))
        else:
            return render(request, self.template_name, {'form': form})


