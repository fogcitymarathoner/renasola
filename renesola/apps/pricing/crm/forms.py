__author__ = 'marc'

from django import forms

class SimpleFileForm(forms.Form):
    file = forms.Field(widget=forms.FileInput, required=False)
