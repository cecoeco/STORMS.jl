using Dash

homeLayout = html_div() do
        html_div(id = "title box") do
            html_h1(id = "title") do
                "STORMS.jl: Strengthening The Organization and Reporting of Microbiome Studies"
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
