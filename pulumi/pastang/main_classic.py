'''PastaNG Classic recipes.

Try not to use it unless you're ultima spiaggia.
'''

import classic_stuff
import classic_stuff.storage_example
import classic_stuff.pasta_cloudrun
import classic_stuff.pasta_ar

import pulumi

# read file and strip of possible '\n's..
pulumi.export('pastang_ricc_version', open("VERSION", "r").read().strip())
