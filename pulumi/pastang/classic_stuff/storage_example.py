
import pulumi
#import pulumi_gcp


from pulumi_gcp import storage

BUCKET_LOCATION = 'EU' # todo move to yaml..

# Docs: https://www.pulumi.com/registry/packages/gcp/api-docs/storage/bucket/
cbucket = storage.Bucket(
    'my-classic-bucket',
    location=BUCKET_LOCATION,
)

pulumi.export('classic_bucket_link', cbucket.self_link)
pulumi.export('classic_bucket_name', cbucket.name)
