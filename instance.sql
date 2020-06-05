-- Query instance information

select inst_id,
       instance_number,
       instance_name,
       host_name,
       version,
       to_char(startup_time, 'yyyy.mm.dd hh24:mi:ss') as startup_time,
       status,
       parallel,
       thread#,
       archiver,
       log_switch_wait,
       logins,
       shutdown_pending,
       database_status,
       instance_role,
       active_state,
       blocked
  from gv$instance
 order by instance_number;
  
