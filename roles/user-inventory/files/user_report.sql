USE keystone;
SELECT user.id, user.name as username, user.enabled, role.name as role, project.name as tenant from user 
INNER JOIN assignment ON 
user.id=assignment.actor_id INNER JOIN 
role ON assignment.role_id=role.id INNER JOIN
project ON assignment.target_id=project.id
ORDER BY tenant;