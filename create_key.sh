#create_key.sh


echo "@@Type following lines@@"
echo "add_entry -password -p ${USER^^}@CERN.CH -k 1 -e arcfour-hmac-md5"
echo "add_entry -password -p ${USER^^}@CERN.CH -k 1 -e aes256-cts"
echo "wkt ${USER}.keytab"

echo "@@After setup, ctrl+D"
ktutil


echo "@@check keytab file@@"
ls ${PWD}/${USER^^}.keytab
