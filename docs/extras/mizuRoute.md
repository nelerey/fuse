## Routing FUSE simulations with mizuRoute

The runoff simulated by FUSE in grid mode can be routed through a river network using the 1D routing system mizuRoute. To test the FUSE-mizuRoute combination over the contiguous US, follow these steps:

1. download the [CONUS test case](/install/test_data) containing the FUSE input files including 10 days of meteorological forcing and the mizuRoute files including the network description files,
* adapt the paths in `fuse_conus/fuse/fm_conus.txt`, run FUSE over the CONUS using `run_def` mode, and visually check the resulting simulations,
* fork the mizuRoute code from its [GitHub repo](https://github.com/NCAR/mizuRoute), adapt the paths in `route/build/Makefile` and compile it,
* adapt the paths in `fuse_conus/mizu/mizu_fm.txt`, the equivalent of FUSE file manager, and run mizuRoute: `./mizu.exe fuse_conus/mizu/mizu_fm.txt`.
