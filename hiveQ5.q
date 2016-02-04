add jar /home/vimox/jarfiles/hive/hiveudaf.jar;

create temporary function my_total_commission as 'org.hadoop.hive.vimox.Q4HiveAssingmentUDAF';
