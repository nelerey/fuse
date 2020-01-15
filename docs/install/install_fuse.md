## Notes on the computing environment

This page will guide you through the installation of FUSE. Before you get started, please note that:

1. below we assume that you will be compiling and running FUSE in a Linux/UNIX environment - for OS X/macOS, have a look at this [page](https://summa.readthedocs.io/en/latest/installation/SUMMA_on_OS_X/) of the SUMMA manual,
2. you will need a Fortran compiler - FUSE was developed and tested using `ifort`, which we recommend if you have no previous experience with Fortran compilers, note that to use `ifort` you might have to load the associated module (try `module avail` and then `module add`),
3. you will need access to the NetCDF and HDF libraries - use the libraries compiled with the compiler you selected above, you might have to load them (again, try `module avail` and `module add`), then try `which ncdump`, as this should give you an idea of the path to the NetCDF libraries, the path to the HDF libraries should be similar. Note that these paths are machine-dependent.
4. you will need data to test FUSE, we provide data for two test cases, start by downloading the data for the [catchment test case](../test_cases/).

## A. Fork the FUSE repository and compile FUSE
1. Fork the [FUSE repository](https://github.com/naddor/fuse) to a directory `$(MASTER)` on your machine (see the [SUMMA manual](http://summa.readthedocs.io/en/latest/development/SUMMA_and_git/) for a step-by-step procedure)
2. Change directory to `$(MASTER)/build/` and edit the `Makefile` by:
    * defining the name of the master directory (line 11),
    * defining the fortran compiler (line 27),
    * defining the path to the NetCDF and HDF libraries (lines 34-35).
3. Compile the SCE code (see Section H below).
4. Compile the FUSE code (type `make`).
5. Change to `$(MASTER)/bin/` and try running FUSE by typing `./fuse.exe`. If the output is `1st command-line argument is missing (fileManager)`, you have probably compiled FUSE correctly. 

## B. Populate the bin directory
To run FUSE, you must use a `FILEMANAGER`, which defines the paths to the FUSE `settings`, `input`, `output` directories, as well as other settings essential to run FUSE (described in Sections C and D).
1. Move the file `fm_catch.txt` provided for the catchment case study to `$(MASTER)/bin/`. This is the `FILEMANAGER` for the catchment case study.
1. Update the lines 3 to 5 of `fm_catch.txt` using the path of the `fuse_catch` directory on your machine.

## C. Populate the settings directory
The `settings` directory must contain the following files (provided for the catchment case study):

   1. The file `M_DECISIONS` (called `fuse_zDecisions_902.txt` in the case studies) describes the different options available in the FUSE modeling framework. These modeling decisions are described in detail by [Clark et al. (WRR, 2008)](http://dx.doi.org/10.1029/2007WR006735), except decision 9 described in [Henn et al. (WRR, 2015)](http://dx.doi.org/10.1002/2014WR016736).
   2. The file `CONSTRAINTS` (called `fuse_zConstraints_snow.txt` in the case studies) defines in particular the default parameter values and lower and upper parameter bounds. The list of parameters corresponds to those described in [Clark et al. (WRR, 2008)](http://dx.doi.org/10.1029/2007WR006735) and [Henn et al. (WRR, 2015)](http://dx.doi.org/10.1002/2014WR016736).
   3. The file `MOD_NUMERIX` (called `fuse_zNumerix.txt` in the case studies) defines decisions regarding the numerical solution technique. Examples of the impact of these decisions are described by [Clark and Kavetski (WRR 2010)](http://dx.doi.org/10.1029/2009WR008894) and [Kavetski and Clark (WRR 2010)](http://dx.doi.org/10.1029/2009WR008896).
   4. The file `FORCINGINFO` (called `input_info.txt` in the case studies) provides metadata for the NetCDF input file. It defines the name and units of the variables in the input file.

## D. Populate the input directory
The `input` directory must contain the following files (provided for the catchment case study):

   1. The file `forcefile` (called `us_09066300_input.nc` in the catchment case study) contains the input data in a 2D (resp. 3D) arrays for modeling at the catchment (resp. grid) scale. The name of this file is made by appending the `suffix_forcing` defined in the `FILEMANAGER` (see B) to the basin ID (see E `$2`).
   2. The file `BFILE` (called `us_09066300_elev_bands.nc` in the catchment case study) describe the elevation bands required when the snow module is on. The dimensions of this file must match that of `forcefile`. The name of this file is made by appending the `suffix_elev_bands` defined in the `FILEMANAGER` (see B) to the basin ID (see E `$2`).

Note that the dimension of the NetCDF files will determine if FUSE is run at the catchment or grid-scale. FUSE will look for the variables `lat` and `lon` and if they are arrays, it will run on the grid they define. This means that NetCDF input files for a single catchment must also include the variables `lat` and `lon`.

## E. Execute FUSE

Run FUSE using default parameter values at the catchment scale:
```
./fuse.exe fm_catch.txt us_09066300 run_def
```

then calibrate it:

```
./fuse.exe fm_catch.txt us_09066300 calib_sce
```

then run it with the best SCE parameter set:

```
./fuse.exe fm_catch.txt us_09066300 run_best
```

where
`$1` is the file manager,
`$2` is the basin ID,
`$3` is the FUSE mode.

## F. Content of the output directory
Running FUSE in its different modes will create the following files in the `output` directory (provided for the catchment case study for comparison purposes):
* the files whose name contains `runs` contain the simulations,
* the files whose name contains `para` contain the parameter values,
* the last element of the file name indicates which FUSE mode was used.

## G. Run FUSE for the grid case study

Download the data for the grid scale case study (see `FUSE modes and case studies` section) and follow the same steps as for the catchment scale case study.

Run FUSE unsing default parameter values over the grid:

```
./fuse.exe fm_grid.txt cesm1-cam5 run_def
```

Note that because the gridded data does not contain streamflow, FUSE cannot be calibrated using SCE. Instead, FUSE can be run using pre-defined parameter sets using the `run_pre` mode (description to be added).   

## H. Compile SCE
The code of the shuffled complex evolution method (`$(MASTER)/build/FUSE_SRC/FUSE_SCE/sce.f`) was written in F77, so it must be compiled separately. If you use `ifort`, try the following flags:

```
ifort -O2 -c -fixed sce_16plus.f
```

If necessary, rename the compiled file, so that it can be found by the `Makefile`, which by default will be looking for a file named `sce_16plus.o`.

<a id="infile_file_formats"></a>
