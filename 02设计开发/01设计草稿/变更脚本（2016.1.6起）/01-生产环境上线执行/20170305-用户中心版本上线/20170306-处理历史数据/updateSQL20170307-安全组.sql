-- -- by】程龙
update cloud_grouprule set protocol_expand ='' where port_rangemax is null and port_rangemin is null and protocol='ICMP' and icmp='所有';