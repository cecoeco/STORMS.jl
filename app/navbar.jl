using Dash
using DashBootstrapComponents
using DashCoreComponents
using DashHtmlComponents

sidebar = dbc_nav(
    id="navbar",
    className="navbar",
    children=[
        html_div(
            className="nav-items-container",
            children=[
                html_ul(
                    className="nav-items",
                    children=[
                        html_li(id="STORMS.jl-nav", className="nav-item", children=dbc_navlink("STORMS.jl", href="https://github.com/cecoeco/STORMS.jl", active = "exact")),
                        html_li(id="Home-nav", className="nav-item", children=dbc_navlink("Home", href="/Home",  active = "exact")),
                        html_li(id="Checklist-nav", className="nav-item", children=dbc_navlink("Checklist", href="/Checklist",  active = "exact")),
                        html_li(id="Flowcharts-nav", className="nav-item dropdown", children=[
                            html_a("Flowcharts"),
                            html_ul(id="dropdown-menu", className="dropdown-menu", children=[
                                html_li(id="Observational-nav", className="dropdown-item", children=dbc_navlink("Observational", href="/Observational", active = "exact")),
                                html_li(id="Experimental-nav", className="dropdown-item", children=dbc_navlink("Experimental", href="/Experimental",  active = "exact"))
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
