CXXFLAGS = # -Wall -Werror
LDFLAGS = 

src = $(wildcard ./*/*.c)
target = $(patsubst %.c, %, ${src})

.PHONY: all clean

%:%.cpp
	$(CXX) ${CXXFLAGS} ${LDFLAGS} $^ -o $@

all: ${target}

clean:
	rm -f ${target}