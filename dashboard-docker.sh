docker run -d --name dashboard --network search -p 5601:5601 -e 'OPENSEARCH_HOSTS=["https://node1:9200"]' opensearchproject/opensearch-dashboards:2
#docker run -d --name dashboard --network search -p 5601:5601 -e 'DISABLE_SECURITY_PLUGIN=true' -e 'OPENSEARCH_HOSTS=["https://node1:9200"]' -e 'DISABLE_SECURITY_DASHBOARDS_PLUGIN=true' opensearchproject/opensearch-dashboards:2
