select i.instance_number,
       i.instance_name,
       p.num,
       p.name,
       p.type,
       decode(p.type, 1, 'Boolean', 2, 'String', 3, 'Integer', 4, 'Parameter file', 5, 'Reserved', 6, 'Big integer', '?') as type_name,
       p.description,
       p.value,
       p.display_value,
       p.isdefault,
       p.isses_modifiable,
       p.issys_modifiable,
       p.isinstance_modifiable,
       p.ismodified,
       p.isadjusted,
       p.isdeprecated
  from gv$parameter p,
       gv$instance i
 where p.inst_id = i.inst_id
 order by i.instance_number,
       p.name;

  

select i.instance_number,
       i.instance_name,
       p.num,
       p.name,
       p.type,
       decode(p.type, 1, 'Boolean', 2, 'String', 3, 'Integer', 4, 'Parameter file', 5, 'Reserved', 6, 'Big integer', '?') as type_name,
       p.description,
       p.value,
       p.display_value,
       p.isdefault,
       p.isses_modifiable,
       p.issys_modifiable,
       p.isinstance_modifiable,
       p.ismodified,
       p.isadjusted,
       p.isdeprecated
  from gv$parameter p,
       gv$instance i
 where p.inst_id = i.inst_id
   and p.isdefault = 'FALSE'
 order by i.instance_number,
       p.name;
  

