# Use phusion/passenger-full as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/passenger-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM phusion/passenger-nodejs

# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]

# RUN /pd_build/nodejs.sh

RUN rm /etc/nginx/sites-enabled/default
ADD webapp.conf /etc/nginx/sites-enabled/webapp.conf
RUN mkdir /home/app/webapp

# ...put your own build instructions here...
COPY ./package.json /home/app/webapp
COPY --chown=app:app . /home/app/webap
RUN npm install
EXPOSE 3000
CMD [ "npm", "start" ]

# Clean up APT when done.
RUN rm -f /etc/service/nginx/down
# Enable the Redis service.
RUN rm -f /etc/service/redis/down
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*