# A simple Django polling application Add commentMore actions

### Build the image

```sh
cd Django-Poll-App
docker build -t poll-app .
```

### Run the client

`docker run --name=poll-me -d -p 8000:8000 poll-app`

### Verify the client is running

Open your browser and type `http://localhost:8000`

### Check container logs

`docker logs poll-me`
