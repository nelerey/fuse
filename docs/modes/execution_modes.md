## FUSE execution

FUSE is executed using the following arguments:

- **1st argument**: [file manager](/files/file_manager), which sets the FUSE file systems,
- **2nd argument**: region ID (the catchment `us_09066300` is used as an example below),
- **3rd argument**: parameter estimation mode (see below),
- **4th argument**: parameter values (optional).

## Parameter estimation modes

Parameter values can be set in different ways by using the following values for the third argument:

** Run using default parameter values - `run_def`**

The default parameter values defined in (add link to table) will be used, e.g.:

```
./fuse.exe fm_catch.txt us_09066300 run_def
```

** Calibrate parameters using SCE - `calib_sce`**

Parameter values will be estimated using SCE (see parameters in file managers) and saved in the output file ending in `_sce_cal.nc`, e.g.:

```
./fuse.exe fm_catch.txt us_09066300 calib_sce
```

** Run using the best SCE parameter set - `run_best`**

The best paramter set will be retrieved and used, the outfile will end `_sce_best.nc`, e.g.:

```
./fuse.exe fm_catch.txt us_09066300 run_best
```

** Run using pre-defined parameter values - `run_pre`**

FUSE will be run using pre-defined parameter sets, which will on the same grid as the input files,  the outfile will end `_pre.nc`, e.g.:

```
./fuse.exe fm_catch.txt us_09066300 run_pre XXX
```
