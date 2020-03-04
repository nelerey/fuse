## Spatial modes

FUSE can be run in two spatial modes:

**Catchment mode:** this mode is FUSE original mode, it runs FUSE for a single spatial unit and is ideal for rainfall-runoff modelling at the catchment scale. All the FUSE [parameter estimation modes](/modes/execution_modes) are available for this mode.

**Grid mode:** this mode runs FUSE on a grid, it is designed to produce simulations over large domains and to conduct climate impact assessments driven by climate models. Spatially distributed atmospheric forcing is required and spatially distributed parameter values should be used. In this mode, model calibration using SCE is not possible, as daily gridded streamflow observations are not readily available. Instead, we recommend calibrating FUSE at the catchment scale, and transferring the entire parameter sets from donors catchments to individual grid cells. Note there is no lateral flow between the grid cells but runoff from adjacent cells can be routed over the entire domain using for instance [MizuRoute](https://mizuroute.readthedocs.io/en/develop/index.html).

FUSE will automatically adapt to the spatial configuration of the input files. The catchment mode is actually a special case of the grid mode, as it essentially relies on a 1 x 1 grid. During its setup phase, FUSE will retrieve the `lat` and `lon` variables of the NetCDF forcing file and will then run on the grid they define. The output files will be produced using the same grid.

**Elevation bands:** FUSE can use [elevation bands](/files/input_files) to account for the effect of topography on temperature and precipitation within each spatial unit, regardless of whether it corresponds to a catchment or a grid cell.
