using Dash

include("navbar.jl")
include("pages/home/Home.jl")
include("pages/checklist/Checklist.jl")
include("pages/flowcharts/Observational.jl")
include("pages/flowcharts/Experimental.jl")
include("footer.jl")
include("../../../STORMS.jl")

app = dash(
    url_base_pathname="/",
    assets_folder="/../../../STORMS.jl/src/app/assets",
    external_scripts=["/../../../app/assets/script.js"],
    external_stylesheets=["/../../../app/assets/styles.css"],
    suppress_callback_exceptions=true,
    prevent_initial_callbacks=true,
    meta_tags=[
        Dict(
            "charset" => "utf-8"
        ),
        Dict(
            "name" => "viewport",
            "content" => "width=device-width, initial-scale=1.0",
        ),
        Dict(
            "name" => "description", 
            "content" => "STORMS.jl: Strengthening The Organization and Reporting of Microbiome Studies"
        ),
        Dict(
            "name" => "keywords",
            "content" => "Microbiome, Microbiology, Biology, Medicine, Research"
        ),
        Dict(
            "name" => "author",
            "content" => "Ceco Elijah Maples"
        )
    ]
)
app.title = "STORMS.jl: Strengthening The Organization and Reporting of Microbiome Studies"
app.layout = html_div() do
    navbar,
    dcc_graph(
        id="graph", 
        figure=fig
    ),
    footer
end
run_server(app, "0.0.0.0", debug=true) 

#= go to http://127.0.0.1:8050 =#
