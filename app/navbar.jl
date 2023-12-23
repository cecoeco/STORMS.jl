using Dash
using DashCoreComponents
using DashHtmlComponents

navbar = html_nav(
    id="navbar",
    className="navbar",
    children=[
        html_div(
            className="nav-items-container",
            children=[
                html_ul(
                    className="nav-items",
                    children=[
                        html_li(id="STORMS.jl-nav", className="nav-item", children=html_a("STORMS.jl", href="https://github.com/cecoeco/STORMS.jl")),
                        html_li(id="Home-nav", className="nav-item", children=html_a("Home", href="/Home")),
                        html_li(id="Checklist-nav", className="nav-item", children=html_a("Checklist", href="/Checklist")),
                        html_li(id="Flowcharts-nav", className="nav-item dropdown", children=[
                            html_a("Flowcharts"),
                            html_ul(id="dropdown-menu", className="dropdown-menu", children=[
                                html_li(id="Observational-nav", className="dropdown-item", children=html_a("Observational", href="/Observational")),
                                html_li(id="Experimental-nav", className="dropdown-item", children=html_a("Experimental", href="/Experimental"))
                            ])
                        ]),
                        html_li(id="search-nav", className="nav-item search", children=[
                            html_form(id="search-form", className="search-form", children=[
                                dcc_input(id="search-input", className="search-input", type="search", placeholder="Search"),
                                html_button(html_i(id="search-submit", className="search-submit fa-solid fa-magnifying-glass"), type="submit")
                            ])
                        ])
                    ]
                )
            ]
        )
    ]
)
