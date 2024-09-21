<div align="center">
  <h1 align="center">Language-Based Document Classifier</h1>
</div>

<!-- ABOUT THE PROJECT -->

## About The Project

<!-- [![Product Name Screen Shot][product-screenshot]](https://example.com) -->

Function App code and IaC from Ch.2 of the book: Building Intelligent Apps with .NET and Azure AI Services.

The project creates a document classifier that takes documents saved in a blob storage container and sorts them into directories in another container according to the language the document is written in.

This project demonstrates the deployment of an Azure Function App using .NET, with the infrastructure defined using both Azure Bicep and Terraform. It serves as a reference for implementing Infrastructure as Code (IaC) in Azure environments and showcases serverless application development with Azure Functions.

### Built With

- [.NET](https://dotnet.microsoft.com/en-us/)
- [Azure](https://azure.microsoft.com/en-gb)
- [Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Terraform](https://www.terraform.io/)

#### Definitions

_.NET_: The development framework used for writing the Function App code.

_Microsoft Azure_: A cloud computing provider.

_Azure Function App_: A serverless compute service that allows you to run event-triggered code without managing infrastructure.

_Bicep_: A domain-specific language (DSL) for deploying Azure resources declaratively.

_Terraform_: An open-source IaC tool that supports multiple cloud providers, including Azure.

#### Project Structure

```
+---infrastructure
|   +---ARM
|   |       parameters.json
|   |       template.json
|   |
|   +---Bicep
|   |   |   main.bicep
|   |   |   main.bicepparam
|   |   |   resources.bicep
|   |   |
|   |   \---modules
|   |           appInsights.bicep
|   |           appServicePlan.bicep
|   |           cognitiveServices.bicep
|   |           functionApp.bicep
|   |           storageAccount.bicep
|   |
|   \---Terraform
\---src
    \---Chapter2DocumentClassifier
            .gitignore
            Chapter2DocumentClassifier.csproj
            Chapter2DocumentClassifier.csproj.user
            Chapter2DocumentClassifier.sln
            DocumentClassifier.cs
            host.json
            local.settings.json
            Program.cs

```

- The `ARM` directory contains the ARM files exported from Azure.
- The `Bicep` directory contains the Bicep IaC files.
  - Each resource is defined in a module.
  - The modules are referenced in the `resources.bicep` file.
  - The `resources.bicep` file is referenced in the `main.bicep` file.
  - The `main.bicepparam` file contains parameters.
- The `Terraform` directory contains the Terraform IaC files.
- The `src` directory contains Azure Function files. These can be deployed to Azure using the [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) or the [Azure Extensions for VSCode](https://code.visualstudio.com/docs/azure/extensions). If you are using Visual Studio, then the Function can be deployed directly from there.

<!-- GETTING STARTED -->

## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

- Visual Studio or VSCode with the [Azure Extensions for VSCode](https://code.visualstudio.com/docs/azure/extensions)
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- An Azure account and subscription

### Installation

Clone the repo

```sh
git clone https://github.com/alandavidhenry/tut-ch2-docs-classifier.git
```

### Deployment

There a several ways to deploy the Bicep IaC:

- Using the Bicep extension with VSCode. [Follow this guide](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/deploy-vscode).
- Using the Azure CLI. [Follow this guide](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/deploy-vscode).
- Using the PowerShell. [Follow this guide](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/deploy-powershell).

<!-- USAGE EXAMPLES -->

## Usage

1. To test the app, I used a LLM AI such as [ChatGPT](https://chatgpt.com) or [Claude](https://claude.ai) to create 10 documents using the following prompt:

   > I need you to create 10 text files, each around 200 words long, content can be anything. Name them SampleX.txt, where X is the number 1 to 10 I need:
   >
   > - three in the one language
   > - two in a second language
   > - the remaining five in other different languages
   >
   > Mix up the numbers, for example, 1 and 6 could be the two in a second language

2. Upload the files to the `source` container
3. The Function will be triggered as it detects a change in the blob storage and the files will be copied and sorted into the `destination` container into folders named with the language of the files.

<!-- ROADMAP -->

## Roadmap

- [x] Add BICEP IaC
- [ ] Add Terraform IaC
- [ ] Look into using [Pulumi](https://www.pulumi.com) IaC
- [ ] Look into using [SST](https://sst.dev) IaC

<!-- LICENSE -->

## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<!-- CONTACT -->

## Contact

Alan Henry - [LinkedIn](https://www.linkedin.com/in/alandavidhenry)

Project Link: [github.com/alandavidhenry/tut-ch2-docs-classifier](https://github.com/alandavidhenry/tut-ch2-docs-classifier)

<!-- ACKNOWLEDGMENTS -->

## Acknowledgments

- [Best-README-Template](https://github.com/othneildrew/Best-README-Template)
- [Building Intelligent Apps with .NET and Azure AI Services](https://link.springer.com/book/10.1007/979-8-8688-0435-9)

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[product-screenshot]: images/screenshot.png
