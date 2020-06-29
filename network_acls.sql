select a.acl_owner,
       p.principal,
       a.acl,
       a.host,
       a.lower_port,
       a.upper_port,
       p.privilege,
       p.is_grant,
       p.invert,
       p.start_date,
       p.end_date
  from dba_network_acls a,
       dba_network_acl_privileges p
 where a.acl = p.acl
   and a.aclid = p.aclid
 order by a.acl,
       p.principal;


