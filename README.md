[![logo](https://raw.githubusercontent.com/rsmartapps/samba/master/logo.jpg)](https://www.samba.org)

# Samba

Samba docker container

# What is Samba?

Since 1992, Samba has provided secure, stable and fast file and print services
for all clients using the SMB/CIFS protocol, such as all versions of DOS and
Windows, OS/2, Linux and many others.

# How to use this image

By default there are no shares configured, additional ones can be added.

## Hosting a Samba instance

    sudo docker run -it -p 139:139 -p 445:445 -d rsmartapps/samba -p

OR set local storage:

    sudo docker run -it --name samba -p 139:139 -p 445:445 \
                -v /path/to/directory:/mnt \
                -v /path/to/configs/directory:/config \
                -d rsmartapps/samba

## Configuration

ENVIRONMENT VARIABLES

 * `TZ` - Set a timezone, IE `EST5EDT`
 * `USERS` - As above, setup a user (See NOTE3 below)
 * `FOLDERS` - As above, adds folders, IE `/mnt/share1;/mnt/share2`

## Volumes
 * Config volume exposed
 * mnt folder exposed

## Examples

Any of the commands can be run at creation with `docker run` or later with
`docker exec -it samba` (as of version 1.3 of docker).

### Setting the Timezone

    sudo docker run -it -e TZ=EST5EDT -p 139:139 -p 445:445 -d rsmartapps/samba

### Start an instance creating users and shares:

    sudo docker run -it -p 139:139 -p 445:445 -d rsmartapps/samba
# User Feedback

## Troubleshooting

## Issues

If you have any problems with or questions about this image, please contact me
through a [GitHub issue](https://github.com/rsmartapps/samba/issues).