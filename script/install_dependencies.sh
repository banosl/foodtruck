#!/bin/bash
bundle install
bundle exec rake db:{create,migrate}
sudo yum install httpd -y