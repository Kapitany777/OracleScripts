-- Query invalid Oracle objects

select o.owner,
       o.object_type,
       o.object_name,
       o.created,
       o.last_ddl_time
  from dba_objects o
 where status <> 'VALID'

union

select o.owner,
       o.object_type,
       o.object_name,
       o.created,
       o.last_ddl_time
  from dba_objects o,
       dba_indexes i
 where o.owner = i.owner
   and o.object_name = i.index_name
   and o.owner not in ('SYS', 'SYSTEM')
   and o.object_type <> 'INDEX PARTITION'
   and i.status <> 'VALID'
   
 order by owner,
       object_type,
       object_name;



-- Query invalid Oracle objects, current user

select o.object_type,
       o.object_name,
       o.created,
       o.last_ddl_time
  from user_objects o
 where status <> 'VALID'

union

select o.object_type,
       o.object_name,
       o.created,
       o.last_ddl_time
  from user_objects o,
       user_indexes i
 where o.object_name = i.index_name
   and o.object_type <> 'INDEX PARTITION'
   and i.status <> 'VALID'
   
 order by object_type,
       object_name;

