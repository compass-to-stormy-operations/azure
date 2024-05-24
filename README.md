# Azure

Esse repositório contém exemplos de utilização da Azure, a partir de scripts usando [Azure CLI](https://learn.microsoft.com/pt-br/cli/azure/).

[Desenvolver sua estratégia de nomenclatura e marcação para recursos do Azure](https://learn.microsoft.com/pt-br/azure/cloud-adoption-framework/ready/azure-best-practices/naming-and-tagging)

## Orientações Gerais

Para usar o passo a passo desse tutorial sugerimos o uso do [Azure Cloud Shell](https://learn.microsoft.com/pt-br/azure/cloud-shell/overview) e executar os passos abaixo:

### Baixar o repositório para seu ambiente

```
git clone https://github.com/the-compass-to-stormy-operations/azure.git
```

ou atualizar

```
cd azure
git pull
```

### Executar o Script

```
cd azure
.\CreateResourceGroup.ps1
```

## Estrutura de Governaça e Rede

### Resource Group

[Visão Geral do Resource Group](https://learn.microsoft.com/pt-br/azure/azure-resource-manager/management/manage-resource-groups-portal) 

Para criar Resource Group execute [CreateResourceGroup.ps1](./CreateResourceGroup.ps1) 

```
cd azure
./CreateResourceGroup.ps1
```

### VNet e SubNet

[Visão Geral da VNet](https://learn.microsoft.com/pt-br/azure/virtual-network/virtual-networks-overview)

Para criar uma VNet e SubNet execute [CreateVnetAndSubnet.ps1](./CreateVnetAndSubnet.ps1) 

```
cd azure
./CreateVnetAndSubnet.ps1
```

### Bastion

[Visão Geral do Bastion](https://learn.microsoft.com/pt-br/azure/bastion/bastion-overview)

Para criar um Bastion execute [CreateBastion.ps1](./CreateBastion.ps1)

```
cd azure
./CreateBastion.ps1
```

## Serviços Gerenciados

### Armazenamento

#### Criar Conta de Armazenamento

[Visão Geral da Storage Account](https://learn.microsoft.com/pt-br/azure/storage/common/storage-account-overview)

Para criar uma Conta de Armazenamento execute [CreateStorageAccount.ps1](./CreateStorageAccount.ps1)

```
cd azure
./CreateStorageAccount.ps1
```

#### 
