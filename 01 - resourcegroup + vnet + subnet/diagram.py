# diagram.py
from diagrams import Cluster, Diagram
from diagrams.azure.general import Resourcegroups
from diagrams.azure.network import VirtualNetworks
from diagrams.azure.network import Subnets

with Diagram("Diagram","diagram"):
    with Cluster("alpha-resource-groups"):
        Resourcegroups("")
        with Cluster("alpha-vnet (10.0.0.0/16)"):
            VirtualNetworks("")
            with Cluster("alpha-subnet (10.0.0.0/24)"):
                Subnets("")
