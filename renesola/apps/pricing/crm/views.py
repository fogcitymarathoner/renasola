from django.shortcuts import render
from django.conf import settings
from pricing.crm.models import ProductClassification
from pricing.crm.models import Product
from pricing.crm.models import Price

from rest_framework import viewsets
from pricing.crm.serializers import ProductClassificationSerializer
from pricing.crm.serializers import ProductSerializer
from pricing.crm.serializers import PriceSerializer
from pricing.crm.serializers import ProductWithPricesSerializer

from pricing.crm.forms import SimpleFileForm
from pricing.crm.models import Price
from django.views.generic.edit import FormView
from django.views.generic import TemplateView
from django.views.generic import ListView

from django.views.generic import View

from braces import views

from django.shortcuts import render, redirect
from django.core.urlresolvers import reverse
from django.conf import settings
from django.template import RequestContext
from renesola_lib.import_xl import handle_uploaded_file
from renesola_lib.import_iron_ridge import handle_uploaded_file as handle_descriptions_uploaded_file
import redis
import json
from kombu import Connection
from kombu_workers.send_task_interface import send_as_task

# LIST VIEWS


# FORM VIEWS

class UploadRackingDescriptionsView(FormView):
    template_name = "pricing/crm/upload-racking-descriptions.html"
    form_class = SimpleFileForm

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
                'title': 'Upload Racking Descriptions',
                'form': form,
            },
            context_instance=RequestContext(request))
    def post(self, request, *args, **kwargs):
        form = self.form_class(request.POST, request.FILES)
        if form.is_valid():

            connection = Connection('amqp://guest:guest@localhost:%s//'%settings.KOMBU_WORKER_PORT)
            send_as_task(connection, fun=handle_descriptions_uploaded_file, args=(request.FILES['file'], ), kwargs={},
                 priority='high')
            return redirect(self.get_success_url())
        else:
            return render(request, self.template_name, {'form': form})

class UploadPricelistView(FormView):
    template_name = "pricing/crm/upload-pricelist.html"
    form_class = SimpleFileForm


    def get_success_url(self):
        return reverse('pricelist_post_upload_info')
    def form_valid(self, form):
        # This method is called when valid form data has been POSTed.
        # It should return an HttpResponse.


        return super(UploadPricelistView, self).form_valid(form)

    def get(self, request, **kwargs):

        form_class = self.get_form_class()
        form = self.get_form(form_class)
        return render(request, self.template_name,
            {
                'title': 'Upload Pricelist',
                'form': form,
            },
            context_instance=RequestContext(request))
    def post(self, request, *args, **kwargs):
        form = self.form_class(request.POST, request.FILES)
        if form.is_valid():

            connection = Connection('amqp://guest:guest@localhost:%s//'%settings.KOMBU_WORKER_PORT)
            send_as_task(connection, fun=handle_uploaded_file, args=(request.FILES['file'], ), kwargs={},
                 priority='high')
            return redirect(self.get_success_url())
        else:
            return render(request, self.template_name, {'form': form})
# TEMPLATE VIEWS
class PricingCrmIndexView(TemplateView):
    template_name = "pricing/crm/index.html"
class UploadPricelistInfoView(TemplateView):
    template_name = "pricing/crm/post_pricelist_info.html"
class UploadRackingDescriptionsInfoView(TemplateView):
    template_name = "pricing/crm/post_racking_descriptions_info.html"

class DiscountCalculatorView(TemplateView):
    template_name = "pricing/crm/discount_calculator.html"
    def get(self, request, **kwargs):
        return render(request, self.template_name,
            {
                'title': 'Discount Calculator',
            },
            context_instance=RequestContext(request))

# SERIALIZER VIEWS
class PriceViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = Price.objects.all()
    serializer_class = PriceSerializer

class ProductClassificationViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = ProductClassification.objects.all()
    serializer_class = ProductClassificationSerializer


class ProductViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = Product.objects.all()
    serializer_class = ProductSerializer

class ProductPriceViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = Product.objects.all()
    serializer_class = ProductWithPricesSerializer

# JsonResponseViews
#
class PriceListUploadStatusView(views.JSONResponseMixin, views.AjaxResponseMixin, View):
    r = redis.StrictRedis(host='localhost', port=settings.REDIS_PORT, db=settings.REDIS_DB)
    def get_ajax(self, request, *args, **kwargs):

        return self.render_json_response(self.r.get('pricelist_meta'))
class RackingListUploadStatusView(views.JSONResponseMixin, views.AjaxResponseMixin, View):
    r = redis.StrictRedis(host='localhost', port=settings.REDIS_PORT, db=settings.REDIS_DB)
    def get_ajax(self, request, *args, **kwargs):

        return self.render_json_response(self.r.get('rackinglist_meta'))