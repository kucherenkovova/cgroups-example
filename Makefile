NAME=cgroups-example

build-linux:
	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o bin/${NAME}-linux

run: build
	./bin/${NAME}

build: clean
	mkdir -p bin/
	go build -o bin/${NAME}

clean:
	rm -rf bin
	rm -rf vendor

up:
	vagrant up --provision

connect:
	vagrant ssh

deploy: build-linux
	vagrant scp ./bin/${NAME}-linux /home/vagrant/app
	vagrant scp ./scripts/run.sh /home/vagrant/run.sh
