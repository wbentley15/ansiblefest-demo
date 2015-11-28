#
# Script to automate OpenStack cloud Infrastructure services health check
#
NOW=$(date +"%Y%m%d")

# Check health of MariaDB and Galera
ansible -i {{ DEPLOY_LOC }}/inventory/dynamic_inventory.py galera_container -m shell -a "mysql -h localhost -e 'show status like \"%wsrep_cluster_%\";'" >> {{ REPORT_DIR }}/os_health_check_$NOW.txt

# Check health of RabbitMQ
ansible -i {{ DEPLOY_LOC }}/inventory/dynamic_inventory.py rabbit_mq_container -m shell -a "rabbitmqctl cluster_status" >> {{ REPORT_DIR }}/os_health_check_$NOW.txt

# Check queue health of RabbitMQ
ansible -i {{ DEPLOY_LOC }}/inventory/dynamic_inventory.py rabbit_mq_container -m shell -a "rabbitmqctl list_queues | awk '\$2>0'" >> {{ REPORT_DIR }}/os_health_check_$NOW.txt

exit 0