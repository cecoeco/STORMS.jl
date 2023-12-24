using Dash
using DashCoreComponents
using DashDaq
using DashHtmlComponents
using DashTable
using DataFrames
using CSV

checklistLayout = html_div(
    children=[
        html_div(html_h1("Checklist")),
        html_div([
            dcc_upload(
                id = "Checklist-upload",
                children = html_div(["Drag and Drop or ", html_a("Select Files")]),
            ),
            dash_datatable(
                id = "Checklist-upload-container",
                export_format = "csv",
            ),
            dcc_graph(id = "Checklist-upload-graph"),
        ])
    ]
)
