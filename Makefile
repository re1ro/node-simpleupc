compile:
	npm i
	./node_modules/coffee-script/bin/coffee -b -o ./build -c ./src

watch:
	npm i
	./node_modules/coffee-script/bin/coffee -bw -o ./build -c ./src
