'''This is the main GCP page to pulumaform PastaNG to GCP.

Note that not everything is available in Pulumi GCP Native.
Let's try to make it work with Native.

For now just boilerplate until I really need it (which is now basically).
'''


# https://www.pulumi.com/registry/packages/google-native/
import pulumi
from pulumi_google_native.storage import v1 as storage

import native_examples
import native_examples.bt_step1
#import native_examples.bt_step2
#import native_examples.bt_step3
import native_examples.kubeconfig

config = pulumi.Config()
project = config.require('project')

# code: https://www.pulumi.com/blog/pulumiup-google-native-provider/
#region = "us-central1"
# cluster_name = "gke-native"

# cluster = container.Cluster(
#             "cluster",
#             projects_id=project,
#             locations_id=region,
#             clusters_id=cluster_name,
#             name=cluster_name,
#             autopilot=container.AutopilotArgs(enabled=True))

# pulumi.export('native_gke_cluster_link', cluster.self_link)

# # Create a Google Cloud resource (Storage Bucket)
# bucket_name = "pulumi-goog-native-bucket-py-01"
# bucket = storage.Bucket(
#     'my-native-bucket',
#     name=bucket_name,
#     bucket=bucket_name,
#     project=project)

# # Export the bucket self-link
# pulumi.export('native_bucket', bucket.self_link)
