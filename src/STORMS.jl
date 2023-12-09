# src/STORMS.jl: Strengthening The Organization and Reporting of Microbiome Studies

using PlotlyJS, Colors, CSV, DataFrames

const xmin::Int64 = 0; const xmax::Int64 = 800
const ymin::Int64 = 0; const ymax::Int64 = 800

const boxwidth::Int64 = xmax * 0.33
const height_for_boxes_with_1_line_of_text::Int64 = ymax * 0.05
const height_for_boxes_with_2_lines_of_text::Int64 = height_for_boxes_with_1_line_of_text * 1.5
const height_for_boxes_with_3_lines_of_text::Int64 = height_for_boxes_with_1_line_of_text * 2

const textleftmargin::Int64 = 6

const column_1::Int64 = 150
const column_2::Int64 = 500

const row_1::Int64 = 725
const row_2::Int64 = 625
const row_3::Int64 = 500
const row_4::Int64 = 375
const row_5::Int64 = 250
const row_6::Int64 = 125

function observational(
    observational_data::AbstractString="docs/observational.csv",
    transparent_bg::Bool=false,
    topboxcolor=RGBA(0.0, 0.0, 0.0, 1.0),
    leftboxcolor=RGBA(0.0, 0.0, 0.0, 1.0),
    rightboxcolor=RGBA(0.0, 0.0, 0.0, 1.0),
    textsize::Number=15,
    textfont::AbstractString="Helvetica",
    textcolor="black",
    arrowheadshape::Int64=2,
    arrowcolor="black",
    arrowheadsize::Number=1)

    data = CSV.read(observational_data, DataFrame)

    box_origin = Dict(
        1 => (x=column_1, y=row_1),
        2 => (x=column_1, y=row_2),
        3 => (x=column_2, y=(row_2 + row_3) / 2),
        4 => (x=column_1, y=row_3),
        5 => (x=column_2, y=(row_3 + row_4) / 2),
        6 => (x=column_1, y=row_4),
        7 => (x=column_2, y=(row_4 + row_5) / 2),
        8 => (x=column_1, y=row_5),
        9 => (x=column_2, y=(row_5 + row_6) / 2.25),
       10 => (x=column_1, y=row_6)
    )

    box_coordinates = Dict(
        1 => (
            x0=box_origin[1].x,
            y0=box_origin[1].y,
            x1=box_origin[1].x + (column_2 - column_1) + boxwidth,
            y1=box_origin[1].y + height_for_boxes_with_1_line_of_text
        ),
        2 => (
            x0=box_origin[2].x,
            y0=box_origin[2].y,
            x1=box_origin[2].x + boxwidth,
            y1=box_origin[2].y + height_for_boxes_with_2_lines_of_text
        ),
        3 => (
            x0=box_origin[3].x,
            y0=box_origin[3].y,
            x1=box_origin[3].x + boxwidth,
            y1=box_origin[3].y + height_for_boxes_with_2_lines_of_text
        ),
        4 =>  (
            x0=box_origin[4].x,
            y0=box_origin[4].y,
            x1=box_origin[4].x + boxwidth,
            y1=box_origin[4].y + height_for_boxes_with_2_lines_of_text
        ),
        5 => (
            x0=box_origin[5].x,
            y0=box_origin[5].y,
            x1=box_origin[5].x + boxwidth,
            y1=box_origin[5].y + height_for_boxes_with_2_lines_of_text
        ),
        6 => (
            x0=box_origin[6].x,
            y0=box_origin[6].y,
            x1=box_origin[6].x + boxwidth,
            y1=box_origin[6].y + height_for_boxes_with_2_lines_of_text
        ),
        7 => (
            x0=box_origin[7].x,
            y0=box_origin[7].y,
            x1=box_origin[7].x + boxwidth,
            y1=box_origin[7].y + height_for_boxes_with_2_lines_of_text
        ),
        8 => (
            x0=box_origin[8].x,
            y0=box_origin[8].y,
            x1=box_origin[8].x + boxwidth,
            y1=box_origin[8].y + height_for_boxes_with_2_lines_of_text
        ),
        9 => (
            x0=box_origin[9].x,
            y0=box_origin[9].y,
            x1=box_origin[9].x + boxwidth,
            y1=box_origin[9].y + height_for_boxes_with_3_lines_of_text
        ),
        10 => (
            x0=box_origin[10].x,
            y0=box_origin[10].y,
            x1=box_origin[10].x +boxwidth,
            y1=box_origin[10].y +height_for_boxes_with_2_lines_of_text
        )
    )

    boxes = []
    for i in 1:10
        box = rect(
            x0=box_coordinates[i].x0, 
            y0=box_coordinates[i].y0,
            x1=box_coordinates[i].x1, 
            y1=box_coordinates[i].y1,
            fillcolor=if i == 1
                topboxcolor
            elseif i % 2 == 0
                leftboxcolor
            elseif i % 2 != 0 && i != 1
                rightboxcolor
            end,
            line=attr(
                color=if i == 1
                    "black"
                elseif i % 2 == 0
                    "black"
                elseif i % 2 != 0 && i != 1
                    "black"
                end,
                width=1
            )
        )
        push!(boxes, box)
    end

    arrow_coordinates = Dict(
        :two_to_three => (
            x0=box_origin[2].x + boxwidth / 2,
            y0=box_origin[3].y + height_for_boxes_with_2_lines_of_text / 2,
            x1=box_origin[3].x,
            y1=box_origin[3].y + height_for_boxes_with_2_lines_of_text / 2
        ),
        :two_to_four => (
            x0=box_origin[2].x + boxwidth / 2,
            y0=box_origin[2].y,
            x1=box_origin[2].x + boxwidth / 2,
            y1=box_origin[4].y + height_for_boxes_with_2_lines_of_text
        ),
        :four_to_five => (
            x0=box_origin[4].x + boxwidth / 2,
            y0=box_origin[5].y + height_for_boxes_with_2_lines_of_text / 2,
            x1=box_origin[5].x,
            y1=box_origin[5].y + height_for_boxes_with_2_lines_of_text / 2
        ), 
        :four_to_six => (
            x0=box_origin[4].x + boxwidth / 2,
            y0=box_origin[4].y,
            x1=box_origin[4].x + boxwidth / 2,
            y1=box_origin[6].y + height_for_boxes_with_2_lines_of_text
        ),
        :six_to_seven => (
            x0=box_origin[6].x + boxwidth / 2,
            y0=box_origin[7].y + height_for_boxes_with_2_lines_of_text / 2,
            x1=box_origin[7].x,
            y1=box_origin[7].y + height_for_boxes_with_2_lines_of_text / 2
        ), 
        :six_to_eight => (
            x0=box_origin[6].x + boxwidth / 2,
            y0=box_origin[6].y,
            x1=box_origin[6].x + boxwidth / 2,
            y1=box_origin[8].y + height_for_boxes_with_2_lines_of_text
        ),
        :eight_to_nine => (
            x0=box_origin[8].x + boxwidth / 2,
            y0=box_origin[9].y + height_for_boxes_with_3_lines_of_text / 2,
            x1=box_origin[9].x,
            y1=box_origin[9].y + height_for_boxes_with_3_lines_of_text / 2
        ),
        :eight_to_ten => (
            x0=box_origin[8].x + boxwidth / 2,
            y0=box_origin[8].y,
            x1=box_origin[8].x + boxwidth / 2,
            y1=box_origin[10].y+ height_for_boxes_with_2_lines_of_text
        )
    )

    arrows = []
    for (arrow_name, coordinates) in arrow_coordinates
        arrow = attr(
            axref="x",
            ayref="y",
            ax=coordinates.x0,
            ay=coordinates.y0,
            xref="x",
            yref="y",
            x=coordinates.x1,
            y=coordinates.y1,
            showarrow=true,
            arrowwidth=2,
            arrowside="end",
            hovertext=arrow_name,
            arrowhead=arrowheadshape,
            arrowcolor=arrowcolor,
            arrowsize=arrowheadsize,
        )
        push!(arrows, arrow)
    end

    text_data = Dict(
        :box1_line1 => (
            "$(data[1, :box_lab])"
        ),
        :box2_line1 => (
            "$(data[2, :box_lab])"
        ),
        :box2_line2 => (
            "n = $(data[2, :n])"
        ),
        :box3_line1 => (
            "$(data[3, :box_lab])"
        ),
        :box3_line2 => (
            "$(data[3, :box_var]) n = $(data[3, :n])"
        ),
        :box4_line1 => (
            "$(data[4, :box_lab])"
        ),
        :box4_line2 => (
            "n = $(data[4, :n])"
        ),
        :box5_line1 => (
            "$(data[5, :box_lab])"
        ),
        :box5_line2 => (
            "$(data[5, :box_var]) n = $(data[5, :n])"
        ),
        :box6_line1 => (
            "$(data[6, :box_lab])"
        ),
        :box6_line2 => (
            "n = $(data[6, :n])"
        ),
        :box7_line1 => (
            "$(data[7, :box_lab])"
        ),
        :box7_line2 => (
            "$(data[7, :box_var]) n = $(data[7, :n])"
        ),
        :box8_line1 => (
            "$(data[8, :box_lab])"
        ),
        :box8_line2 => (
            "n = $(data[8, :n])"
        ),
        :box9_line1 => (
            "$(data[9, :box_lab])"
        ),
        :box9_line2 => (
            "$(data[9, :box_var]) n = $(data[9, :n])"
        ),
        :box9_line3 => (
            "$(data[10, :box_var]) n = $(data[10, :n])"
        ),
        :box10_line1 => (
            "$(data[11, :box_lab])"
        ),
        :box10_line2 => (
            "n = $(data[11, :n])"
        )
    )
    
    text_coordinates = Dict(
        :box1_line1 => (
            x=box_origin[1].x + textleftmargin,
            y=box_origin[1].y + height_for_boxes_with_1_line_of_text / 2
        ),
        :box2_line1 => (
            x=box_origin[2].x + textleftmargin,
            y=box_origin[2].y + height_for_boxes_with_2_lines_of_text * 0.75
        ),
        :box2_line2 => (
            x=box_origin[2].x + textleftmargin,
            y=box_origin[2].y + height_for_boxes_with_2_lines_of_text * 0.25
        ),
        :box3_line1 => (
            x=box_origin[3].x + textleftmargin,
            y=box_origin[3].y + height_for_boxes_with_2_lines_of_text * 0.75
        ),
        :box3_line2 => (
            x=box_origin[3].x + textleftmargin,
            y=box_origin[3].y + height_for_boxes_with_2_lines_of_text * 0.25
        ),
        :box4_line1 => (
            x=box_origin[4].x + textleftmargin,
            y=box_origin[4].y + height_for_boxes_with_2_lines_of_text * 0.75
        ),
        :box4_line2 => (
            x=box_origin[4].x + textleftmargin,
            y=box_origin[4].y + height_for_boxes_with_2_lines_of_text * 0.25
        ),
        :box5_line1 => (
            x=box_origin[5].x + textleftmargin,
            y=box_origin[5].y + height_for_boxes_with_2_lines_of_text * 0.75
        ),
        :box5_line2 => (
            x=box_origin[5].x + textleftmargin,
            y=box_origin[5].y + height_for_boxes_with_2_lines_of_text * 0.25
        ),
        :box6_line1 => (
            x=box_origin[6].x + textleftmargin,
            y=box_origin[6].y + height_for_boxes_with_2_lines_of_text * 0.75
        ),
        :box6_line2 => (
            x=box_origin[6].x + textleftmargin,
            y=box_origin[6].y + height_for_boxes_with_2_lines_of_text * 0.25
        ),
        :box7_line1 => (
            x=box_origin[7].x + textleftmargin,
            y=box_origin[7].y + height_for_boxes_with_2_lines_of_text * 0.75
        ),
        :box7_line2 => (
            x=box_origin[7].x + textleftmargin,
            y=box_origin[7].y + height_for_boxes_with_2_lines_of_text * 0.25
        ),
        :box8_line1 => (
            x=box_origin[8].x + textleftmargin,
            y=box_origin[8].y + height_for_boxes_with_2_lines_of_text * 0.75
        ),
        :box8_line2 => (
            x=box_origin[8].x + textleftmargin,
            y=box_origin[8].y + height_for_boxes_with_2_lines_of_text * 0.25
        ),
        :box9_line1 => (
            x=box_origin[9].x + textleftmargin,
            y=box_origin[9].y + height_for_boxes_with_3_lines_of_text * 0.75
        ),
        :box9_line2 => (
            x=box_origin[9].x + textleftmargin,
            y=box_origin[9].y + height_for_boxes_with_3_lines_of_text * 0.50
        ),
        :box9_line3 => (
            x=box_origin[9].x + textleftmargin,
            y=box_origin[9].y + height_for_boxes_with_3_lines_of_text * 0.25
        ),
        :box10_line1 => (
            x=box_origin[10].x +textleftmargin,
            y=box_origin[10].y +height_for_boxes_with_2_lines_of_text * 0.75
        ),
        :box10_line2 => (
            x=box_origin[10].x +textleftmargin,
            y=box_origin[10].y +height_for_boxes_with_2_lines_of_text * 0.25
        )
    )

    text = scatter(
        x=[text_coordinates[key].x for key in keys(text_coordinates)],
        y=[text_coordinates[key].y for key in keys(text_coordinates)],
        text=[text_data[key] for key in keys(text_data)],
        mode="text",
        textposition="right center",    
        textfont=attr(
            family=textfont,
            size=textsize,
            color=textcolor
        )
    )

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
        shapes=boxes,
        annotations=arrows
    )

    plot(text,layout)

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