using PlotlyJS
using Colors
using CSV
using DataFrames

const xMIN::Int64 = 0
const xMAX::Int64 = 800
const yMIN::Int64 = 0
const yMAX::Int64 = 800

const BOXWIDTH::Float64 = xMAX / 2.5
const height_for_boxes_with_1_line_of_text::Float64 = yMAX * 0.05
const height_for_boxes_with_2_lines_of_text::Float64 = height_for_boxes_with_1_line_of_text * 1.5
const height_for_boxes_with_3_lines_of_text::Float64 = height_for_boxes_with_1_line_of_text * 2

const x0_COLUMN1::Float64 = 40
const x0_COLUMN2::Float64 = x0_COLUMN1 + xMAX / 2

const y0_ROW1::Int64 = yMAX - 125
const y0_ROW2::Int64 = y0_ROW1 - 75
const y0_ROW3::Int64 = y0_ROW2 - 125
const y0_ROW4::Int64 = y0_ROW3 - 125
const y0_ROW5::Int64 = y0_ROW4 - 125
const y0_ROW6::Int64 = y0_ROW5 - 125
const y0_ROW7::Int64 = y0_ROW6 - 125

const SHIFT_TEXT_RIGHT_BY::Int64 = 8

const LINE1_TEXT_PADDING_BOTTOM_1LINED_BOX::Float64 = height_for_boxes_with_1_line_of_text * 0.50

const LINE1_TEXT_PADDING_BOTTOM_2LINED_BOX::Float64 = height_for_boxes_with_2_lines_of_text * 0.75
const LINE2_TEXT_PADDING_BOTTOM_2LINED_BOX::Float64 = height_for_boxes_with_2_lines_of_text * 0.25

const LINE1_TEXT_PADDING_BOTTOM_3LINED_BOX::Float64 = height_for_boxes_with_3_lines_of_text * 0.75
const LINE2_TEXT_PADDING_BOTTOM_3LINED_BOX::Float64 = height_for_boxes_with_3_lines_of_text * 0.50
const LINE3_TEXT_PADDING_BOTTOM_3LINED_BOX::Float64 = height_for_boxes_with_3_lines_of_text * 0.25


function experimental(
    experimental_data::AbstractString="docs/experimental.csv",
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

    data = CSV.read(experimental_data, DataFrame)

    box_origin = Dict(
        1 => (
            x=x0_COLUMN1,
            y=y0_ROW1
        ),
        2 => (
            x=x0_COLUMN1,
            y=y0_ROW2
        ),
        3 => (
            x=x0_COLUMN2,
            y=(y0_ROW2 + y0_ROW3) / 2
        ),
        4 => (
            x=x0_COLUMN1,
            y=y0_ROW3
        ),
        5 => (
            x=x0_COLUMN2,
            y=(y0_ROW3 + y0_ROW4) / 2
        ),
        6 => (
            x=x0_COLUMN1,
            y=y0_ROW4
        ),
        7 => (
            x=x0_COLUMN2,
            y=(y0_ROW4 + y0_ROW5) / 2
        ),
        8 => (
            x=x0_COLUMN1,
            y=y0_ROW5
        ),
        9 => (
            x=x0_COLUMN2,
            y=(y0_ROW5 + y0_ROW6) / 2.25
        ),
        10 => (
            x=x0_COLUMN1,
            y=y0_ROW6
        ),
        11 => (
            x=x0_COLUMN1,
            y=y0_ROW6
        ),
        12 => (
            x=x0_COLUMN1,
            y=y0_ROW6
        )
    )


    box_coordinates = Dict(
        1 => (
            x0=box_origin[1].x,
            y0=box_origin[1].y,
            x1=box_origin[1].x + (x0_COLUMN2 - x0_COLUMN1) + BOXWIDTH,
            y1=box_origin[1].y + height_for_boxes_with_1_line_of_text
        ),
        2 => (
            x0=box_origin[2].x,
            y0=box_origin[2].y,
            x1=box_origin[2].x + BOXWIDTH,
            y1=box_origin[2].y + height_for_boxes_with_2_lines_of_text
        ),
        3 => (
            x0=box_origin[3].x,
            y0=box_origin[3].y,
            x1=box_origin[3].x + BOXWIDTH,
            y1=box_origin[3].y + height_for_boxes_with_2_lines_of_text
        ),
        4 => (
            x0=box_origin[4].x,
            y0=box_origin[4].y,
            x1=box_origin[4].x + BOXWIDTH,
            y1=box_origin[4].y + height_for_boxes_with_2_lines_of_text
        ),
        5 => (
            x0=box_origin[5].x,
            y0=box_origin[5].y,
            x1=box_origin[5].x + BOXWIDTH,
            y1=box_origin[5].y + height_for_boxes_with_2_lines_of_text
        ),
        6 => (
            x0=box_origin[6].x,
            y0=box_origin[6].y,
            x1=box_origin[6].x + BOXWIDTH,
            y1=box_origin[6].y + height_for_boxes_with_2_lines_of_text
        ),
        7 => (
            x0=box_origin[7].x,
            y0=box_origin[7].y,
            x1=box_origin[7].x + BOXWIDTH,
            y1=box_origin[7].y + height_for_boxes_with_2_lines_of_text
        ),
        8 => (
            x0=box_origin[8].x,
            y0=box_origin[8].y,
            x1=box_origin[8].x + BOXWIDTH,
            y1=box_origin[8].y + height_for_boxes_with_2_lines_of_text
        ),
        9 => (
            x0=box_origin[9].x,
            y0=box_origin[9].y,
            x1=box_origin[9].x + BOXWIDTH,
            y1=box_origin[9].y + height_for_boxes_with_3_lines_of_text
        ),
        10 => (
            x0=box_origin[10].x,
            y0=box_origin[10].y,
            x1=box_origin[10].x + BOXWIDTH,
            y1=box_origin[10].y + height_for_boxes_with_2_lines_of_text
        ),
        11 => (
            x0=box_origin[10].x,
            y0=box_origin[10].y,
            x1=box_origin[10].x + BOXWIDTH,
            y1=box_origin[10].y + height_for_boxes_with_2_lines_of_text
        ),
        12 => (
            x0=box_origin[10].x,
            y0=box_origin[10].y,
            x1=box_origin[10].x + BOXWIDTH,
            y1=box_origin[10].y + height_for_boxes_with_2_lines_of_text
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
            else
                RGBA(0.0, 0.0, 0.0, 1.0)
            end,
            line=attr(
                color=if i == 1
                    "black"
                elseif i % 2 == 0
                    "black"
                elseif i % 2 != 0 && i != 1
                    "black"
                else
                    "black"
                end,
                width=1
            )
        )
        push!(boxes, box)
    end

    layout = Layout(
        xaxis=attr(
            range=[xMIN, xMAX],
            showgrid=false,
            ticks=false,
            showticklabels=false
        ),
        yaxis=attr(
            range=[yMIN, yMAX],
            showgrid=false,
            ticks=false,
            showticklabels=false
        ),
        width=xMAX,
        height=yMAX,
        margin=attr(t=0, r=0, b=0, l=0),
        plot_bgcolor=transparent_bg ? RGBA(0, 0, 0, 0) : RGBA(1, 1, 1, 1),
        shapes=boxes,
        #annotations=arrows
    )

    plot(#=text,=# layout)

end

experimental()