#!/usr/bin/env bash

#Downloading the dataset to my data server
wget 0.0.0.0/testtask/dilans_data.csv > /home/dataguy/dilan/dilans_data.csv

# Extracting data from dilans_data.csv into the groups

# new readers
grep 'Reddit\|SEO\|AdWords' /home/dataguy/dilan/dilans_data.csv > /home/dataguy/dilan/new_readers.csv

#returning readers
grep 'read' /home/dataguy/dilan/dilans_data.csv | grep -v 'Reddit\|SEO\|AdWords' > /home/dataguy/dilan/returning_readers.csv

#subscribers
grep 'subscribe' /home/dataguy/dilan/dilans_data.csv > /home/dataguy/dilan/subscribers.csv

#customers
grep 'buy' /home/dataguy/dilan/dilans_data.csv > /home/dataguy/dilan/customers.csv



