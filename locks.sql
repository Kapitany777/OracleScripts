-- It shows which sessions are holding DML locks on what objects and in what mode

select i.inst_id,
       i.instance_number,
       i.instance_name,
       i.host_name,
       s.schemaname,
       s.username,
       s.sid,
       s.serial#,
       s.status,
       s.osuser,
       s.machine,
       s.terminal,
       s.program,
       o.object_name,
       rawtohex(s.sql_address),
       s.sql_hash_value,
       l.locked_mode,
       decode(l.locked_mode,
          0, 'NONE: lock requested but not yet obtained',
          1, 'NULL',
          2, 'ROWS_S (SS): Row Share Lock',
          3, 'ROW_X (SX): Row Exclusive Table Lock',
          4, 'SHARE (S): Share Table Lock',
          5, 'S/ROW-X (SSX): Share Row Exclusive Table Lock',
          6, 'Exclusive (X): Exclusive Table Lock',
          '???') as locked_info
  from gv$locked_object l,
       gv$instance i,
       gv$session s,
       dba_objects o
 where l.inst_id = i.inst_id
   and l.inst_id = s.inst_id
   and l.session_id = s.sid
   and l.object_id = o.object_id
 order by s.status,
       s.terminal,
       s.program;
    
