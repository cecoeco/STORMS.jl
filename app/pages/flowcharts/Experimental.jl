using Dash

include("../../../src/Experimental.jl")
include("../../../src/data.jl")

experimentalLayout = html_div([
    dcc_link("Experimental", href = "/Experimental")
])