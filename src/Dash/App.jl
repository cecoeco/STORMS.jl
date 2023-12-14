using Dash

include("../STORMS.jl/Observational.jl")
include("../STORMS.jl/Experimental.jl")
include("../STORMS.jl/Checklist.jl")

box_num_observational = [1, 2, 3, 4, 5, 6, 7, 8, 9, 9, 10
]
box_lab_observational = [
    "Observational",
    "Expression of interest",
    "Assessment for eligibility:",
    "Screened",
    "Excluded:",
    "Recruited",
    "Drop out:",
    "Data available for analysis",
    "Excluded:",
    "Excluded",
    "Total samples included in the analysis"
]
box_var_observational = [
    nothing,
    nothing,
    "xxxx",
    nothing,
    "xxxx",
    nothing,
    "xxxx",
    nothing,
    "Lack of sequencing",
    "Low number of reads",
    nothing
]
n_observational = [
    nothing,
    "xx",
    "xx",
    "xx",
    "xx",
    "xx",
    "xx",
    "xx",
    "xx",
    "xx",
    "xx"
]
obeservational_data = DataFrame(
    box_num=box_num_observational,
    box_lab=box_lab_observational, 
    box_var=box_var_observational, 
    n=n_observational
)
box_num_experimental = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11,11, 12
]
box_lab_experimental = [
    "Experimental",
    "Expression of interest",
    "Assessment for eligibility:",
    "Screened",
    "Excluded:",
    "Recruited and randomized",
    "Group 1",
    "Group 2",
    "Drop out:",
    "Completed trial",
    "Excluded:",
    "Excluded:",
    "Total samples included in the analysis"
]
box_var_experimental = [
    nothing,
    nothing,
    "xxxx",
    nothing,
    "xxxx",
    nothing,
    nothing,
    nothing,
    "xxxx",
    nothing,
    "Lack of sequencing",
    "Low number of reads",
    nothing
]
n_experimental = [
    nothing,
    "xx",
    "xx",
    "xx",
    "xx",
    "xx",
    "xx",
    "xx",
    "xx",
    "xx",
    "xx",
    "xx",
    "xx"
]
experimental_data = DataFrame(
    box_num=box_num_experimental,
    box_lab=box_lab_experimental,
    box_var=box_var_experimental,
    n=n_experimental
)

app = dash(
    external_stylesheets=["src/Dash/assets/styles.css"],
    
)
app.title = "STORMS.jl: Strengthening The Organization and Reporting of Microbiome Studies"
app.layout = html_div() do
    html_h1("Hello Dash"),
    html_div("Dash: A web application framework for your data."),
    dcc_graph(
        id = "checklist",
        figure = (
            checklist()
        )
    )
end

run_server(app, "0.0.0.0", debug=true) 

#= http://127.0.0.1:8050 =#
