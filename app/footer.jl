using Dash
using DashHtmlComponents

footer = html_footer(
    id = "footer",
    className = "footer",
    children = [
        html_img(src = "", alt = "github logo", className = "footer-logo"),
        html_small(
            className = "footer-text",
            children = [
                html_a(
                    "STORMS.jl: Strengthening The Organization and Reporting of Microbiome Studies",
                    href = "https://github.com/cecoeco/STORMS.jl",
                    className = "footer-link")," © 2023 Ceco Elijah Maples"
            ]
        )
    ]
)