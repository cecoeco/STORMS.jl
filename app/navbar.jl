using Dash
using DashHtmlComponents

navbar = html_nav(
    className="navbar",
    children=[
        html_a("STORMS.jl", href="https://github.com/cecoeco/STORMS.jl"),
        html_ul(
            children=[
                html_li(className="nav-item", children=html_a("Home", href="/Home")),
                html_li(className="nav-item", children=html_a("Checklist", href="/Checklist")),
                html_li(className="dropdown", children=[
                    html_a("Flowcharts"),
                    html_ul(className="dropdown-menu", children=[
                        html_li(className="dropdown-item", children=html_a("Observational", href="/Observational")),
                        html_li(className="dropdown-item", children=html_a("Experimental", href="/Experimental"))
                    ])
                ])
            ]
        )
    ]
)