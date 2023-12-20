using Dash
using DashCoreComponents
using DashDaq
using DashHtmlComponents
using DashTable
using DataFrames
using CSV

checklistLayout = html_div(
    id = "checklistLayout",
    [
        dcc_link("Checklist", href = "/Checklist"),
        html_div(html_h1("Checklist")),
        html_div([
            dcc_upload(
                id = "Checklist-upload",
                children = html_div(["Drag and Drop or ", html_a("Select Files")]),
            ),
            dash_datatable(
                id = "Checklist-upload-container",
                export_format = "xlsx",
                export_headers = "display",
                merge_duplicate_headers = true,
            ),
            dcc_graph(id = "Checklist-upload-graph"),
        ])
    ]
)
