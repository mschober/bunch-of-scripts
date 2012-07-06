export DEVDB_HOST='devdbf01.db.cj.com';
export DEVDB_PORT='1541';
export DEVDB_SID='devdbf01';

source $GOCK_HOME
gock datawarehouse
mvn clean install -Pdw -Dtest=DimProductTest -Dusername=s303 -Duser.name=s303
