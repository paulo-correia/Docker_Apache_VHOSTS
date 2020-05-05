# Apache VHOSTS on Docker (Alpine Linux Image)

## Save Dockerfile on a folder Ex: Apache
**Caution: Only one dockerfile per folder**

### Generate image

docker build -t `<name>` .

`<name>` = Ex: apache or your_docker_hub_name/apache:1.0

### Running Container

docker run -d -p `<local port>`:80 `<name>`

`<local port>` = Ex 8080

### If don't generate image, get from docker hub

docker run -d -p `<local port>`:80 paulocorreia/alpine_apache_vhosts:1.0

### GET Current IP from your running Container

docker container exec -it `<container name or id>` /bin/sh

`<container name or id>` you get on docker ps

inside your container type ifconfig and get inet addr on eth0 - Ex 172.17.0.2 

### Change your hosts file
If your OS is Linux:

Edit as root your /etc/hosts and add a line ate end of file 
on `<container IP>` put your container IP - Ex 172.17.0.2

`<container IP>` sample.dck
`<container IP>` other.dck

And save

Or is Windows:

Edit  C:\Windows\System32\drivers\etc\hosts and add a line ate end of file 
on `<container IP>` put your container IP - Ex 172.17.0.2

`<container IP>` sample.dck
`<container IP>` other.dck

And save

### Open Browser

Open `http://sample.dck` if you see SAMPLE - VHOSTS on Docker is OK
Open `http://other.dck/` if you see OTHER - VHOSTS on Docker is OK

