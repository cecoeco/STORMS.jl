using Dash

include("../../../src/Checklist.jl")
include("../../../src/data.jl")

checklistLayout = html_div() do
    dcc_link("Checklist", href = "/Checklist"),
    html_div(id = "title box") do
        html_h1(id = "title") do
            "STORMS.jl: Strengthening The Organization and Reporting of Microbiome Studies"
        end
        html_p(id = "subtitle") do
            "Checklist"
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
end
