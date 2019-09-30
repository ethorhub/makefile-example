## Configure
```bash
./configure
```

## Build make version (optional)
```bash
cp Makefile Makefile.bak
mv Makefile-with-version Makefile
make build-v1
```

## Build
```bash
make build
```

## Usage
```bash
make
```
or run with static libraries
```bash
make run_static
```

## Clean
```bash
make clean
```
force clean
```bash
make clean FORCE=true
```

## Default make
```bash
make default-make
```

## Back to default make (optional)
```bash
mv Makefile Makefile-with-version
mv Makefile.bak Makefile
make build-v1
```