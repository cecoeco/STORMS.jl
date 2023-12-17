using Dash

include("../../../app/footer.jl")

homeLayout = html_div() do
    html_div(id = "title box") do
        html_h1(id = "title") do
            "STORMS.jl: Strengthening The Organization and Reporting of Microbiome Studies"
        end
    end
    footer
end
