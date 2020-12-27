
#APPS = ruby18 ruby19 ru18ra2318 palladius-septober
#objects = Dockerfile.ruby18 Dockerfile.ruby19

#MY_FILES:= $(patsubst b a $(APPS)  )

all: $(APPS)
#myfiles:
#	echo "$(MY_FILES)"
#docker-build-$(APPS):#
#	echo dollaro chiocciola $@

Dockerfile.%-build: 
	@echo DB1. target name: $@
	@echo DB2. prerequisites older: $?
	@echo DB3. all prerequisites: $^

	@./install-random-docker.sh build "$@"

Dockerfile.%-run: Dockerfile.%-build
	@echo DR1. target name: $@
	@echo DR2. prerequisites older: $?
	@echo DR3. all prerequisites: $^

	@./install-random-docker.sh run "$@"


build-$(APPS): 
	@echo TAna libera tutti.
	echo 1. target name: $@

	# Outputs all prerequisites older than the target
	echo 2. prerequisites older $?

	# Outputs all prerequisites
	echo 3. all prerequisites $^

	
	@./install-random-docker.sh "$@"

# docker-build:
# 	docker build -t palladius/ruby1.8  .
# docker-build-alternative:
# 	docker build -t palladius/ruby1.8alt - < Dockerfile.ru18ra2318
# docker-build-pasta-from-septober:
# 	docker build -t palladius/ruby1.8sept - < Dockerfile.palladius-septober

# docker-run-info: docker-build
# 	echo Type: ruby --version
# 	docker run -it -p 3000:3000 palladius/ruby1.8 bash 
# docker-run-alternative-info: docker-build-alternative
# 	docker run -it -p 3000:3000 palladius/ruby1.8alt bash 
# docker-run-pasta-from-septober: docker-build-pasta-from-septober
# 	docker run -it -p 3000:3000 palladius/ruby1.8sept bash 

#ruby --version
#ruby 1.8.7 (2017-12-15 patchlevel 377) [x86_64-linux]

#$(objects): %.o: %.c

test: hey
hey: # one two
	# Outputs "hey", since this is the first target
	echo FRom https://makefiletutorial.com/ 
	echo target name $@

	# Outputs all prerequisites older than the target
	echo prerequisites older $?

	# Outputs all prerequisites
	echo all prerequisites $^

	touch hey
