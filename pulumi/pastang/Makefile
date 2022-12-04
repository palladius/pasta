
init:
	pulumi new
	gcloud auth application-default login
	direnv allow .
#pip3 install pulumi-google-native
	pulumi new pasta --force


up:
	pulumi stack select dev
	pulumi up
