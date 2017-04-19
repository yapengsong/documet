UPDATE sys_selfpower SET power_route = 'rds_instance_createreplica' WHERE power_route = 'rds_instance_createReplica';
UPDATE sys_selfpower SET power_route = 'rds_instance_detachreplica' WHERE power_route = 'rds_instance_detachReplica';
UPDATE sys_selfpower SET power_route = 'rds_instance_modifyconfiguration' WHERE power_route = 'rds_instance_modifyConfiguration';