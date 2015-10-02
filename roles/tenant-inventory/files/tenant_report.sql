USE nova;
SELECT SUM(instances.vcpus) as vCPU, SUM(instances.memory_mb) as memory, SUM(instances.root_gb) as disk, keystone.project.name as tenant from instances
INNER JOIN keystone.project ON
instances.project_id=keystone.project.id 
WHERE instances.vm_state='active' GROUP BY tenant;