docker-etherpad
===============

[Etherpad] collaborative editor in a [Docker] container. This project is based on [arcus-io/docker-etherpad].

Uses supervisor to manage the etherpad node process

* `docker build -t="etherpad" .`
* `docker run -p 9001:9001 -i -t etherpad`

Remove the default Nginx config:

    sudo rm /etc/nginx/sites-enabled/default

Add the nginx.config to the docker host:

    sudo cp /etc/nginx/sites-available/etherpad.conf
    sudo ln -s /etc/nginx/sites-available/etherpad.conf /etc/nginx/sites-enabled/etherpad.conf
    
[arcus-io/docker-etherpad]: https://github.com/arcus-io/docker-etherpad
[Etherpad]: http://etherpad.org/
[Docker]: http://www.docker.io/
