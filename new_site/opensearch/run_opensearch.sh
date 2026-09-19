docker run -it -p 9200:9200 -p 9600:9600 -e OPENSEARCH_INITIAL_ADMIN_PASSWORD=Bazilio_67 -e "discovery.type=single-node"  --name opensearch-node opensearchproject/opensearch:latest
