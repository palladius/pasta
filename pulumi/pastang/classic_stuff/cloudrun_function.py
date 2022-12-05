'''CloudRun Ricc Utility

same as otherfile, but this time offering a pure function so you can just import and call it :)
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

def runCloudRunNoAuth(
    shortname, # to customize Outputs :)
    cloud_run_service_name,
    region,
    image_path, #eg "us-docker.pkg.dev/cloudrun/container/hello"
):
    '''Transposing a difficult series of f(x) calls into one.
    '''
    #pass
#LOCATION = "us-central1"

#config = pulumi.Config("google-native")
#config = pulumi.Config()
#gcp_config = pulumi.Config('gcp')
#PROJECT_ID=config.require("project")
#REGION=gcp_config.require("region")

    default_service = gcp.cloudrun.Service(
        "pulumi" + cloud_run_service_name, # "pulumi-classic-hello",
        location=region, #"us-central1",
        template=gcp.cloudrun.ServiceTemplateArgs(
            spec=gcp.cloudrun.ServiceTemplateSpecArgs(
                containers=[gcp.cloudrun.ServiceTemplateSpecContainerArgs(
                    image=image_path,
                )],
            ),
        ))
    # allow everyone
    noauth_iam_policy = gcp.organizations.get_iam_policy(
        bindings=[gcp.organizations.GetIAMPolicyBindingArgs(
            role="roles/run.invoker",
            members=["allUsers"],
    )])
    noauth_iam_policy = gcp.cloudrun.IamPolicy(
        "noauthIamPolicy" + shortname,
        location=default_service.location,
        project=default_service.project,
        service=default_service.name,
        policy_data=noauth_iam_policy.policy_data)

    # makes output a function of
    combine = lambda x: ("crun_combine_" + shortname + x)
    pulumi.export(combine('service_id'), default_service.id)
    pulumi.export(combine('service_statuses'), default_service.statuses)
    pulumi.export(combine('service_url'), default_service.statuses[0].url)
    # need lambda here..
    #x = lambda a : a + 10
    #output_lambda = lambda cloudrun_service_id: infer_cconsole_url_from_service_id(cloudrun_service_id)
    lambda_id_from_service = lambda service: service.id

    #     _,region,_,project_id,_,app_id = cloudrun_service_id.split('/')
    # lambda_mega_split = lambda service: 'https://console.cloud.google.com/run/detail/{region}/{cloudrun_service_id}/revisions?project={project_id}'.format(
    #         region=service.id.split('/')[1],
    #         project_id=service.id.split('/')[3],
    #         cloudrun_service_id=service.id.split('/')[5],
    #     )
    #pulumi.export('classic_run_service_magic_cconsole_url', output_lambda(default_service.id))
    #pulumi.export('classic_run_service_magic_cconsole_url', infer_cconsole_url_from_service_id(lambda_id_from_service(default_service))
    #pulumi.export('classic_run_service_magic_cconsole_url', lambda_mega_split default_service)

    magic_url = default_service.id.apply(
        lambda x: infer_cconsole_url_from_service_id(x)
    )
    pulumi.export(combine('magic_cconsole_url'), magic_url)
