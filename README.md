docker-etherpad
===============

[Etherpad] collaborative editor in a [Docker] container. This project is based on [arcus-io/docker-etherpad].

Uses supervisor to manage the etherpad node process

* `docker build -t="etherpad" .
* `docker run -p 9001:9001 -i -t etherpad

[arcus-io/docker-etherpad]: https://github.com/arcus-io/docker-etherpad
[Etherpad]: http://etherpad.org/
[Docker]: http://www.docker.io/
