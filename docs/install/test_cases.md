## Run FUSE for the catchment test case

The steps below will enable you to test if FUSE is running as expected. The instructions were purposefully kept short, but their elements are described in more detail in the rest of the documentation.

1. If you haven't yet, download the data for the [catchment test case](/install/test_data) to a directory `$(data_catch)`.
1. Update the lines 3 to 5 of `fm_catch.txt` (this is the file manager) using the path of `$(data_catch)`.
1. Run FUSE using default parameter values (note `run_def` below):

```
./fuse.exe path_to_data_catch/fm_catch.txt us_09066300 run_def
```

If FUSE runs and terminates with `Done`, it is good sign. Explore the files just created in the `output` folder and maybe compare them with those in `output_ref`, which we created.

## Run FUSE for the grid test case

1. If you haven't yet, download the data for the [grid test case](/install/test_data) to a directory `$(data_grid)`.
1. Update the lines 3 to 5 of `fm_grid.txt` using the path of `$(data_grid)`.
1. Run FUSE using default parameter values over the grid:

```
./fuse.exe path_to_data_grid/fm_grid.txt cesm1-cam5 run_def
```

If FUSE runs and terminates with `Done`, it is good sign. Explore the files just created in the `output` folder and maybe compare them with those in `output_ref`, which we created.
