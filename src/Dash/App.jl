# src/App.jl
using Dash

include("src/STORMS/STORMS.jl")
using .STORMS

app = dash(#=external_stylesheets=[".css"]=#)

app.layout = html_div() do
    html_h1("Hello Dash"),
    html_div("Dash: A web application framework for your data."),
    dcc_graph(
        id = "example-graph-1",
        figure = (
            checklist()
        )
    )
end

run_server(app, "0.0.0.0", debug=true)
