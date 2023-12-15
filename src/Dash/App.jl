using Dash

include("../STORMS.jl/Observational.jl")
include("../Dash/data.jl")

app = dash(
    external_stylesheets=["src/Dash/assets/styles.css"]
)
app.title = "STORMS.jl: Strengthening The Organization and Reporting of Microbiome Studies"
app.layout = html_div() do
    html_div(id="title box") do
        html_h1(id="title") do
            "STORMS.jl: Strengthening The Organization and Reporting of Microbiome Studies"
        end
        html_p(id="subtitle") do
            "Observational Sample Size Flowchart"
        end
    end
    html_div(id="description box") do
        html_h2(id="description title") do
            "description title"
        end
        html_p(id="description") do
            "description"
        end
    end
    html_div(id="settings box") do
        html_div(id="box settings") do
            html_div(id="topboxcolor") do
                dcc_input(
                    id="topboxcolor",
                    placeholder="Enter a value...",
                    type="text",
                    value=""
                )
            end
            html_div(id="leftboxcolor") do
                dcc_input(
                    id="leftboxcolor",
                    placeholder="Enter a value...",
                    type="text",
                    value=""
                )
            end
            html_div(id="rightboxcolor") do
                dcc_input(
                    id="rightboxcolor",
                    placeholder="Enter a value...",
                    type="text",
                    value=""
                )
            end
        end
        html_div(id="arrow settings") do
            html_div(id="arrowheadshape") do
                dcc_dropdown(
                    id="arrowheadshape",
                    options = [
                        (label = "", value = ""),
                        (label = "", value = ""),
                        (label = "", value = "")
                    ]
                )
            end
            html_div(id="arrowcolor") do
                dcc_input(
                    id="arrowcolor",
                    placeholder="Enter a value...",
                    type="text",
                    value=""
                )
            end
            html_div(id="arrowheadsize") do
                    dcc_dropdown(
                    id="arrowheadsize",
                    options = [
                        (label = "", value = ""),
                        (label = "", value = ""),
                        (label = "", value = "")
                    ]
                )
            end
        end
        html_div(id="text settings") do
            html_div(id="textsize") do
                dcc_dropdown(
                    id="textsize",
                    options=[
                        (label="", value=""),
                        (label="", value=""),
                        (label="", value="")
                    ]
                )
            end
            html_div(id="textfont") do
                dcc_dropdown(
                    id="textfont",
                    options=[
                        (label="", value=""),
                        (label="", value=""),
                        (label="", value="")
                    ]
                )
            end
            html_div(id="textcolor") do
                dcc_input(
                    id="textcolor",
                    placeholder="Enter a value...",
                    type="text",
                    value=""
                )
            end
        end
    end
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
            html_div(id="Expression of interest number") do
                dcc_input(
                    id="Expression of interest number",
                    placeholder="Enter a value...",
                    type="text",
                    value=""
                )
            end
            html_div(id="Assessment for eligibility: variable") do
                dcc_input(
                    id="Assessment for eligibility: variable",
                    placeholder="Enter a value...",
                    type="text",
                    value=""
                )
            end
            html_div(id="Assessment for eligibility: number") do
                dcc_input(
                    id="Assessment for eligibility: number",
                    placeholder="Enter a value...",
                    type="text",
                    value=""
                )
            end
            html_div(id="Screened number") do
                dcc_input(
                    id="Screened number",
                    placeholder="Enter a value...",
                    type="text",
                    value=""
                )
            end
            html_div(id="Excluded: variable") do  
                dcc_input(
                    id="Excluded: variable",
                    placeholder="Enter a value...",
                    type="text",
                    value=""
                )
            end
            html_div(id="Excluded: number") do
                dcc_input(
                    id="Excluded: number",
                    placeholder="Enter a value...",
                    type="text",
                    value=""
                )
            end
            html_div(id="Recruited number") do
                dcc_input(
                    id="Recruited number",
                    placeholder="Enter a value...",
                    type="text",
                    value=""
                )
            end
            html_div(id="Drop out: variable") do
                dcc_input(
                    id="Drop out: variable",
                    placeholder="Enter a value...",
                    type="text",
                    value=""
                )
            end
            html_div(id="Drop out: number") do
                dcc_input(
                    id="Drop out: number",
                    placeholder="Enter a value...",
                    type="text",
                    value=""
                )
            end
            html_div(id="Data available for analysis number") do
                dcc_input(
                    id="Data available for analysis number",
                    placeholder="Enter a value...",
                    type="text",
                    value=""
                )
            end
            html_div(id="Lack of sequencing number") do
                dcc_input(
                    id="Lack of sequencing number",
                    placeholder="Enter a value...",
                    type="text",
                    value=""
                )
            end
            html_div(id="Low number of reads number") do
                dcc_input(
                    id="Low number of reads number",
                    placeholder="Enter a value...",
                    type="text",
                    value=""
                )
            end
            html_div(id="Total samples included in the analysis number") do
                dcc_input(
                    id="Total samples included in the analysis number",
                    placeholder="Enter a value...",
                    type="text",
                    value=""
                )
            end
        end
    end
    html_div(id="save settings") do
        html_div() do
            dcc_radioitems(
                id="download format",
                options=[
                ],
                value=""
            )
        end
        html_div() do
            html_button(
                id="button",
                "download"
            )
        end
    end
    html_div(id="footer") do
        html_div() do
            html_a(
                id="github link",
                "STORMS.jl: Strengthening The Organization and Reporting of Microbiome Studies © 2023 Ceco Elijah Maples",
                href="https://github.com/cecoeco/STORMS.jl"

            )
        end
    end
end

run_server(
    app, 
    "0.0.0.0", 
    debug=true
) 

#= go to http://127.0.0.1:8050 =#
