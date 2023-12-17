using Dash

navbar = html_nav(
    id = "navbar",
    [
        html_a("STORMS.jl", href = "https://github.com/cecoeco/STORMS.jl"),
        html_ul([
            html_li(html_a("Home", href = "/Home")),
            html_li(html_a("Checklist", href = "/Checklist")),
            html_li([
                html_a("Flowcharts"),
                html_ul([
                    html_li(html_a("Observational", href = "/Observational")),
                    html_li(html_a("Experimental", href = "/Experimental"))
                ])
            ])
        ])
    ]
)