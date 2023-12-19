using Dash

include("../../../src/Observational.jl")
include("../../../src/data.jl")

observationalLayout = html_div([
    dcc_link("Observational", href = "/Observational")
])
