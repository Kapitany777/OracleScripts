-- Query version numbers of core library components in the Oracle Database

select inst_id,
        banner
  from gv$version
 order by inst_id,
       banner;

