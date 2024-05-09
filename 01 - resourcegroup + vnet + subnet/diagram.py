# diagram.py
from diagrams import Cluster, Diagram
from diagrams.azure.general import Resourcegroups
from diagrams.azure.network import VirtualNetworks
from diagrams.azure.network import Subnets

with Diagram("Diagram","diagram"):
    with Cluster("ResourceGroups"):
        Resourcegroups("alpha-resource-groups")
        with Cluster("Virtual Networks"):
            VirtualNetworks("alpha-vnet (10.0.0.0/16)")
            with Cluster("Subnets"):
                Subnets("alpha-subnet (10.0.0.0/24)")
