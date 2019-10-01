## Configure
```bash
./configure
```

## Build make with version (optional)
```bash
cp Makefile Makefile.bak
cp Makefile-with-version Makefile
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

## Clean
```bash
make clean
```
force clean
```bash
make clean FORCE=true
```

## Default make (optional)
```bash
make default-make
```

## Back to default make (without version-optional)
```bash
mv Makefile.bak Makefile
```