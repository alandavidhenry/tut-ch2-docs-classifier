// Reference parameters
param location string
param tags object
param cognitiveServicesAccountName string
param appInsightsName string
param storageAccountName string
param appServicePlanName string
param functionAppName string
param textAnalyticsEndpoint string
param textAnalyticsKey string

module cognitiveServices 'modules/cognitiveServices.bicep' = {
  name: 'cognitiveServicesDeployment'
  params: {
    cognitiveServicesAccountName: cognitiveServicesAccountName
    location: location
    tags: tags
  }
}

module appInsights 'modules/appInsights.bicep' = {
  name: 'appInsightsDeployment'
  params: {
    appInsightsName: appInsightsName
    location: location
    tags: tags
  }
}

module storageAccount 'modules/storageAccount.bicep' = {
  name: 'storageAccountDeployment'
  params: {
    storageAccountName: storageAccountName
    location: location
    tags: tags
  }
}

module appServicePlan 'modules/appServicePlan.bicep' = {
  name: 'appServicePlanDeployment'
  params: {
    appServicePlanName: appServicePlanName
    location: location
    tags: tags
  }
}

module functionApp 'modules/functionApp.bicep' = {
  name: 'functionAppDeployment'
  params: {
    functionAppName: functionAppName
    location: location
    tags: tags
    appServicePlanId: appServicePlan.outputs.id
    storageAccountName: storageAccount.outputs.name
    appInsightsConnectionString: appInsights.outputs.connectionString
    textAnalyticsEndpoint: textAnalyticsEndpoint
    textAnalyticsKey: textAnalyticsKey
  }
}
