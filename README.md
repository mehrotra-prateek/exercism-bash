# How to test the code

Assuming docker is available for use on the machine

```bash
git clone <current repo>
docker build --build-arg key=<value> -t <value> .
docker run <value>
```

* Derive value from the test file name e.g. if test file is acronym_test then value is acronym.