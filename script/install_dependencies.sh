#!/bin/bash
bundle install
rails db:{create,migrate}
sudo yum install httpd -y