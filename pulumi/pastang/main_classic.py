'''PastaNG Classic recipes.

Try not to use it unless you're ultima spiaggia.
'''
import pulumi
#import pulumi_gcp

from pulumi_gcp import storage

bucket = storage.Bucket('my-bucket')

