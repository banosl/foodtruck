#!/bin/bash
bundle install
rails db:{create,migrate}
yum install httpd -y