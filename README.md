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


Master VDS Script : vds2cp_master.sh [ To be ran on VDS master as root ]
-----------------------------------------------
1. This is the master script. It's to be ran on the VDS master server as the root user. Not inside of the VDS, not as the user. This will package all of the VDS's on the server and put them in ~USER/root/ right now. Maybe it'll move everything to /root/vds_migration/ in the end. Not sure yet.

2. Download this vds2cp_master.sh from this github repo.

      wget --no-check-certificate https://raw.githubusercontent.com/stephenchaffins/VDS-to-cPanel-Migration-Scripts/master/vds2cp_master.sh; chmod 755 vds2cp_restore.sh

3. You should just be able to run this. It will look like this:

      ./vds2cp_master.sh

3. This should output the packaging of each account to the screen. It'll do them in order, one by one. Log should be at /var/log/vds2cp_master.log on the VDS master.
