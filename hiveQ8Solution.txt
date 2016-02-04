To run the hive in embedded metastore configuration remove all other properties 
from the <hive folder>/conf/hive-site.xml, ie after change it would look like:-

doing this hive would run in default configuration ie, embedded metastore.

hive-site.xml
~~~~~~~~~~~~~

<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>

<configuration>

</configuration>