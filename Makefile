.PHONY: clean delete
.SUFFIXES: .c .o .a

vpath %.c src
vpath %.h include

Code2: Code2.o libpole.a libobjetosc.so
	$(CC) $(CFLAGS) -o $@ $^ -I./include
	echo "To run program type: ./Code2"
	echo "If program fails to run check README"

libpole.a: kwadratPole.o szescianPole.o
	$(AR) -rs $@ $^

libobjetosc.so: kwadratObjetosc.o szescianObjetosc.o
	$(CC) $(CFLAGS) -shared -o $@ $^ -I./include 
	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:.

.c.o:
	$(CC) $(CLAGS) -c $^ -I./include

clean:
	rm -f *.o

delete:
	rm -f *.o *.so *.a Code2