using Dash

include("../../../src/Checklist.jl")
include("../../../src/data.jl")

checklistLayout = html_div([
    dcc_link("Checklist", href = "/Checklist")
])
