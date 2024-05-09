# diagram.py
from diagrams import Cluster, Diagram
from diagrams.azure.general import Resourcegroups
from diagrams.azure.network import VirtualNetworks
from diagrams.azure.network import Subnets
from diagrams.azure.network import PublicIpAddresses
from diagrams.azure.general import Resource


with Diagram("Diagram","diagram"):
    with Cluster("alpha-resource-groups"):
        PublicIpAddresses("alpha-vnet-ip")
        with Cluster("alpha-vnet"):
            VirtualNetworks("10.0.0.0/16")
            with Cluster("alpha-subnet"):
                Subnets("10.0.0.0/24")
            with Cluster("AzureBastionSubnet"):
                Subnets("10.0.250.0/26")
                Resource("alpha-vnet-bastion")
