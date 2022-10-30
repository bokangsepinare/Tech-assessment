from django.shortcuts import render
from django.http import HttpResponse
import subprocess
from django.template import loader
# Create your views here.
def index(request):
    shell = subprocess.run(['./script.sh'],
				 stdout = subprocess.PIPE)
    output_str = shell.stdout.decode()
	#output into list
    ls = output_str.split("\n")
    #removing the escape character from the list
    ls.pop(-1)
    template = loader.get_template('app/index.html')
    context =  {'status' : ls}
    return HttpResponse(template.render(context, request))

