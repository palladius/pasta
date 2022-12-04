'''PastaNG Classic recipes.

Try not to use it unless you're ultima spiaggia.
'''
import pulumi
#import pulumi_gcp

from pulumi_gcp import storage

# Docs: https://www.pulumi.com/registry/packages/gcp/api-docs/storage/bucket/
cbucket = storage.Bucket(
    'my-classic-bucket',
    location="EU",
)

pulumi.export('classic_bucket_link', cbucket.self_link)
pulumi.export('classic_bucket_name', cbucket.name)
