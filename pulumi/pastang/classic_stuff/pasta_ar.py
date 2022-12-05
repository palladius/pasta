'''This will try to import EXISTING AR skaffolded iimage into a pulumi object.

https://console.cloud.google.com/artifacts/docker/cicd-platinum-test032/europe-west3/pasta-and-friends32/skaf-pasta-ror7?e=-13802955&project=cicd-platinum-test032
=> pulumi object
'''
# find skaf-pasta-ror7

import pulumi
import pulumi_gcp as gcp

from classic_stuff.cloudrun_function import runCloudRunNoAuth

##################################
# 1. Lets get the right repo :)
##################################

existing_repo_name  = 'pasta-and-friends32'
existing_repo_region = 'europe-west3'
#project_id = pulumi.Config().get('gcp:project')
gcp_config = pulumi.Config('gcp')
#PROJECT_ID=config.require("project")
PROJECT_ID=gcp_config.require("project")

# my_repo = gcp.artifactregistry.Repository("pulumi-useless-repo",
#     description="example docker repository I will never use",
#     format="DOCKER",
#     location="us-central1",
#     repository_id="pulumi-useless-repository")


my_pasta_existing_repo = gcp.artifactregistry.get_repository(
    location=existing_repo_region,
    repository_id=existing_repo_name,
)

#pulumi.export('pasta_ar_useless_repo', my_repo.repository_id)
pulumi.export('pasta_ar_existing_repo', my_pasta_existing_repo.repository_id)

##################################
# 2. now lets get the image :)
##################################

existing_image_name = 'skaf-pasta-ror7'

# https://www.pulumi.com/registry/packages/gcp/api-docs/container/getregistryimage/
# YIELDS:         europe-west3.gcr.io/cicd-platinum-test032/skaf-pasta-ror7
# should be:      europe-west3-docker.pkg.dev/cicd-platinum-test032/pasta-and-friends32/skaf-pasta-ror7
# works for container registry but not good for me :/

# debian = gcp.container.get_registry_image(
#         name=existing_image_name,
#         region=existing_repo_region,

# )
# pulumi.export("gcrLocation", debian.image_url)

ultimate_pasta_image = "{existing_repo_region}-docker.pkg.dev/{project_id}/{existing_repo_name}/{existing_image_name}".format(
    existing_repo_name=existing_repo_name,
    existing_repo_region=existing_repo_region,
    existing_image_name=existing_image_name,
    project_id=PROJECT_ID,
)

pulumi.export('ultimate_pasta_image', ultimate_pasta_image)


#########
# 3. call pasta CloudRun

gcp_config = pulumi.Config('gcp')
PROJECT_ID=gcp_config.require("project")
REGION=gcp_config.require("region")


# THEORY:           europe-west3-docker.pkg.dev/cicd-platinum-test032/pasta-and-friends32/skaf-pasta-ror7
# PRACTICE:  Image 'europe-west3-docker.pkg.dev/cicd-platinum-test032/pasta-and-friends32/skaf-pasta-ror7' not found.
# => error, I was missing the LATEST :/

# Memory limit of 512M exceeded with 515M used. Consider increasing the memory limit, see https://cloud.google.com/run/docs/configuring/memory-limits
# https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#requests-and-limits
# => spec.containers[].resources.requests.memory


runCloudRunNoAuth(
    'pasta03',
    'classic-pasta03',
    REGION,
    ultimate_pasta_image,
)
runCloudRunNoAuth(
    'hello01',
    'classic-hello01',
    REGION,
    "us-docker.pkg.dev/cloudrun/container/hello"
)
