ARCH=linux/x86_64

all: jd-core-java-1.1.jar libjd-intellij.so

jd-intellij:
	hg clone https://bitbucket.org/bric3/jd-intellij

libjd-intellij.so: jd-intellij
	cp jd-intellij/src/main/native/nativelib/${ARCH}/libjd-intellij.so .

target/jd-core-java-1.1.jar:
	mvn package

jd-core-java-1.1.jar: target/jd-core-java-1.1.jar
	cp $< $@

clean:
	rm -rf jd-core-java-*.jar libjd-intellij.so target jd-intellij
