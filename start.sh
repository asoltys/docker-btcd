docker run --name=btcd-data asoltys/btcd init
docker run --volumes-from=btcd-data --name=btcd-node -d -p 8334:8334 asoltys/btcd 
