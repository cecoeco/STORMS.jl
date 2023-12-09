# src/STORMS.jl: Strengthening The Organization and Reporting of Microbiome Studies

using PlotlyJS, Colors, CSV, DataFrames

const xmin::Int64 = 0; const xmax::Int64 = 800

const ymin::Int64 = 0; const ymax::Int64 = 800

const boxwidth::Int64 = xmax * 0.25

const height_for_boxes_with_1_line_of_text::Int64 = ymax * 0.0625

const height_for_boxes_with_2_lines_of_text::Int64 = height_for_boxes_with_1_line_of_text * 1.5

const height_for_boxes_with_3_lines_of_text::Int64 = height_for_boxes_with_1_line_of_text * 2

function observational(
    observational_data::AbstractString="docs/observational.csv",
  
    transparent_bg::Bool=false,
  
    topboxcolor="blue",
  
    leftboxcolor="red",
  
    rightboxcolor="lightblue",
  
    fontsize::Number=12.5,
  
    font::AbstractString="Helvetica",
  
    fontcolor="black",
  
    arrowheadshape::AbstractString="automatic",
  
    arrowcolor="black",
  
    arrowheadsize::Number=12.5
    )

    data = CSV.read(observational_data, DataFrame)
    
    column_1 = 200; column_2 = 450

    row_1 = 700; row_2 = 625;row_3 = 500; row_4 = 375; row_5 = 250; row_6 = 125

    box_origin = Dict(
        1 => (x=column_1, 
              y=row_1
        ),
        2 => (x=column_1, 
              y=row_2
        ),
        3 => (x=column_2, 
              y=(row_2 + row_3) / 2
        ),
        4 => (x=column_1, 
              y=row_3
        ),
        5 => (x=column_2, 
              y=(row_3 + row_4) / 2
        ),
        6 => (x=column_1, 
              y=row_4
        ),
        7 => (x=column_2,
              y=(row_4 + row_5) / 2
        ),
        8 => (x=column_1, 
              y=row_5
        ),
        9 => (x=column_2, 
              y=(row_5 + row_6) / 2
        ),
       10 => (x=column_1, 
              y=row_6
        )
    )

    box_coordinates = Dict(
        1 => (
            x0=box_origin[1].x,
            y0=box_origin[1].y,
            x1=box_origin[1].x + (column_2 - column_1) + boxwidth,
            y1=box_origin[1].y - height_for_boxes_with_1_line_of_text
        ),
        2 => (
            x0=box_origin[2].x,
            y0=box_origin[2].y,
            x1=box_origin[2].x + boxwidth,
            y1=box_origin[2].y - height_for_boxes_with_2_lines_of_text
        ),
        3 => (
            x0=box_origin[3].x,
            y0=box_origin[3].y,
            x1=box_origin[3].x + boxwidth,
            y1=box_origin[3].y - height_for_boxes_with_2_lines_of_text
        ),
        4 =>  (
            x0=box_origin[4].x,
            y0=box_origin[4].y,
            x1=box_origin[4].x + boxwidth,
            y1=box_origin[4].y - height_for_boxes_with_2_lines_of_text
        ),
        5 => (
            x0=box_origin[5].x,
            y0=box_origin[5].y,
            x1=box_origin[5].x + boxwidth,
            y1=box_origin[5].y - height_for_boxes_with_2_lines_of_text
        ),
        6 => (
            x0=box_origin[6].x,
            y0=box_origin[6].y,
            x1=box_origin[6].x + boxwidth,
            y1=box_origin[6].y - height_for_boxes_with_2_lines_of_text
        ),
        7 => (
            x0=box_origin[7].x,
            y0=box_origin[7].y,
            x1=box_origin[7].x + boxwidth,
            y1=box_origin[7].y - height_for_boxes_with_2_lines_of_text
        ),
        8 => (
            x0=box_origin[8].x,
            y0=box_origin[8].y,
            x1=box_origin[8].x + boxwidth,
            y1=box_origin[8].y - height_for_boxes_with_2_lines_of_text
        ),
        9 => (
            x0=box_origin[9].x,
            y0=box_origin[9].y,
            x1=box_origin[9].x + boxwidth,
            y1=box_origin[9].y - height_for_boxes_with_3_lines_of_text
        ),
        10 => (
            x0=box_origin[10].x,
            y0=box_origin[10].y,
            x1=box_origin[10].x + boxwidth,
            y1=box_origin[10].y - height_for_boxes_with_2_lines_of_text
        )
    )

    boxes = []

    for i in 1:10

        fillcolor = 
            if i == 1
                topboxcolor
            elseif  i % 2 == 0
                leftboxcolor
            elseif i % 2 != 0 && i != 1
                rightboxcolor
            end

        outlinecolor = 
            if i == 1
                topboxcolor
            elseif  i % 2 == 0
                leftboxcolor
            elseif i % 2 != 0 && i != 1
                rightboxcolor
            end

        box = rect(
            x0=box_coordinates[i].x0, 
            y0=box_coordinates[i].y0,
            x1=box_coordinates[i].x1, 
            y1=box_coordinates[i].y1,
            fillcolor=fillcolor,
            line=attr(
                color=outlinecolor,
                width=1,
            )
        )
        push!(boxes, box)
    end

    arrow_coordinates = Dict(
        :two_to_three => (
            x0=box_origin[2].x + column_2 / 2,
            y0=box_origin[2].y - height_for_boxes_with_2_lines_of_text,
            x1=0,
            y1=0
        ),
        :two_to_four => (
            x0=box_origin[2].x + column_2 / 2,
            y0=0,
            x1=0,
            y1=0
        ),
        :four_to_five => (
            x0=box_origin[4].x + column_2 / 2,
            y0=0,
            x1=0,
            y1=0
        ), 
        :four_to_six => (
            x0=box_origin[4].x + column_2 / 2,
            y0=0,
            x1=0,
            y1=0
        ),
        :six_to_seven => (
            x0=box_origin[6].x + column_2 / 2,
            y0=0,
            x1=0,
            y1=0
        ), 
        :six_to_eight => (
            x0=box_origin[6].x + column_2 / 2,
            y0=0,
            x1=0,
            y1=0
        ),
        :eight_to_nine => (
            x0=box_origin[8].x + column_2 / 2,
            y0=0,
            x1=0,
            y1=0
        ),
        :eight_to_ten => (
            x0=box_origin[8].x + column_2 / 2,
            y0=0,
            x1=0,
            y1=0
        )
    )

    arrows = []
    for (arrow_name, coordinates) in arrow_coordinates
        arrow_trace = scatter(
            x=[coordinates.x0, coordinates.x1],
            y=[coordinates.y0, coordinates.y1],
            mode="lines",
            line=attr(
                width=2,
                color=arrowcolor,
                arrowhead=2,
                arrowsize=arrowheadsize,
            )
        )
        push!(arrows, arrow_trace)
    end

    #=
    text

    trace = scatter(
    x=[1.5, 4.5],
    y=[0.75, 0.75],
    text=["Unfilled Rectangle", "Filled Rectangle"],
    mode="text",
    )
    =#


    #=


    arrows


    =#

    layout = Layout(
        
        xaxis=attr(
            range=[xmin, xmax], 
            showgrid=false,
            ticks=false,
            showticklabels=false
        ),

        yaxis=attr(
            range=[ymin, ymax], 
            showgrid=false,
            ticks=false,
            showticklabels=false
        ),

        width=xmax,
        height=ymax,
        margin=attr(t=0, r=0, b=0, l=0),
        plot_bgcolor=transparent_bg ? RGBA(0, 0, 0, 0) : RGBA(1, 1, 1, 1),
        shapes = boxes,
        annotations=arrows
    )

    plot(layout #=, traces =#)

end

observational()

#=
function experimental(
    experimental_data::AbstractString="docs/experimental.csv",

    transparent_bg::Bool=false,

    #topboxcolor::Union{Nothing,AbstractString}=RGBA(0.0, 0.0, 0.0, 1.0),

    #firstcolumncolor::Union{Nothing,AbstractString} = RGBA(0.0, 0.0, 0.0, 1.0),

    #secondcolumncolor::Union{Nothing,AbstractString}=RGBA(0.0, 0.0, 0.0, 1.0),

    fontsize::Number=12.5,

    font::AbstractString="Helvetica",

    #fontcolor::Union{Nothing,AbstractString}=RGBA(0.0, 0.0, 0.0, 1.0),

    arrowheadshape::AbstractString="automatic",

    #arrowcolor::Union{Nothing,AbstractString}=RGBA(0.0, 0.0, 0.0, 1.0),

    arrowheadsize::Number=12.5
    )

    data = CSV.read(experimental_data, DataFrame)

    box_coordinates = [
        box01 = Dict(
            [
                x0 = 0,
                y0 = 0,
                x1 = 0,
                y1 = 0
            ]
        ),
        box02 = Dict(
            [
                x0 = 0,
                y0 = 0,
                x1 = 0,
                y1 = 0
            ]
        ),
        box03 = Dict(
            [
                x0 = 0,
                y0 = 0,
                x1 = 0,
                y1 = 0
            ]
        ),
        box04 = Dict(
            [
                x0 = 0,
                y0 = 0,
                x1 = 0,
                y1 = 0
            ]
        ),
        box05 = Dict(
            [
                x0 = 0,
                y0 = 0,
                x1 = 0,
                y1 = 0
            ]
        ),
        box06 = Dict(
            [
                x0 = 0,
                y0 = 0,
                x1 = 0,
                y1 = 0
            ]
        ),
        box07 = Dict(
            [
                x0 = 0,
                y0 = 0,
                x1 = 0,
                y1 = 0
            ]
        ),
        box08 = Dict(
            [
                x0 = 0,
                y0 = 0,
                x1 = 0,
                y1 = 0
            ]
        ),
        box09 = Dict(
            [
                x0 = 0,
                y0 = 0,
                x1 = 0,
                y1 = 0
            ]
        ),
        box10 = Dict(
            [
                x0 = 0,
                y0 = 0,
                x1 = 0,
                y1 = 0
            ]
        ),
        box11 = Dict(
            [
                x0 = 0,
                y0 = 0,
                x1 = 0,
                y1 = 0
            ]
        ),
        box12 = Dict(
            [
                x0 = 0,
                y0 = 0,
                x1 = 0,
                y1 = 0
            ]
        )
    ]


    if transparent_bg == true
        layout = Layout(
            plot_bgcolor="rgba(0,0,0,0)",
            
            paper_bgcolor="rgba(0,0,0,0)",
            
            xaxis_visible=false,
            
            yaxis_visible=false,
            
            xaxis_showgrid=false,
            
            yaxis_showgrid=false,
           
            xaxis_zeroline=false,
            
            yaxis_zeroline=false,
            
            width=xmax,
            
            height=ymax
        )
    else
        layout = Layout(
            xaxis_visible=false,
            
            yaxis_visible=false,
            
            xaxis_showgrid=false,
            
            yaxis_showgrid=false,
            
            xaxis_zeroline=false,
            
            yaxis_zeroline=false,
            
            width=xmax,
            
            height=ymax
        )

    end

end

experimental()
=#