using Dash

include("../../../STORMS.jl/Experimental.jl")
include("../../../STORMS.jl/data.jl")

experimentalLayout = html_div() do
    dcc_link("Experimental", href = "/Experimental"),
    html_div(id = "title box") do
        html_h1(id = "title") do
            "STORMS.jl: Strengthening The Organization and Reporting of Microbiome Studies"
        end
        html_p(id = "subtitle") do
            "Experimental Sample Size Flowchart"
        end
    end
    html_div(id = "description box") do
        html_h2(id = "description title") do
            "description title"
        end
        html_p(id = "description") do
            "description"
        end
    end
    html_div(id = "settings box") do
        html_div(id = "box settings") do
            html_div(id = "topboxcolor") do
                dcc_input(
                    id = "topboxcolor dcc_input",
                    placeholder = "Enter a value...",
                    type = "text",
                    value = "",
                )
            end
            html_div(id = "leftboxcolor") do
                dcc_input(
                    id = "leftboxcolor dcc_input",
                    placeholder = "Enter a value...",
                    type = "text",
                    value = "",
                )
            end
            html_div(id = "rightboxcolor") do
                dcc_input(
                    id = "rightboxcolor dcc_input",
                    placeholder = "Enter a value...",
                    type = "text",
                    value = "",
                )
            end
        end
        html_div(id = "arrow settings") do
            html_div(id = "arrowheadshape") do
                dcc_dropdown(
                    id = "arrowheadshape dcc_dropdown",
                    options = [
                        (label = "", value = ""),
                        (label = "", value = ""),
                        (label = "", value = ""),
                    ],
                )
            end
            html_div(id = "arrowcolor") do
                dcc_input(
                    id = "arrowcolor dcc_input",
                    placeholder = "Enter a value...",
                    type = "text",
                    value = "",
                )
            end
            html_div(id = "arrowheadsize") do
                dcc_dropdown(
                    id = "arrowheadsize dcc_dropdown",
                    options = [
                        (label = "", value = ""),
                        (label = "", value = ""),
                        (label = "", value = ""),
                    ],
                )
            end
        end
        html_div(id = "text settings") do
            html_div(id = "textsize") do
                dcc_dropdown(
                    id = "textsize dcc_dropdown",
                    options = [
                        (label = "", value = ""),
                        (label = "", value = ""),
                        (label = "", value = ""),
                    ],
                )
            end
            html_div(id = "textfont") do
                dcc_dropdown(
                    id = "textfont dcc_dropdown",
                    options = [
                        (label = "", value = ""),
                        (label = "", value = ""),
                        (label = "", value = ""),
                    ],
                )
            end
            html_div(id = "textcolor") do
                dcc_input(
                    id = "textcolor dcc_input",
                    placeholder = "Enter a value...",
                    type = "text",
                    value = "",
                )
            end
        end
    end
    html_div(className = "") do
        html_div(className = "")
        dcc_graph(
            id = "observational flowchart", 
            figure = (
                observational(
                    #observational_data=obeservational_data
                )
            )
        ),
        html_div(className = "") do
            html_div(id = "Expression of interest number") do
                dcc_input(
                    id = "Expression of interest number dcc_input",
                    placeholder = "Enter a value...",
                    type = "text",
                    value = "",
                )
            end
            html_div(id = "Assessment for eligibility: variable") do
                dcc_input(
                    id = "Assessment for eligibility: variable dcc_input",
                    placeholder = "Enter a value...",
                    type = "text",
                    value = "",
                )
            end
            html_div(id = "Assessment for eligibility: number") do
                dcc_input(
                    id = "Assessment for eligibility: number dcc_input",
                    placeholder = "Enter a value...",
                    type = "text",
                    value = "",
                )
            end
            html_div(id = "Screened number") do
                dcc_input(
                    id = "Screened number dcc_input",
                    placeholder = "Enter a value...",
                    type = "text",
                    value = "",
                )
            end
            html_div(id = "Excluded: variable") do
                dcc_input(
                    id = "Excluded: variable dcc_input",
                    placeholder = "Enter a value...",
                    type = "text",
                    value = "",
                )
            end
            html_div(id = "Excluded: number") do
                dcc_input(
                    id = "Excluded: number dcc_input",
                    placeholder = "Enter a value...",
                    type = "text",
                    value = "",
                )
            end
            html_div(id = "Recruited number and randomized") do
                dcc_input(
                    id = "Recruited number dcc_input",
                    placeholder = "Enter a value...",
                    type = "text",
                    value = "",
                )
            end
            html_div(id = "Group 1") do
                dcc_input(
                    id = "Group 1 number",
                    placeholder = "Enter a value...",
                    type = "text",
                    value = "",
                )
            end
            html_div(id = "Group 2") do
                dcc_input(
                    id = "Group 2 number",
                    placeholder = "Enter a value...",
                    type = "text",
                    value = "",
                )
            end
            html_div(id = "Drop out: variable") do
                dcc_input(
                    id = "Drop out: variable dcc_input",
                    placeholder = "Enter a value...",
                    type = "text",
                    value = "",
                )
            end
            html_div(id = "Drop out: number") do
                dcc_input(
                    id = "Drop out: number dcc_input",
                    placeholder = "Enter a value...",
                    type = "text",
                    value = "",
                )
            end
            html_div(id = "Completed trial") do
                dcc_input(
                    id = "Completed trial dcc_input",
                    placeholder = "Enter a value...",
                    type = "text",
                    value = "",
                )
            end
            html_div(id = "Lack of sequencing number") do
                dcc_input(
                    id = "Lack of sequencing number dcc_input",
                    placeholder = "Enter a value...",
                    type = "text",
                    value = "",
                )
            end
            html_div(id = "Low number of reads number") do
                dcc_input(
                    id = "Low number of reads number dcc_input",
                    placeholder = "Enter a value...",
                    type = "text",
                    value = "",
                )
            end
            html_div(id = "Total samples included in the analysis number") do
                dcc_input(
                    id = "Total samples included in the analysis number dcc_input",
                    placeholder = "Enter a value...",
                    type = "text",
                    value = "",
                )
            end
        end
    end
    html_div(id = "save settings") do
        html_div() do
            dcc_radioitems(
                id = "download format", 
                options = [

                ],
                value = ""
            )
        end
        html_div() do
            html_button(
                id = " downloadbutton", 
                "download"
            )
        end
    end
end
