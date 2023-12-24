using Dash
using DashCoreComponents
using DashDaq
using DashHtmlComponents

include("../../../src/experimental.jl")

experimentalLayout = html_div(
    children=[
        html_div(html_h1("Experimental")),
        html_div(
            id = "setting-container-experimental",
            [
                html_div(
                    id = "Box-Color-picker-container-experimental",
                    [
                        html_div([
                            daq_colorpicker(
                                id = "Top-Box-Color-Picker-experimental",
                                label = "Top Box Color",
                                labelPosition = "top",
                                size = 150,
                                value = Dict("rgb" => (r = 255, g = 255, b = 255, a = 255)),
                            ),
                        ]),
                        html_div([
                            daq_colorpicker(
                                id = "Left-Box-Color-Picker-experimental",
                                label = "Left Boxes Color",
                                labelPosition = "top",
                                size = 150,
                                value = Dict("rgb" => (r = 255, g = 255, b = 255, a = 255)),
                            ),
                        ]),
                        html_div([
                            daq_colorpicker(
                                id = "Right-Box-Color-Picker-experimental",
                                label = "Right Boxes Color",
                                labelPosition = "top",
                                size = 150,
                                value = Dict("rgb" => (r = 255, g = 255, b = 255, a = 255)),
                            ),
                        ]),
                    ],
                ),
                html_div(
                    id = "text-setting-container-experimental",
                    [
                        html_div([
                            daq_colorpicker(
                                id = "Text-Color-Picker-experimental",
                                label = "Text Color",
                                labelPosition = "top",
                                size = 150,
                                value = Dict("rgb" => (r = 0, g = 0, b = 0, a = 255)),
                            ),
                        ]),
                        html_div([
                            dcc_slider(
                                min = 0,
                                max = 50,
                                step = nothing,
                                value = 15,
                                marks = nothing,
                            ),
                        ]),
                        html_div([
                            dcc_dropdown(
                                options = [
                                    (label = "", value = ""),
                                    (label = "", value = ""),
                                    (label = "", value = ""),
                                    (label = "", value = ""),
                                    (label = "", value = ""),
                                    (label = "", value = ""),
                                    (label = "", value = ""),
                                    (label = "", value = ""),
                                    (label = "", value = ""),
                                    (label = "", value = ""),
                                    (label = "", value = ""),
                                    (label = "", value = ""),
                                    (label = "", value = ""),
                                    (label = "", value = ""),
                                    (label = "", value = ""),
                                ],
                                placeholder = "Select a font",
                            ),
                        ]),
                    ],
                ),
                html_div(
                    id = "Arrow-Color-picker-container-experimental",
                    [
                        html_div([
                            daq_colorpicker(
                                id = "Arrow-Color-Picker-experimental",
                                label = "Arrow Color",
                                labelPosition = "top",
                                size = 150,
                                value = Dict("rgb" => (r = 0, g = 0, b = 0, a = 255)),
                            ),
                        ]),
                        html_div([
                            dcc_slider(
                                min = 0,
                                max = 8,
                                step = nothing,
                                value = 2,
                                marks = Dict(
                                    1 => Dict("label" => "1"),
                                    2 => Dict("label" => "2"),
                                    3 => Dict("label" => "3"),
                                    4 => Dict("label" => "4"),
                                    5 => Dict("label" => "5"),
                                    6 => Dict("label" => "6"),
                                    7 => Dict("label" => "7"),
                                    8 => Dict("label" => "8"),
                                ),
                            ),
                        ]),
                        html_div([
                            dcc_slider(
                                min = 0,
                                max = 10,
                                step = nothing,
                                value = 15,
                                marks = nothing,
                            ),
                        ]),
                    ],
                ),
            ],
        ),
        html_div(
            id = "inputs-container-experimental",
            [
                html_div(
                    dcc_input(
                        type = "number", 
                        placeholder = "expression of interest"
                    )
                ),
                html_div(
                    dcc_input(
                        type = "text", 
                        placeholder = "assessment for eligibility:"
                    )
                ),
                html_div(
                    dcc_input(
                        type = "number", 
                        placeholder = "assessment for eligibility:"
                    )
                ),
                html_div(
                    dcc_input(
                        type = "number", 
                        placeholder = "screened"
                    )
                ),
                html_div(
                    dcc_input(
                        type = "text", 
                        placeholder = "excluded:"
                    )
                ),
                html_div(
                    dcc_input(
                        type = "number", 
                        placeholder = "excluded:"
                    )
                ),
                html_div(
                    dcc_input(
                        type = "number", 
                        placeholder = "recruited and randomized"
                    )
                ),
                html_div(
                    dcc_input(
                        type = "number", 
                        placeholder = "group 1"
                    )
                ),
                html_div(
                    dcc_input(
                        type = "number", 
                        placeholder = "group 2"
                    )
                ),
                html_div(
                    dcc_input(
                        type = "text",
                        placeholder = "drop out:"
                    )
                ),
                html_div(
                    dcc_input(
                        type = "number", 
                        placeholder = "drop out:"
                    )
                ),
                html_div(
                    dcc_input(
                        type = "number", 
                        placeholder = "completed trial"
                    )
                ),
                html_div(
                    dcc_input(
                        type = "number", 
                        placeholder = "lack of sequencing"
                    )
                ),
                html_div(
                    dcc_input(
                        type = "number", 
                        placeholder = "low number of reads"
                    )
                ),
                html_div(
                    dcc_input(
                        type = "number", 
                        placeholder = "total samples included in the analysis"
                    )
                )
            ]
        ),
        html_div([dcc_graph(figure = experimental())]),
    ]
)
