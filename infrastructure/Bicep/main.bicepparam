using 'main.bicep'

param resourceGroupName = 'tut-ch2-doc-classifier-rg'
param location = 'uksouth'
param tags = {
  tutorial: 'chapter2'
  deployedViaIaC: 'yes'
  version: '1'
}
param cognitiveServicesAccountName = 'tut-ch2-doc-classifier-lang'
param appInsightsName = 'Chapter2DocumentClassifier'
param storageAccountPrefix = 'tutch2'
param appServicePlanPrefix = 'Chapter2DocumentClassifier'
param functionAppPrefix = 'DocumentClassifier'
param textAnalyticsKey = '7d32113935b5404bafe6cb7426dc10a4'
