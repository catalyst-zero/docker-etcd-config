docker-etcd-config
==================

This is a simple script one can run along his service-container, which publishes the host/port information to ETCD.

Original work done by [polvi](https://github.com/polvi/docker-reg).

## Building

Just run the build.sh script. We assume you are on coreos here. It will build a container with the tag `localhost:5000/docker-etcd-config`.

NOTE: We are running a local registry on port 5000 on our servers.

## Usage

```
$ PUBLIC_IP=172.17.8.101
$ CONTAINER=$(docker run -d -p $PUBLIC_IP::80 company/service-name)
$ docker run -e ETCD_PORT_10000_TCP_ADDR=<etcd-host> -e ETCD_PORT_10000_TCP_PORT=<etcd-port> localhost:5000/docker-etcd-config ${CONTAINER} 80 "your-service-name"
```

Now, etcd contains a key `/services/your-service-name/{container-id}`. In it you find a simple json:

```
{
	"host": "172.17.8.101",
	"port": 49170
}
```

This json describes how your service is publically reachable.