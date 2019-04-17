# houdini-transform-matcher
A Houdini DSO that extracts the transform between two sets of points using the Procrustes transform.

## Installation
0. Clone the repository, including dependencies, e.g `git clone --recursive`
1. Modify `compile.sh` or `compile.bat` (on Windows) to use your Houdini installation and version
2. Compile with the script
3. Move the resulting `dll`/`dylib`/`so` to your `HOUDINI_DSO_PATH` or add the path where it is located to it, 
   e.g export HOUDINI_DSO_PATH="`pwd`/dso;&"

### Notes
As of Houdini 17.5, `hcustom` requires `csh` to be available under Linux


## Usage
Put the source object into the first input, the transformed object into the second input of a `Match Transform` node.

The node will write detail attributes `scale`, `transform`, `rotation`. To get the transformed object, do `P = (s*P)*R + t`.

To make things easier, use the `Match Transform` OTL that this comes with. It optionally takes two *ordered* groups, which allows you to select a subset of points from your two objects. You have to select the points in the same order and then create groups with the `Create Ordered` flag enabled.

## License
The code itself is under the MIT license; Eigen and libigl (the dependencies) are under the MPL2 license.


