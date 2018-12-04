NAME=DDS

RESOURCES= assets/ aztecways.ttf background.png blood*.png dudes.png hemo.png hump/ keys.png roboto.ttf saru.ttf shaman.png titlescreen.png hemo.png

all:
	zip	-r $(NAME).zip *.lua $(RESOURCES)
	mv $(NAME).zip releases/$(NAME).love

win32: all
	mkdir -p releases/win32
	cat releases/love-11.1.0-win32/love.exe releases/$(NAME).love > releases/win32/$(NAME).exe
	cp releases/love-11.1.0-win32/license.txt releases/love-11.1.0-win32/*.dll releases/win32/
	rm -f releases/$(NAME)_win32.zip
	cd releases/win32/ ;\
	zip	-r ../$(NAME)_win32.zip ./ ;\
	cd ../../

win64: all
	mkdir -p releases/win64
	cat releases/love-11.1.0-win64/love.exe releases/$(NAME).love > releases/win64/$(NAME).exe
	cp releases/love-11.1.0-win64/license.txt releases/love-11.1.0-win64/*.dll releases/win64/
	rm -f releases/$(NAME)_win64.zip
	cd releases/win64/ ; \
	zip	-r ../$(NAME)_win64.zip ./ ;\
	cd ../../
