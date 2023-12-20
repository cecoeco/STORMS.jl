using Dash

footer = html_footer(
    id = "footer",
    [
        html_img(
            src = "",
            alt = "github logo"
        ),
        html_small(
            [
                html_a(
                    "STORMS.jl: Strengthening The Organization and Reporting of Microbiome Studies",
                    href = "https://github.com/cecoeco/STORMS.jl",
                ),
                " © 2023 Ceco Elijah Maples"
            ]
        )
    ]
)
