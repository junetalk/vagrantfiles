echo "*********************************************************************************"
echo "* Script starts the Greenplum DB, Greenplum Control Center, and Apache Zeppelin *"
echo "*********************************************************************************"
echo "* Starting Greenplum Database..."
source /usr/local/greenplum-db/greenplum_path.sh
source /usr/local/greenplum-cc-web/gpcc_path.sh
#source /home/gpadmin/gp-wlm/gp-wlm_path.sh
export MASTER_DATA_DIRECTORY=/gpdata/master/gpseg-1
gpstart -a
echo "* Greenplum Database Started."
echo "* Starting Greenplum Command Center..."
gpcmdr --start gpdb_sandbox
echo "* Greenplum Command Center Started."
echo "* Starting Apache Zeppelin Server...."
sudo /usr/local/zeppelin/bin/zeppelin-daemon.sh start
echo "* Apache Zeppelin Server Started."
echo "*********************************************************************************"
echo "* Updating Tutorial Files..."
cd ~/gpdb-sandbox-tutorials;git pull > /dev/null 2>&1;tar xvfz faa.tar.gz;cd
echo "* Tutorials Updated."
echo "*********************************************************************************"
echo " Pivotal Greenplum Database Started on port 5432        "
echo " Pivotal Greenplum Command Center started on port 28080 "
echo "          http://localhost:28080                              "
echo "          Username: gpmon                                "
echo "          Password: pivotal                              "
echo " Apache Zeppelin started on port 8080                    "
echo "          http://localhost:8080                                       "
echo "*********************************************************************************"
echo;echo