help:
	@echo "Available commands:"
	@echo "  make certs - Generate self-signed certificates"
	@echo "  make hosts - Add hosts for testing"
	@echo "  make pull - Pull the latest images"
	@echo "  make up - Start the server"
	@echo "  make stop - Stop the server"
	@echo "  make logs - Tail logs"
	@echo "Access Opal: https://opal.localhost"
	@echo "Access Traefik: https://traefik.localhost"

certificates:
	@echo "Generating self-signed certificates..."
	openssl genrsa -out selfsigned.key 2048
	openssl req -x509 -new -nodes -key selfsigned.key -sha256 -days 365 -out selfsigned.crt
	mkdir -p certs
	mv selfsigned.key certs/
	mv selfsigned.crt certs/

pull:
	@echo "Pulling the latest images..."
	docker compose pull

up:
	@echo "Starting the server..."
	docker compose up -d

stop:
	@echo "Stopping the server..."
	docker compose down

logs:
	@echo "Showing logs..."
	docker compose logs -f

hosts:
	@echo "Adding hosts for testing..."
	sudo -- sh -c "echo '127.0.0.1  	opal.localhost' >> /etc/hosts"
	sudo -- sh -c "echo '127.0.0.1  	traefik.localhost' >> /etc/hosts"