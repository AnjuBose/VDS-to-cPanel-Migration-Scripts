Packaging Script : vds2cp.sh [ To be ran on the VDS ]
-----------------------------------------------
This is very basic. Login to the vds, download this file.

    wget --no-check-certificate https://raw.githubusercontent.com/stephenchaffins/VDS-to-cPanel-Migration-Scripts/master/vds2cp.sh; chmod 755 vds2cp.sh


To execute it just run:

    ./vds2cp.sh

It is very important that I should mention, this is ran INSIDE of the VDS, as the VDS user.

Logs for everything this script has done is at /var/log/vds2cp.log





Restoration Script : vds2cp_restore.sh [ To be ran on cPanel ]
-----------------------------------------------
1. Next is the restoration script. This is more complicated to run, slightly, and requires some arguments. This script is ran on the cPanel server.

2. rsync the file (/root/vds2cp_restore_USERNAME.tar.gz) from the VDS server to the cPanel server you plan on restoring to. This has to be at /root/vds2cp_restore_USERNAME.tar.gz on the cPanel server as well.
3. Download this vds2cp_restore.sh from this github repo.

        wget --no-check-certificate https://raw.githubusercontent.com/stephenchaffins/VDS-to-cPanel-Migration-Scripts/master/vds2cp_restore.sh; chmod 755 vds2cp_restore.sh

4. This must be executed with bash, not sh.

5. This requires that you input the VDS username, then the cPanel username, and the password within single quotes. It will look like this:

        ./vds2cp_restore.sh VDSUSERNAME CPANELUSERNAME 'password'

This should do everything you need. You can remove the /root/vds2cp_restore_USERNAME.tar.gz file once everything looks good.

Logs for everything the script has done is at /var/log/vds2cp/CPANELUSERNAME_vds2cp.log
