FROM solr:8.11.2

## Taken from https://github.com/ckan/ckan/blob/2.9/contrib/docker/solr/Dockerfile
# Updated the ARG values
ARG CKAN_VERSION=${CKAN_VERSION}

# Enviroment
ENV SOLR_CORE ckan

# Create Directories
RUN mkdir -p /var/solr/data/$SOLR_CORE/conf
RUN mkdir -p /var/solr/data/$SOLR_CORE/data

# Adding Files
ADD https://raw.githubusercontent.com/ckan/ckan/ckan-${CKAN_VERSION}/contrib/docker/solr/solrconfig.xml \
https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/8.11.2/solr/server/solr/configsets/sample_techproducts_configs/conf/currency.xml \
https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/8.11.2/solr/server/solr/configsets/sample_techproducts_configs/conf/elevate.xml \
https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/8.11.2/solr/server/solr/configsets/sample_techproducts_configs/conf/lang/stopwords_en.txt \
https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/8.11.2/solr/server/solr/configsets/sample_techproducts_configs/conf/lang/stopwords_fr.txt \
https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/8.11.2/solr/server/solr/configsets/sample_techproducts_configs/conf/protwords.txt \
https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/8.11.2/solr/server/solr/configsets/sample_techproducts_configs/conf/synonyms.txt \
https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/8.11.2/solr/server/solr/configsets/sample_techproducts_configs/conf/lang/contractions_fr.txt \
/var/solr/data/$SOLR_CORE/conf/

ADD ./schema.xml /var/solr/data/$SOLR_CORE/conf/

# Create Core.properties
RUN echo name=$SOLR_CORE > /var/solr/data/$SOLR_CORE/core.properties

# Giving ownership to Solr

USER root
RUN chown -R $SOLR_USER:$SOLR_USER /var/solr/data/$SOLR_CORE

# User
USER $SOLR_USER:$SOLR_USER
