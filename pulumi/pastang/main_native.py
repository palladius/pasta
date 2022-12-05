'''This is the main GCP page to pulumaform PastaNG to GCP.

Note that not everything is available in Pulumi GCP Native.
Let's try to make it work with Native.

For now just boilerplate until I really need it (which is now basically).
'''


# https://www.pulumi.com/registry/packages/google-native/
import pulumi
from pulumi_google_native.storage import v1 as storage

import native_examples
#import native_examples.bt_step1
#import native_examples.bt_step2
#import native_examples.bt_step3
import native_examples.kubeconfig

config = pulumi.Config()
project = config.require('project')

# code: https://www.pulumi.com/blog/pulumiup-google-native-provider/
