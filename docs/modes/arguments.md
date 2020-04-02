## Arguments

FUSE is executed using the following arguments:

- **1st argument**: [file manager](/files/file_manager), which sets the FUSE file systems,
- **2nd argument**: region ID (the catchment `us_09066300` is used as an example below),
- **3rd argument**: parameter estimation mode (see below),
- **4th argument**: parameter values (optional).

For instance:

```
./fuse.exe fm_catch.txt us_09066300 calib_sce
```
