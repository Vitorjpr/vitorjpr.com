# Variáveis
IMAGE_NAME = meu-site
CONTAINER_NAME = servidor-meu-site
LOCAL_DIR = /home/vitorjpr/workspace/site/vitorjpr

start:
	# Construa a imagem Docker
	@docker build -t $(IMAGE_NAME) . || (echo "O docker pode estar desligado"; exit 1)
	# Inicie o servidor web com o volume montado
	@docker container rm $(CONTAINER_NAME)
	@docker run --name $(CONTAINER_NAME) -p 8080:8080 -v $(LOCAL_DIR):/usr/src/app -d $(IMAGE_NAME) || (echo "Falha ao iniciar o contêiner"; exit 1)

stop:
	# Pare o contêiner Docker
	@docker stop $(CONTAINER_NAME) || (echo "Falha ao parar o contêiner"; exit 1)