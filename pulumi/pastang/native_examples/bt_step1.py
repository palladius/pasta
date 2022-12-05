
############ STEP 1 bigtable
# https://github.com/pulumi/pulumi-google-native/blob/master/examples/bigtable-py/step1/__main__.py

import pulumi
from pulumi_google_native.bigtableadmin import v2 as bigtable

config = pulumi.Config("google-native")
PROJECT_ID=config.require("project")
LOCATION=config.require("location")

# doc here: https://www.pulumi.com/registry/packages/google-native/api-docs/bigtableadmin/v2/instance/
instance = bigtable.Instance(
    "my-pulumi-instance",
    args=bigtable.InstanceArgs(
        clusters={"mycluster": {
            "serve_nodes": 2,
            "default_storage_type": "SSD",
            "location": f"projects/{PROJECT_ID}/locations/{LOCATION}",
        }},
        display_name="my-pulumi-instance",
        instance_id="my-pulumi-instance",
        labels={"resource": "my-pulumi-instance", "label1": "ricc-pulumi"},
        parent=f"projects/{PROJECT_ID}",
        type=bigtable.InstanceType.PRODUCTION
    ),
)

pulumi.export('native_bigtable_instance_id', instance.instance_id)
pulumi.export('native_bigtable_instance_clusters', instance.clusters)

link = 'https://console.cloud.google.com/bigtable/instances?project={}'.format(PROJECT_ID)
pulumi.export('native_bigtable_instances_cconsole_url', link)

