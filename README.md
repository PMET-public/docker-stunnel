# stunnel - ssh over https


## stunnel server
	docker run --restart=always -d -p <HTTPS_PORT>:443 esepublic/stunnel /server.sh

## stunnel client
	docker run --rm -e STUNNEL_SERVER_HOST=<HTTPS_HOST> -e STUNNEL_SERVER_PORT=<HTTPS_PORT> -p <SSH_PORT>:22 esepublic/stunnel /client.sh

## connect
	ssh <remote_user>@localhost -p <SSH_PORT>
