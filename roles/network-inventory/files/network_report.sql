USE neutron;
SELECT networks.id, networks.name, subnets.name as subnet, subnets.cidr, networks.status, networks.shared, keystone.project.name as tenant from networks
INNER JOIN keystone.project ON networks.tenant_id COLLATE utf8_unicode_ci = keystone.project.id 
INNER JOIN subnets ON networks.id=subnets.network_id
ORDER BY tenant;