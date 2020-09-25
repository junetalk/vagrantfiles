
echo "********************************************************************************************"
echo "* This script stops the Greenplum Database, Greenplum Control Center, and Apache Zeppelin *"
echo "********************************************************************************************"
echo "* Stopping Greenplum Database..."
source /usr/local/greenplum-db/greenplum_path.sh
source /usr/local/greenplum-cc-web/gpcc_path.sh
export MASTER_DATA_DIRECTORY=/gpdata/master/gpseg-1
gpstop -M immediate -a
echo "* Greenplum Database Stopped."
echo "* Stoppin Greenplum Command Center..."
gpcmdr --stop gpdb_sandbox
echo "* Greenplum Command Center Stopped."
echo "* Stopping Apache Zeppelin Server...."
sudo /usr/local/zeppelin/bin/zeppelin-daemon.sh stop
echo "* Apache Zepeelin Server Stopped."
echo "********************************************************************************************"
echo " ALL DATABASE RELATED SERVICES STOPPED.    RUN ./start_all.sh to restart"
echo "********************************************************************************************"
echo;