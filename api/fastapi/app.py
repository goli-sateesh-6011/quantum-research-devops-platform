from fastapi import FastAPI
from kubernetes import client, config

app = FastAPI()

config.load_incluster_config()

batch_v1 = client.BatchV1Api()

@app.post("/run-experiment")
def run_experiment():

    job = client.V1Job(
        metadata=client.V1ObjectMeta(name="quantum-simulation"),
        spec=client.V1JobSpec(
            template=client.V1PodTemplateSpec(
                spec=client.V1PodSpec(
                    containers=[client.V1Container(
                        name="simulator",
                        image="yourdockerhub/quantum-simulator"
                    )],
                    restart_policy="Never"
                )
            )
        )
    )

    batch_v1.create_namespaced_job(namespace="default", body=job)

    return {"status": "experiment started"}