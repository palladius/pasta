# PastaNG Pulumization

This contains a lot of interesting info from..

## Native Stuff installed

📋 BigTable:

* BigTable InstanceId: ${outputs.native_bigtable_instance_id} .table :table.
* 📋 BigTable Clusters: ${outputs.native_bigtable_instance_clusters}

🌃 GKE:

* GKE cluster link: ${outputs.native_gke_cluster_link}

## Classic Stuff installed

🔋 GCS:

* classic_bucket: **${outputs.classic_bucket_name}**. [PantheonURL](https://console.cloud.google.com/storage/browser/${outputs.classic_bucket_name}):
* classic_bucket: ${outputs.classic_bucket_link} (useless)

🏃 Cloud Run:

* classic_run_service_id: ${outputs.classic_run_service_id}
* classic_run_service_statuses: ${outputs.classic_run_service_statuses}
* **Final URL**: **${outputs.classic_run_service_url}**
* **Magic** Revisions Cloud Run page (**λ**): ${outputs.classic_run_service_magic_pantheon_url}

## Notes

* to add new dependencies in python, do: `venv/bin/pip install -r requirements.txt` as per [URL](https://www.pulumi.com/docs/intro/languages/python/).
