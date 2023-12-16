using Dash

include("../../../STORMS.jl/Checklist.jl")
include("../../../STORMS.jl/data.jl")

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
    html_div(id = "footer") do
        html_div() do
            html_a(
                id = "github link",
                "STORMS.jl: Strengthening The Organization and Reporting of Microbiome Studies © 2023 Ceco Elijah Maples",
                href = "https://github.com/cecoeco/STORMS.jl",
            )
        end
    end
end
