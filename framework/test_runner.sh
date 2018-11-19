# create dir 'reports' for cucumber logs
/bin/mkdir -p reports

# remove old container & image + create new one
/usr/local/bin/docker rm -f rtv-test
/usr/local/bin/docker rmi -f rtv-test
/usr/local/bin/docker build -t rtv-test:latest .
/usr/local/bin/docker run --shm-size="128m" -i --name rtv-test -v $PWD/reports:/rtv-test/framework/report --memory=12g --cpus=3.5 rtv-test:latest sh -c "cucumber features"
