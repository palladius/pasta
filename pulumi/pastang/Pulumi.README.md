## PastaNG Pulumization

This contains a lot of interesting info from..

## Stuff installed

**Native**:

* 📋 BigTable InstanceId: ${outputs.native_bigtable_instance_id} .table :table.
* 📋 BigTable Clusters: ${outputs.native_bigtable_instance_clusters}


**Classic**:

* 🔋GCS classic_bucket: ${outputs.classic_bucket_link}. PantheonURL:
* 🔋GCS classic_bucket: ${outputs.classic_bucket_name}. [PantheonURL](https://console.cloud.google.com/storage/browser/${outputs.classic_bucket_name}):

### Notes

* to add new dependencies in python, do: `venv/bin/pip install -r requirements.txt` as per [URL](https://www.pulumi.com/docs/intro/languages/python/).
