'''PastaNG on Cloud Run


copied from here: https://www.pulumi.com/registry/packages/gcp/api-docs/cloudrun/service/
note CRun doesnt work on external repos so i need to push image to AR..

docs: https://www.pulumi.com/registry/packages/gcp/api-docs/cloudrun/service/#outputs

'''
import pulumi
import pulumi_gcp as gcp

def infer_cconsole_url_from_service_id(cloudrun_service_id):
    '''Very simple.

    Given this input: locations/europe-west1/namespaces/cicd-platinum-test032/services/pulumi-classic-hello-2c27e4a
    Produce this output:  https://console.cloud.google.com/run/detail/europe-west1/pulumi-classic-hello-2c27e4a/revisions?project=cicd-platinum-test032
    and since its too simple, do it with a lambda :)

    This might work:
    s="locations/europe-west1/namespaces/cicd-platinum-test032/services/pulumi-classic-hello-2c27e4a"
    >>> s.split('/')
    ['locations', 'europe-west1', 'namespaces', 'cicd-platinum-test032', 'services', 'pulumi-classic-hello-2c27e4a']
    >>> a,b,c,d,e,f = s.split('/')
    >>> a
    'locations'
    >>> b
    'europe-west1'
    >>> c
    'namespaces'
    >>> d
    'cicd-platinum-test032'
    >>> e
    'services'
    >>> f
    'pulumi-classic-hello-2c27e4a'
    '''
    _,region,_,project_id,_,app_id = cloudrun_service_id.split('/')
    return 'https://console.cloud.google.com/run/detail/{region}/{cloudrun_service_id}/revisions?project={project_id}'.format(
        region=region,
        project_id=project_id,
        cloudrun_service_id=app_id,
    )


#config = pulumi.Config("google-native")
config = pulumi.Config()
gcp_config = pulumi.Config('gcp')
#PROJECT_ID=config.require("project")
REGION=gcp_config.require("region")

default_service = gcp.cloudrun.Service(
    "pulumi-classic-hello",
    location=REGION, #"us-central1",
    template=gcp.cloudrun.ServiceTemplateArgs(
        spec=gcp.cloudrun.ServiceTemplateSpecArgs(
            containers=[gcp.cloudrun.ServiceTemplateSpecContainerArgs(
                image="us-docker.pkg.dev/cloudrun/container/hello",
            )],
        ),
    ))
# allow everyone
noauth_iam_policy = gcp.organizations.get_iam_policy(bindings=[gcp.organizations.GetIAMPolicyBindingArgs(
        role="roles/run.invoker",
        members=["allUsers"],
)])
noauth_iam_policy = gcp.cloudrun.IamPolicy("noauthIamPolicy",
    location=default_service.location,
    project=default_service.project,
    service=default_service.name,
    policy_data=noauth_iam_policy.policy_data)

pulumi.export('classic_run_service_id', default_service.id)
pulumi.export('classic_run_service_statuses', default_service.statuses)
pulumi.export('classic_run_service_url', default_service.statuses[0].url)

magic_url = default_service.id.apply(
    lambda x: infer_cconsole_url_from_service_id(x)
)
pulumi.export('classic_run_service_magic_cconsole_url', magic_url)
