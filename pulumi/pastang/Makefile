
init:
	pulumi new
	gcloud auth application-default login
	direnv allow .
#pip3 install pulumi-google-native
	pulumi new pasta --force

install-update-python:
	python3 -m venv venv
	venv/bin/pip install -r requirements.txt

plan:
	pulumi stack select dev
	pulumi up
up:
	pulumi stack select dev
	pulumi up --yes
