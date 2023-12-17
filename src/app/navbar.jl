using Dash
using DashBootstrapComponents

navbar = dbc_navbarsimple(
    id = "navbar",
    children = [
        dbc_navitem(dbc_navlink("Home", href = "/Home"), id = "Home page"),
        dbc_navitem(dbc_navlink("Checklist", href = "/Checklist"), id = "Checklist page"),
        dbc_dropdownmenu(
            children=[
                dbc_dbc_dropdownmenu("Flowcharts", header = True),
                dbc_dbc_dropdownmenu("Observational", href = "/Observational"),
                dbc_dbc_dropdownmenu("Experimental", href = "/Experimental"),
            ],
            nav=True,
            in_navbar=True,
            label = "Flowcharts",
        )
    ],
    brand = "STORMS.jl",
    brand_href = "#"
)