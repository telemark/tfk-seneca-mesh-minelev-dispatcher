###########################################################
#
# Dockerfile for tfk-seneca-minelev-stats-dispatcher
#
###########################################################

# Setting the base to nodejs 4.5.0
FROM mhart/alpine-node:4.5.0

# Maintainer
MAINTAINER Geir Gåsodden

#### Begin setup ####

# Installs git
RUN apk add --update --no-cache git

# Extra tools for native dependencies
RUN apk add --no-cache make gcc g++ python

# Bundle app source
COPY . /src

# Change working directory
WORKDIR "/src"

# Install dependencies
RUN npm install --production

# Env variables
ENV TFK_SENECA_MINELEV_STATS_DISPATCHER_TAG tfk-seneca-minelev-stats-dispatcher
ENV TFK_SENECA_MINELEV_STATS_DISPATCHER_HOST localhost
ENV TFK_SENECA_MINELEV_STATS_DISPATCHER_PORT 8000

# Startup
CMD ["node", "service.js", "--seneca-log=type:act"]