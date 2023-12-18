docker run -d --network search --name node1 -p9200:9200 -p9600:9600 -e 'cluster.name=searchymcsearchface' -e 'node.name=node1' -e 'bootstrap.memory_lock=false' -e 'discovery.type=single-node' -e 'OPENSEARCH_JAVA_OPTS=-Xms512m -Xmx512m' opensearchproject/opensearch:2