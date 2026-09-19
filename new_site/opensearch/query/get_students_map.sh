#!/bin/bash

# Get the MAPPING (_mapping!!!) of the students index
curl -X GET "https://v:9200/students/_mapping?pretty" -ku admin:$ES_PASS
