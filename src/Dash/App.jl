using Dash
using DataFrames
using CSV
using Colors
using PlotlyJS

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
app = dash(
    external_stylesheets=["src/Dash/assets/styles.css"],
    
)
app.title = "STORMS.jl: Strengthening The Organization and Reporting of Microbiome Studies"
app.layout = html_div() do
    html_div(
        id="title",
        html_h1(
            id="title",
            "STORMS.jl: Strengthening The Organization and Reporting of Microbiome Studies"
        )
    ),
    html_div(
        id="description",
        html_h2(
            id="description",
        )
        html_p(
            id="description",
        )
    ),
    html_div(
        id="settings",
        html_div(
            id="box settings",
            html_div(
                id="topboxcolor",
                dcc_input(
                    id="topboxcolor",
                    placeholder="Enter a value...",
                    type="text",
                    value=""
                )
            )
            html_div(
                id="leftboxcolor",
                dcc_input(
                    id="leftboxcolor",
                    placeholder="Enter a value...",
                    type="text",
                    value=""
                )
            )
            html_div(
                id="rightboxcolor",
                dcc_input(
                    id="rightboxcolor",
                    placeholder="Enter a value...",
                    type="text",
                    value=""
                )
            )
        )
        html_div(
            id="arrow settings",
            html_div(
                id="arrowheadshape",
                dcc_dropdown(
                    id="arrowheadshape",
                    options = [
                        (label = "", value = ""),
                        (label = "", value = ""),
                        (label = "", value = "")
                    ]
                )
            )
            html_div(
                id="arrowcolor",
                dcc_input(
                    id="arrowcolor",
                    placeholder="Enter a value...",
                    type="text",
                    value=""
                )
            )
            html_div(
                id="arrowheadsize",
                    dcc_dropdown(
                    id="arrowheadsize",
                    options = [
                        (label = "", value = ""),
                        (label = "", value = ""),
                        (label = "", value = "")
                    ]
                )
            )
        )
        html_div(
            id="text settings",
            html_div(
                id="textsize",
                dcc_dropdown(
                    id="textsize",
                    options=[
                        (label="", value=""),
                        (label="", value=""),
                        (label="", value="")
                    ]
                )
            )
            html_div(
                id="textfont",
                dcc_dropdown(
                    id="textfont",
                    options=[
                        (label="", value=""),
                        (label="", value=""),
                        (label="", value="")
                    ]
                )
            )
            html_div(
                id="textcolor".
                dcc_input(
                    id="textcolor",
                    placeholder="Enter a value...",
                    type="text",
                    value=""
                )
            )
        )
    ),
    html_div(
        id="save settings",
        html_div(
            dcc_radioitems(
                id="download format",
                options=[
                    
                ],
                value=""
            )
        )
        html_div(
            html_button(
                id="button",
                "download"
            )
        )
    ),
    html_div(className="") do 
        html_div(className="")
        dcc_graph(
            id = "observational",
            figure = (
                observational(
                    #observational_data=obeservational_data
                )
            )
        ),
        html_div(className="") do 
            html_div(
                id="Expression of interest number",
                dcc_input(
                    id="Expression of interest number",
                    placeholder="Enter a value...",
                    type="text",
                    value=""
                )
            ),
            html_div(
                id="Assessment for eligibility: variable",
                dcc_input(
                    id="Assessment for eligibility: variable",
                    placeholder="Enter a value...",
                    type="text",
                    value=""
                )
            ),
            html_div(
                id="Assessment for eligibility: number",
                dcc_input(
                    id="Assessment for eligibility: number",
                    placeholder="Enter a value...",
                    type="text",
                    value=""
                )
            ),
            html_div(
                id="Screened number",
                dcc_input(
                    id="Screened number",
                    placeholder="Enter a value...",
                    type="text",
                    value=""
                )
            ),
            html_div(
                id="Excluded: variable",   
                dcc_input(
                    id="Excluded: variable",
                    placeholder="Enter a value...",
                    type="text",
                    value=""
                )
            ),
            html_div(
                id="Excluded: number",
                dcc_input(
                    id="Excluded: number",
                    placeholder="Enter a value...",
                    type="text",
                    value=""
                )
            ),
            html_div(
                id="Recruited number",
                dcc_input(
                    id="Recruited number",
                    placeholder="Enter a value...",
                    type="text",
                    value=""
                )
            ),
            html_div(
                id="Drop out: variable",
                dcc_input(
                    id="Drop out: variable",
                    placeholder="Enter a value...",
                    type="text",
                    value=""
                )
            ),
            html_div(
                id="Drop out: number",
                dcc_input(
                    id="Drop out: number",
                    placeholder="Enter a value...",
                    type="text",
                    value=""
                )
            ),
            html_div(
                id="Data available for analysis number",
                dcc_input(
                    id="Data available for analysis number",
                    placeholder="Enter a value...",
                    type="text",
                    value=""
                )
            ),
            html_div(
                id="Lack of sequencing number",
                dcc_input(
                    id="Lack of sequencing number",
                    placeholder="Enter a value...",
                    type="text",
                    value=""
                )
            ),
            html_div(
                id="Low number of reads number",
                dcc_input(
                    id="Low number of reads number",
                    placeholder="Enter a value...",
                    type="text",
                    value=""
                )
            ),
            html_div(
                id="Total samples included in the analysis number",
                dcc_input(
                    id="Total samples included in the analysis number",
                    placeholder="Enter a value...",
                    type="text",
                    value=""
                )
            )
        end
    end
end

run_server(app, "0.0.0.0", debug=true) 

#= http://127.0.0.1:8050 =#
