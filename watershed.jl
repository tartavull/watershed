# load dependencies
include("steepestascent.jl")
include("divideplateaus.jl")
include("findbasins.jl")
include("regiongraph.jl")
include("mergeregions.jl")
include("mst.jl")

using HDF5
input_path = ARGS[1]
print("input path: ")
print(input_path)

output_path = ARGS[2]
print("\noutput path: ")
print(output_path)

high = parse(Float32,ARGS[3])
print("\nhigh: ")
print(high)

low = parse(Float32,ARGS[4])
print("\nlow: ")
print(low)
print("\n")

# read affinities
aff = h5read(input_path,"main");
# created steepest ascent graph
sag=steepestascent(aff,low,high);
# divided plateaus
divideplateaus!(sag);
# find basins
(seg, counts, counts0) = findbasins(sag);
# create region graph
rg = regiongraph(aff,seg,length(counts));
# merge regions
new_rg = mergeregions(seg,rg,counts,[(256,.3)]);
# create maximal spanning tree
rt = mst(new_rg,length(counts));

# export
#TODO export mst
h5open(output_path, "w") do file
    write(file, "/main", seg)
end