dockersh: test
	go fmt && go build -ldflags '-linkmode external -extldflags "-fno-PIC -static"'
	strip dockersh

test:
	PATH=testutils/:$(PATH) go test -coverprofile=profile.out

clean:
	rm -f dockersh
	go fmt

localinstall: dockersh
	sudo cp dockersh /usr/local/bin/dockersh
	sudo chown root:root /usr/local/bin/dockersh
	sudo chmod u+s /usr/local/bin/dockersh

