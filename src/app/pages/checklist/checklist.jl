using Dash

include("../../../STORMS.jl/Checklist.jl")
include("../../../STORMS.jl/data.jl")
include("../../../app/footer.jl")

checklistLayout = html_div() do
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
    footer
end
