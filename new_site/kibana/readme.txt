Запуск:
vasi@v$ /usr/share/kibana/bin/../node/bin/node /usr/share/kibana/bin/../src/cli/dist
(Kibana сделана на nodejs, поэтому /node/bin/node)
-----------------------------------------------------------------------
[2024-11-24T12:52:19.785+05:00][INFO ][plugins-service] Plugin "metricsEntities" is disabled.
[2024-11-24T12:52:19.939+05:00][INFO ][http.server.Preboot] http server running at http://0.0.0.0:5601
[2024-11-24T12:52:20.269+05:00][INFO ][plugins-system.preboot] Setting up [1] plugins: [interactiveSetup]
[2024-11-24T12:52:20.331+05:00][WARN ][config.deprecation] The default mechanism for Reporting privileges will work differently in future versions, which will affect the behavior of this cluster. Set "xpack.reporting.roles.enabled" to "false" to adopt the future behavior before upgrading.
[2024-11-24T12:52:20.702+05:00][INFO ][plugins-system.standard] Setting up [112] plugins: [translations,licensing,globalSearch,globalSearchProviders,features,mapsEms,licenseApiGuard,usageCollection,taskManager,telemetryCollectionManager,telemetryCollectionXpack,kibanaUsageCollection,sharedUX,share,embeddable,uiActionsEnhanced,screenshotMode,screenshotting,banners,telemetry,newsfeed,fieldFormats,expressions,dataViews,charts,esUiShared,bfetch,data,savedObjects,presentationUtil,expressionShape,expressionRevealImage,expressionRepeatImage,expressionMetric,expressionImage,customIntegrations,home,searchprofiler,painlessLab,grokdebugger,management,watcher,licenseManagement,advancedSettings,spaces,security,savedObjectsTagging,reporting,lists,fileUpload,ingestPipelines,encryptedSavedObjects,dataEnhanced,cloud,snapshotRestore,eventLog,actions,alerting,triggersActionsUi,transform,stackAlerts,ruleRegistry,savedObjectsManagement,console,controls,graph,fleet,indexManagement,remoteClusters,crossClusterReplication,indexLifecycleManagement,visualizations,canvas,visTypeXy,visTypeVislib,visTypeVega,visTypeTimeseries,rollup,visTypeTimelion,visTypeTagcloud,visTypeTable,visTypeMetric,visTypeHeatmap,visTypeMarkdown,dashboard,maps,dashboardEnhanced,expressionTagcloud,expressionPie,visTypePie,expressionMetricVis,expressionHeatmap,expressionGauge,dataViewFieldEditor,lens,cases,timelines,discover,osquery,observability,discoverEnhanced,dataVisualizer,ml,uptime,securitySolution,infra,upgradeAssistant,monitoring,logstash,enterpriseSearch,apm,dataViewManagement]
[2024-11-24T12:52:20.726+05:00][INFO ][plugins.taskManager] TaskManager is identified by the Kibana UUID: d4555a4e-2dce-4eb0-a314-22432dca8d0e
[2024-11-24T12:52:20.882+05:00][WARN ][plugins.security.config] Generating a random key for xpack.security.encryptionKey. To prevent sessions from being invalidated on restart, please set xpack.security.encryptionKey in the kibana.yml or use the bin/kibana-encryption-keys command.
[2024-11-24T12:52:20.882+05:00][WARN ][plugins.security.config] Session cookies will be transmitted over insecure connections. This is not recommended.
[2024-11-24T12:52:20.910+05:00][WARN ][plugins.security.config] Generating a random key for xpack.security.encryptionKey. To prevent sessions from being invalidated on restart, please set xpack.security.encryptionKey in the kibana.yml or use the bin/kibana-encryption-keys command.
[2024-11-24T12:52:20.910+05:00][WARN ][plugins.security.config] Session cookies will be transmitted over insecure connections. This is not recommended.
[2024-11-24T12:52:20.927+05:00][WARN ][plugins.reporting.config] Generating a random key for xpack.reporting.encryptionKey. To prevent sessions from being invalidated on restart, please set xpack.reporting.encryptionKey in the kibana.yml or use the bin/kibana-encryption-keys command.
[2024-11-24T12:52:20.929+05:00][WARN ][plugins.reporting.config] Found 'server.host: "0.0.0.0"' in Kibana configuration. Reporting is not able to use this as the Kibana server hostname. To enable PNG/PDF Reporting to work, 'xpack.reporting.kibanaServer.hostname: localhost' is automatically set in the configuration. You can prevent this message by adding 'xpack.reporting.kibanaServer.hostname: localhost' in kibana.yml.
[2024-11-24T12:52:20.939+05:00][WARN ][plugins.encryptedSavedObjects] Saved objects encryption key is not set. This will severely limit Kibana functionality. Please set xpack.encryptedSavedObjects.encryptionKey in the kibana.yml or use the bin/kibana-encryption-keys command.
[2024-11-24T12:52:20.954+05:00][WARN ][plugins.actions] APIs are disabled because the Encrypted Saved Objects plugin is missing encryption key. Please set xpack.encryptedSavedObjects.encryptionKey in the kibana.yml or use the bin/kibana-encryption-keys command.
[2024-11-24T12:52:20.968+05:00][WARN ][plugins.alerting] APIs are disabled because the Encrypted Saved Objects plugin is missing encryption key. Please set xpack.encryptedSavedObjects.encryptionKey in the kibana.yml or use the bin/kibana-encryption-keys command.
[2024-11-24T12:52:20.989+05:00][INFO ][plugins.ruleRegistry] Installing common resources shared between all indices
[2024-11-24T12:52:22.010+05:00][INFO ][plugins.screenshotting.config] Chromium sandbox provides an additional layer of protection, and is supported for Linux Linux Mint 22 OS. Automatically enabling Chromium sandbox.
[2024-11-24T12:52:22.503+05:00][INFO ][savedobjects-service] Waiting until all Elasticsearch nodes are compatible with Kibana before starting saved objects migrations...
[2024-11-24T12:52:22.504+05:00][INFO ][savedobjects-service] Starting saved objects migrations
[2024-11-24T12:52:22.752+05:00][INFO ][savedobjects-service] [.kibana] INIT -> OUTDATED_DOCUMENTS_SEARCH_OPEN_PIT. took: 215ms.
[2024-11-24T12:52:23.463+05:00][INFO ][savedobjects-service] [.kibana] OUTDATED_DOCUMENTS_SEARCH_OPEN_PIT -> OUTDATED_DOCUMENTS_SEARCH_READ. took: 712ms.
[2024-11-24T12:52:23.468+05:00][INFO ][savedobjects-service] [.kibana_task_manager] INIT -> OUTDATED_DOCUMENTS_SEARCH_OPEN_PIT. took: 929ms.
[2024-11-24T12:52:24.109+05:00][INFO ][savedobjects-service] [.kibana] OUTDATED_DOCUMENTS_SEARCH_READ -> OUTDATED_DOCUMENTS_SEARCH_CLOSE_PIT. took: 646ms.
[2024-11-24T12:52:24.112+05:00][INFO ][savedobjects-service] [.kibana_task_manager] OUTDATED_DOCUMENTS_SEARCH_OPEN_PIT -> OUTDATED_DOCUMENTS_SEARCH_READ. took: 644ms.
[2024-11-24T12:52:24.628+05:00][INFO ][savedobjects-service] [.kibana] OUTDATED_DOCUMENTS_SEARCH_CLOSE_PIT -> UPDATE_TARGET_MAPPINGS. took: 519ms.
[2024-11-24T12:52:24.631+05:00][INFO ][savedobjects-service] [.kibana_task_manager] OUTDATED_DOCUMENTS_SEARCH_READ -> OUTDATED_DOCUMENTS_SEARCH_CLOSE_PIT. took: 519ms.
[2024-11-24T12:52:25.250+05:00][INFO ][savedobjects-service] [.kibana_task_manager] OUTDATED_DOCUMENTS_SEARCH_CLOSE_PIT -> UPDATE_TARGET_MAPPINGS. took: 619ms.
[2024-11-24T12:52:26.324+05:00][INFO ][savedobjects-service] [.kibana] UPDATE_TARGET_MAPPINGS -> UPDATE_TARGET_MAPPINGS_WAIT_FOR_TASK. took: 1696ms.
[2024-11-24T12:52:26.395+05:00][INFO ][savedobjects-service] [.kibana] UPDATE_TARGET_MAPPINGS_WAIT_FOR_TASK -> DONE. took: 71ms.
[2024-11-24T12:52:26.395+05:00][INFO ][savedobjects-service] [.kibana] Migration completed after 3859ms
[2024-11-24T12:52:26.396+05:00][INFO ][savedobjects-service] [.kibana_task_manager] UPDATE_TARGET_MAPPINGS -> UPDATE_TARGET_MAPPINGS_WAIT_FOR_TASK. took: 1146ms.
[2024-11-24T12:52:26.920+05:00][INFO ][savedobjects-service] [.kibana_task_manager] UPDATE_TARGET_MAPPINGS_WAIT_FOR_TASK -> DONE. took: 524ms.
[2024-11-24T12:52:26.921+05:00][INFO ][savedobjects-service] [.kibana_task_manager] Migration completed after 4382ms
[2024-11-24T12:52:27.547+05:00][INFO ][plugins-system.preboot] Stopping all plugins.
[2024-11-24T12:52:27.548+05:00][INFO ][plugins-system.standard] Starting [112] plugins: [translations,licensing,globalSearch,globalSearchProviders,features,mapsEms,licenseApiGuard,usageCollection,taskManager,telemetryCollectionManager,telemetryCollectionXpack,kibanaUsageCollection,sharedUX,share,embeddable,uiActionsEnhanced,screenshotMode,screenshotting,banners,telemetry,newsfeed,fieldFormats,expressions,dataViews,charts,esUiShared,bfetch,data,savedObjects,presentationUtil,expressionShape,expressionRevealImage,expressionRepeatImage,expressionMetric,expressionImage,customIntegrations,home,searchprofiler,painlessLab,grokdebugger,management,watcher,licenseManagement,advancedSettings,spaces,security,savedObjectsTagging,reporting,lists,fileUpload,ingestPipelines,encryptedSavedObjects,dataEnhanced,cloud,snapshotRestore,eventLog,actions,alerting,triggersActionsUi,transform,stackAlerts,ruleRegistry,savedObjectsManagement,console,controls,graph,fleet,indexManagement,remoteClusters,crossClusterReplication,indexLifecycleManagement,visualizations,canvas,visTypeXy,visTypeVislib,visTypeVega,visTypeTimeseries,rollup,visTypeTimelion,visTypeTagcloud,visTypeTable,visTypeMetric,visTypeHeatmap,visTypeMarkdown,dashboard,maps,dashboardEnhanced,expressionTagcloud,expressionPie,visTypePie,expressionMetricVis,expressionHeatmap,expressionGauge,dataViewFieldEditor,lens,cases,timelines,discover,osquery,observability,discoverEnhanced,dataVisualizer,ml,uptime,securitySolution,infra,upgradeAssistant,monitoring,logstash,enterpriseSearch,apm,dataViewManagement]
[2024-11-24T12:52:35.252+05:00][INFO ][plugins.fleet] Beginning fleet setup
[2024-11-24T12:52:35.279+05:00][INFO ][plugins.monitoring.monitoring] config sourced from: production cluster
[2024-11-24T12:52:37.374+05:00][INFO ][http.server.Kibana] http server running at http://0.0.0.0:5601
[2024-11-24T12:52:38.028+05:00][INFO ][plugins.monitoring.monitoring.kibana-monitoring] Starting monitoring stats collection
[2024-11-24T12:52:38.042+05:00][INFO ][plugins.ruleRegistry] Installed common resources shared between all indices
[2024-11-24T12:52:38.042+05:00][INFO ][plugins.ruleRegistry] Installing resources for index .alerts-observability.uptime.alerts
[2024-11-24T12:52:38.043+05:00][INFO ][plugins.ruleRegistry] Installing resources for index .alerts-security.alerts
[2024-11-24T12:52:38.043+05:00][INFO ][plugins.ruleRegistry] Installing resources for index .preview.alerts-security.alerts
[2024-11-24T12:52:38.043+05:00][INFO ][plugins.ruleRegistry] Installing resources for index .alerts-observability.logs.alerts
[2024-11-24T12:52:38.044+05:00][INFO ][plugins.ruleRegistry] Installing resources for index .alerts-observability.metrics.alerts
[2024-11-24T12:52:38.044+05:00][INFO ][plugins.ruleRegistry] Installing resources for index .alerts-observability.apm.alerts
[2024-11-24T12:52:38.307+05:00][INFO ][plugins.ruleRegistry] Installed resources for index .alerts-observability.apm.alerts
[2024-11-24T12:52:38.309+05:00][INFO ][plugins.ruleRegistry] Installed resources for index .alerts-observability.metrics.alerts
[2024-11-24T12:52:38.310+05:00][INFO ][plugins.ruleRegistry] Installed resources for index .alerts-observability.logs.alerts
[2024-11-24T12:52:38.312+05:00][INFO ][plugins.ruleRegistry] Installed resources for index .alerts-security.alerts
[2024-11-24T12:52:38.313+05:00][INFO ][plugins.ruleRegistry] Installed resources for index .alerts-observability.uptime.alerts
[2024-11-24T12:52:38.462+05:00][INFO ][plugins.ruleRegistry] Installed resources for index .preview.alerts-security.alerts
[2024-11-24T12:52:38.671+05:00][INFO ][plugins.fleet] Fleet setup completed
[2024-11-24T12:52:38.675+05:00][INFO ][plugins.securitySolution] Dependent plugin setup complete - Starting ManifestTask
[2024-11-24T12:52:39.286+05:00][INFO ][status] Kibana is now degraded
[2024-11-24T12:52:41.745+05:00][INFO ][plugins.securitySolution.endpoint:metadata-check-transforms-task:0.0.1] no endpoint installation found
[2024-11-24T12:52:48.315+05:00][INFO ][status] Kibana is now available (was degraded)
[2024-11-24T12:53:16.382+05:00][INFO ][plugins.screenshotting.chromium] Browser executable: /usr/share/kibana/x-pack/plugins/screenshotting/chromium/headless_shell-linux_x64/headless_shell
-----------------------------------------------------------------------
root@v:/home/vasi/tools/kibana# ps -ax | grep kibana
 484990 pts/0    Sl+    0:45 /usr/share/kibana/bin/../node/bin/node /usr/share/kibana/bin/../src/cli/dist

