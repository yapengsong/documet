-- by 程龙
update cloud_grouprule set protocol_expand = null where port_rangemax is null and port_rangemin is null and protocol_expand='';