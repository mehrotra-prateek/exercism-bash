# How to test the code

Assuming docker is available for use on the machine

```bash
git clone <current repo>
docker build --build-arg test_file=<test_file_name> --build-arg work_dir=<name_of_bash_project_to_test> -t <docker_image_name> .
docker run <docker_image_name>
```

* docker_image_name: Chose any name
* work_dir: name of bash project to test e.g. acronym
* test_file_name: name of test file name e.g. for acronym_test.sh value will be will `acronym`