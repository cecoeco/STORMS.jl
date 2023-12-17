using Dash
using DashBootstrapComponents

navbar = dbc_navbarsimple(
    id = "navbar",
    children = [
        dbc_navitem(dbc_navlink("Home", href = "/Home"), id = "Home page"),
        dbc_navitem(dbc_navlink("Checklist", href = "/Checklist"), id = "Checklist page"),
        dbc_dropdownmenu(
            children=[
                dbc_dropdownmenuitem("Flowcharts", header = true),
                dbc_dropdownmenuitem("Observational", href = "/Observational"),
                dbc_dropdownmenuitem("Experimental", href = "/Experimental"),
            ],
            nav=true,
            in_navbar=true,
            label = "Flowcharts",
        )
    ],
    brand = "STORMS.jl"
)