using Dash

app = dash(
    assets_folder="/../../../STORMS.jl/src/app/assets",
    external_scripts=["/../../../app/assets/script.js"],
    external_stylesheets=["/../../../app/assets/styles.css"],
    suppress_callback_exceptions=true,
    prevent_initial_callbacks=true

)
app.title = "STORMS.jl: Strengthening The Organization and Reporting of Microbiome Studies"
app.layout = html_div()

run_server(
    app, 
    "0.0.0.0", 
    debug=true
) 

#= go to http://127.0.0.1:8050 =#
