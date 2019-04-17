vi /etc/systemd/system/docker.service.d/docker.root.conf
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd --data-root /storage/docker/ --add-runtime oci=/usr/sbin/docker-runc $DOCKER_NETWORK_OPTIONS $DOCKER_OPTS

systemctl daemon-reload
systemctl restart docker
docker info

#Verify drop-ins changes
systemd-delta --type=extended