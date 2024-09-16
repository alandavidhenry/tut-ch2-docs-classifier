// Create a subscription-level deployment
targetScope = 'subscription'

// Import parameters
@description('Path to the parameters file')
#disable-next-line no-unused-params
param parameterFile string = 'parameters.bicep'

// Reference parameters
param resourceGroupName string
param location string
param tags object
param cognitiveServicesAccountName string
param appInsightsName string
param textAnalyticsKey string

param storageAccountPrefix string
param appServicePlanPrefix string
param functionAppPrefix string
param deploymentId string = utcNow()

var uniqueSuffix = uniqueString(subscription().id, deploymentId)
var storageAccountName = '${storageAccountPrefix}${uniqueSuffix}'
var appServicePlanName = '${appServicePlanPrefix}${uniqueSuffix}'
var functionAppName = '${functionAppPrefix}-${uniqueSuffix}'
var textAnalyticsEndpoint = 'https://${cognitiveServicesAccountName}.cognitiveservices.azure.com/'

// Create resource group
resource rg 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: resourceGroupName
  location: location
  tags: tags
}

// Import resources and pass through parameters
module resources 'resources.bicep' = {
  name: 'resourcesDeployment'
  scope: rg
  params: {
    location: location
    tags: tags
    cognitiveServicesAccountName: cognitiveServicesAccountName
    appInsightsName: appInsightsName
    storageAccountName: storageAccountName
    appServicePlanName: appServicePlanName
    functionAppName: functionAppName
    textAnalyticsEndpoint: textAnalyticsEndpoint
    textAnalyticsKey: textAnalyticsKey
  }
}
