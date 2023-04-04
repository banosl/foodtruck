#!/bin/bash
bundle install
rails db:{create,migrate}
sudo dnf install httpd -y