compile:
	npm i
	./node_modules/coffee-script/bin/coffee -b -o ./lib -c ./src

watch:
	npm i
	./node_modules/coffee-script/bin/coffee -bw -o ./lib -c ./src
