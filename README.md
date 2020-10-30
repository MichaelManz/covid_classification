# Usage

## build: 
```commandline
docker build . -t pdf2img
```

## convert ps files to jpeg:
```commandline
docker run -it --rm -v <local_dir_with_ps_files>:/var/workdir/ pdf2img
```