-----------------------------------------------------------------------
Итог:
http://192.168.1.20:5601/app/discover#/?_g=(filters:!(),refreshInterval:(pause:!t,value:0),time:(from:now-15m,to:now))&_a=(columns:!(),filters:!(),index:security-solution-default,interval:auto,query:(language:kuery,query:''),sort:!())

---------------------------------
ElasticSearch на
http://192.168.1.20:9200/
{
  "name" : "v.perm.ru",
  "cluster_name" : "elasticsearch",
  "cluster_uuid" : "g3ojVaUHRuefR6zTbSa-FA",
  "version" : {
    "number" : "8.1.1",
    "build_flavor" : "default",
    "build_type" : "tar",
    "build_hash" : "d0925dd6f22e07b935750420a3155db6e5c58381",
    "build_date" : "2022-03-17T22:01:32.658689558Z",
    "build_snapshot" : false,
    "lucene_version" : "9.0.0",
    "minimum_wire_compatibility_version" : "7.17.0",
    "minimum_index_compatibility_version" : "7.0.0"
  },
  "tagline" : "You Know, for Search"
}
---------------------------------
Проверка работы elastic
$ curl -XGET 'http://localhost:9200/_all/_search?q=*&pretty'
{
  "took" : 0,
  "timed_out" : false,
  "_shards" : {
    "total" : 0,
    "successful" : 0,
    "skipped" : 0,
    "failed" : 0
  },
  "hits" : {
    "total" : {
      "value" : 0,
      "relation" : "eq"
    },
    "max_score" : 0.0,
    "hits" : [ ]
  }
}
----------------------
С ноута:
vasi@vasi-note:$ curl -XGET 'http://v:9200/_all/_search?q=*&pretty'
{
  "took" : 0,
  "timed_out" : false,
  "_shards" : {
    "total" : 0,
    "successful" : 0,
    "skipped" : 0,
    "failed" : 0
  },
  "hits" : {
    "total" : {
      "value" : 0,
      "relation" : "eq"
    },
    "max_score" : 0.0,
    "hits" : [ ]
  }
}
----------------------
UI Kibana
http://127.0.0.1:5601/app/dashboards#/create?_g=(filters:!(),refreshInterval:(pause:!t,value:0),time:(from:now-15m,to:now))