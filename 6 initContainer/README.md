# initContainer Example

This is a recommended method of injecting an agent into a launching container.

We use the initContainer feature of an OpenShift pod to copy the agent binaries into the container. We also ensure the agent is configurable at runtime using configMaps.

This ensures we can upgrade, and configure the agent as required without having to rebuild the application containers.


