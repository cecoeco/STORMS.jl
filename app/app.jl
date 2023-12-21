using Dash
using DashCoreComponents
using DashDaq
using DashHtmlComponents
using DashTable
using PlotlyJS
using DataFrames
using CSV
using XLSX
using Colors

include("navbar.jl")
include("footer.jl")
include("pages/home/Home.jl")
include("pages/checklist/Checklist.jl")
include("pages/flowcharts/Observational.jl")
include("pages/flowcharts/Experimental.jl")
include("pages/404.jl")

assets_folder = "/Users/cecomaples/Desktop/STORMS.jl/app/assets"

external_stylesheets = [
    "https://use.fontawesome.com/releases/v6.5.1/css/all.css",
    "https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200",
    "/Users/cecomaples/Desktop/STORMS.jl/app/assets/css/app.css"
]

app = dash(
    url_base_pathname = "/",
    assets_folder = assets_folder,
    external_stylesheets = external_stylesheets,
    suppress_callback_exceptions = true,
    prevent_initial_callbacks = true,
    meta_tags = [
        Dict("charset" => "utf-8"),
        Dict("name" => "viewport", "content" => "width=device-width, initial-scale=1.0"),
        Dict("name" => "description", "content" => "STORMS.jl: Strengthening The Organization and Reporting of Microbiome Studies"),
        Dict("name" => "keywords", "content" => "Microbiome, Microbiology, Biology, Medicine, Research"),
        Dict("name" => "author", "content" => "Ceco Elijah Maples")
    ]
)
app.title = "STORMS.jl: Strengthening The Organization and Reporting of Microbiome Studies"
app.layout = html_div(
    children = [
        dcc_location(id="url", refresh=false),
        navbar,
        homeLayout,
        checklistLayout,
        observationalLayout,
        experimentalLayout,
        footer
    ]
)
run_server(app, "0.0.0.0", debug=true) 

#= go to http://127.0.0.1:8050 =#
