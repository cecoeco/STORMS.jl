using PlotlyJS
using Colors
using CSV
using DataFrames

const xMINIMUM_EXPERIMENTAL::Int64 = 0
const xMAXIMUM_EXPERIMENTAL::Int64 = 800

const yMINIMUM_EXPERIMENTAL::Int64 = 0
const yMAXIMUM_EXPERIMENTAL::Int64 = 800

const BOXWIDTH_EXPERIMENTAL::Float64 = xMAXIMUM_EXPERIMENTAL / 2.5

const x0_COLUMN1_EXPERIMENTAL::Float64 = 40
const x0_COLUMN2_EXPERIMENTAL::Float64 = x0_COLUMN1_EXPERIMENTAL + xMAXIMUM_EXPERIMENTAL / 2

const HEIGHT_FOR_BOXES_WITH_1_LINE_OF_TEXT_EXPERIMENTAL::Float64 = yMAXIMUM_EXPERIMENTAL * 0.05
const HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_EXPERIMENTAL::Float64 = HEIGHT_FOR_BOXES_WITH_1_LINE_OF_TEXT_EXPERIMENTAL * 1.5
const HEIGHT_FOR_BOXES_WITH_3_LINES_OF_TEXT_EXPERIMENTAL::Float64 = HEIGHT_FOR_BOXES_WITH_1_LINE_OF_TEXT_EXPERIMENTAL * 2

const BOXES_SEVEN_AND_EIGHT_WIDTH_EXPERIMENTAL::Float64 = BOXWIDTH_EXPERIMENTAL / 2.5
const BOXES_SEVEN_AND_EIGHT_HEIGHT_EXPERIMENTAL::Float64 = HEIGHT_FOR_BOXES_WITH_1_LINE_OF_TEXT_EXPERIMENTAL
const BOXES_SEVEN_AND_EIGHT_TEXT_PADDING_BOTTOM_EXPERIMENTAL::Float64 = HEIGHT_FOR_BOXES_WITH_1_LINE_OF_TEXT_EXPERIMENTAL * 0.50

const y0_ROW1_EXPERIMENTAL::Int64 = yMAXIMUM_EXPERIMENTAL - 75
const y0_ROW2_EXPERIMENTAL::Int64 = y0_ROW1_EXPERIMENTAL - 75
const y0_ROW3_EXPERIMENTAL::Int64 = y0_ROW2_EXPERIMENTAL - 125
const y0_ROW4_EXPERIMENTAL::Int64 = y0_ROW3_EXPERIMENTAL - 125
const y0_ROW5_EXPERIMENTAL::Int64 = y0_ROW4_EXPERIMENTAL - 125 * 0.8
const y0_ROW6_EXPERIMENTAL::Int64 = y0_ROW5_EXPERIMENTAL - 125
const y0_ROW7_EXPERIMENTAL::Int64 = y0_ROW6_EXPERIMENTAL - 125

const SHIFT_TEXT_RIGHT_BY_A_NUMBER_EXPERIMENTAL::Int64 = 8

const LINE1_TEXT_PADDING_BOTTOM_1LINED_BOX_EXPERIMENTAL::Float64 = HEIGHT_FOR_BOXES_WITH_1_LINE_OF_TEXT_EXPERIMENTAL * 0.50

const LINE1_TEXT_PADDING_BOTTOM_2LINED_BOX_EXPERIMENTAL::Float64 = HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_EXPERIMENTAL * 0.66
const LINE2_TEXT_PADDING_BOTTOM_2LINED_BOX_EXPERIMENTAL::Float64 = HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_EXPERIMENTAL * 0.33

const LINE1_TEXT_PADDING_BOTTOM_3LINED_BOX_EXPERIMENTAL::Float64 = HEIGHT_FOR_BOXES_WITH_3_LINES_OF_TEXT_EXPERIMENTAL * 0.75
const LINE2_TEXT_PADDING_BOTTOM_3LINED_BOX_EXPERIMENTAL::Float64 = HEIGHT_FOR_BOXES_WITH_3_LINES_OF_TEXT_EXPERIMENTAL * 0.50
const LINE3_TEXT_PADDING_BOTTOM_3LINED_BOX_EXPERIMENTAL::Float64 = HEIGHT_FOR_BOXES_WITH_3_LINES_OF_TEXT_EXPERIMENTAL * 0.25

function experimental(
    experimental_data="docs/experimental_data.csv",
    transparent_bg::Bool=false,
    topboxcolor="white",
    leftboxcolor="white",
    rightboxcolor="white",
    textsize::Number=15,
    textfont::AbstractString="Helvetica",
    textcolor="black",
    arrowheadshape::Int64=2,
    arrowcolor="black",
    arrowheadsize::Number=1
)

    data = CSV.read(experimental_data, DataFrame)

    box_origin = Dict(
        1 => (
            x=x0_COLUMN1_EXPERIMENTAL,
            y=y0_ROW1_EXPERIMENTAL
        ),
        2 => (
            x=x0_COLUMN1_EXPERIMENTAL,
            y=y0_ROW2_EXPERIMENTAL
        ),
        3 => (
            x=x0_COLUMN2_EXPERIMENTAL,
            y=(y0_ROW2_EXPERIMENTAL + y0_ROW3_EXPERIMENTAL) / 2
        ),
        4 => (
            x=x0_COLUMN1_EXPERIMENTAL,
            y=y0_ROW3_EXPERIMENTAL
        ),
        5 => (
            x=x0_COLUMN2_EXPERIMENTAL,
            y=(y0_ROW3_EXPERIMENTAL + y0_ROW4_EXPERIMENTAL) / 2
        ),
        6 => (
            x=x0_COLUMN1_EXPERIMENTAL,
            y=y0_ROW4_EXPERIMENTAL
        ),
        7 => (
            x=x0_COLUMN1_EXPERIMENTAL,
            y=y0_ROW5_EXPERIMENTAL
        ),
        8 => (
            x=x0_COLUMN1_EXPERIMENTAL + BOXWIDTH_EXPERIMENTAL - BOXES_SEVEN_AND_EIGHT_WIDTH_EXPERIMENTAL,
            y=y0_ROW5_EXPERIMENTAL
        ),
        9 => (
            x=x0_COLUMN2_EXPERIMENTAL,
            y=(y0_ROW5_EXPERIMENTAL + y0_ROW6_EXPERIMENTAL) / 2
        ),
        10 => (
            x=x0_COLUMN1_EXPERIMENTAL,
            y=y0_ROW6_EXPERIMENTAL
        ),
        11 => (
            x=x0_COLUMN2_EXPERIMENTAL,
            y=(y0_ROW6_EXPERIMENTAL + y0_ROW7_EXPERIMENTAL) / 2.25
        ),
        12 => (
            x=x0_COLUMN1_EXPERIMENTAL,
            y=y0_ROW7_EXPERIMENTAL
        )
    )

    box_coordinates = Dict(
        1 => (
            x0=box_origin[1].x,
            y0=box_origin[1].y,
            x1=box_origin[1].x + (x0_COLUMN2_EXPERIMENTAL - x0_COLUMN1_EXPERIMENTAL) + BOXWIDTH_EXPERIMENTAL,
            y1=box_origin[1].y + HEIGHT_FOR_BOXES_WITH_1_LINE_OF_TEXT_EXPERIMENTAL
        ),
        2 => (
            x0=box_origin[2].x,
            y0=box_origin[2].y,
            x1=box_origin[2].x + BOXWIDTH_EXPERIMENTAL,
            y1=box_origin[2].y + HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_EXPERIMENTAL
        ),
        3 => (
            x0=box_origin[3].x,
            y0=box_origin[3].y,
            x1=box_origin[3].x + BOXWIDTH_EXPERIMENTAL,
            y1=box_origin[3].y + HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_EXPERIMENTAL
        ),
        4 => (
            x0=box_origin[4].x,
            y0=box_origin[4].y,
            x1=box_origin[4].x + BOXWIDTH_EXPERIMENTAL,
            y1=box_origin[4].y + HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_EXPERIMENTAL
        ),
        5 => (
            x0=box_origin[5].x,
            y0=box_origin[5].y,
            x1=box_origin[5].x + BOXWIDTH_EXPERIMENTAL,
            y1=box_origin[5].y + HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_EXPERIMENTAL
        ),
        6 => (
            x0=box_origin[6].x,
            y0=box_origin[6].y,
            x1=box_origin[6].x + BOXWIDTH_EXPERIMENTAL,
            y1=box_origin[6].y + HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_EXPERIMENTAL
        ),
        7 => (
            x0=box_origin[7].x,
            y0=box_origin[7].y,
            x1=box_origin[7].x + BOXES_SEVEN_AND_EIGHT_WIDTH_EXPERIMENTAL,
            y1=box_origin[7].y + BOXES_SEVEN_AND_EIGHT_HEIGHT_EXPERIMENTAL
        ),
        8 => (
            x0=box_origin[8].x,
            y0=box_origin[8].y,
            x1=box_origin[8].x + BOXES_SEVEN_AND_EIGHT_WIDTH_EXPERIMENTAL,
            y1=box_origin[8].y + BOXES_SEVEN_AND_EIGHT_HEIGHT_EXPERIMENTAL
        ),
        9 => (
            x0=box_origin[9].x,
            y0=box_origin[9].y,
            x1=box_origin[9].x + BOXWIDTH_EXPERIMENTAL,
            y1=box_origin[9].y + HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_EXPERIMENTAL
        ),
        10 => (
            x0=box_origin[10].x,
            y0=box_origin[10].y,
            x1=box_origin[10].x + BOXWIDTH_EXPERIMENTAL,
            y1=box_origin[10].y + HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_EXPERIMENTAL
        ),
        11 => (
            x0=box_origin[11].x,
            y0=box_origin[11].y,
            x1=box_origin[11].x + BOXWIDTH_EXPERIMENTAL,
            y1=box_origin[11].y + HEIGHT_FOR_BOXES_WITH_3_LINES_OF_TEXT_EXPERIMENTAL
        ),
        12 => (
            x0=box_origin[12].x,
            y0=box_origin[12].y,
            x1=box_origin[12].x + BOXWIDTH_EXPERIMENTAL,
            y1=box_origin[12].y + HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_EXPERIMENTAL
        )
    )

    arrow_coordinates = Dict(
        :two_to_three => (
            x0=box_origin[2].x + BOXWIDTH_EXPERIMENTAL / 2,
            y0=box_origin[3].y + HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_EXPERIMENTAL / 2,
            x1=box_origin[3].x,
            y1=box_origin[3].y + HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_EXPERIMENTAL / 2
        ),
        :two_to_four => (
            x0=box_origin[2].x + BOXWIDTH_EXPERIMENTAL / 2,
            y0=box_origin[2].y,
            x1=box_origin[2].x + BOXWIDTH_EXPERIMENTAL / 2,
            y1=box_origin[4].y + HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_EXPERIMENTAL
        ),
        :four_to_five => (
            x0=box_origin[4].x + BOXWIDTH_EXPERIMENTAL / 2,
            y0=box_origin[5].y + HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_EXPERIMENTAL / 2,
            x1=box_origin[5].x,
            y1=box_origin[5].y + HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_EXPERIMENTAL / 2
        ),
        :four_to_six => (
            x0=box_origin[4].x + BOXWIDTH_EXPERIMENTAL / 2,
            y0=box_origin[4].y,
            x1=box_origin[4].x + BOXWIDTH_EXPERIMENTAL / 2,
            y1=box_origin[6].y + HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_EXPERIMENTAL
        ),
        :six_to_seven => (
            x0=box_origin[7].x + BOXES_SEVEN_AND_EIGHT_WIDTH_EXPERIMENTAL / 2,
            y0=box_origin[6].y,
            x1=box_origin[7].x + BOXES_SEVEN_AND_EIGHT_WIDTH_EXPERIMENTAL / 2,
            y1=box_origin[7].y + BOXES_SEVEN_AND_EIGHT_HEIGHT_EXPERIMENTAL
        ),
        :six_to_eight => (
            x0=box_origin[8].x + BOXES_SEVEN_AND_EIGHT_WIDTH_EXPERIMENTAL / 2,
            y0=box_origin[6].y,
            x1=box_origin[8].x + BOXES_SEVEN_AND_EIGHT_WIDTH_EXPERIMENTAL / 2,
            y1=box_origin[8].y + BOXES_SEVEN_AND_EIGHT_HEIGHT_EXPERIMENTAL
        ),
        :seven_to_nine => (
            x0=box_origin[7].x + BOXES_SEVEN_AND_EIGHT_WIDTH_EXPERIMENTAL / 2,
            y0=box_origin[9].y + HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_EXPERIMENTAL * 0.66,
            x1=box_origin[9].x,
            y1=box_origin[9].y + HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_EXPERIMENTAL * 0.66
        ),
        :seven_to_ten => (
            x0=box_origin[7].x + BOXES_SEVEN_AND_EIGHT_WIDTH_EXPERIMENTAL / 2,
            y0=box_origin[7].y,
            x1=box_origin[7].x + BOXES_SEVEN_AND_EIGHT_WIDTH_EXPERIMENTAL / 2,
            y1=box_origin[10].y + HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_EXPERIMENTAL
        ),
        :eight_to_nine => (
            x0=box_origin[8].x + BOXES_SEVEN_AND_EIGHT_WIDTH_EXPERIMENTAL / 2,
            y0=box_origin[9].y + HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_EXPERIMENTAL * 0.33,
            x1=box_origin[9].x,
            y1=box_origin[9].y + HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_EXPERIMENTAL * 0.33
        ),
        :eight_to_ten => (
            x0=box_origin[8].x + BOXES_SEVEN_AND_EIGHT_WIDTH_EXPERIMENTAL / 2,
            y0=box_origin[8].y,
            x1=box_origin[8].x + BOXES_SEVEN_AND_EIGHT_WIDTH_EXPERIMENTAL / 2,
            y1=box_origin[10].y + HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_EXPERIMENTAL
        ),
        :ten_to_eleven => (
            x0=box_origin[10].x + BOXWIDTH_EXPERIMENTAL / 2,
            y0=box_origin[11].y + HEIGHT_FOR_BOXES_WITH_3_LINES_OF_TEXT_EXPERIMENTAL / 2,
            x1=box_origin[11].x,
            y1=box_origin[11].y + HEIGHT_FOR_BOXES_WITH_3_LINES_OF_TEXT_EXPERIMENTAL / 2
        ),
        :ten_to_twelve => (
            x0=box_origin[10].x + BOXWIDTH_EXPERIMENTAL / 2,
            y0=box_origin[10].y,
            x1=box_origin[10].x + BOXWIDTH_EXPERIMENTAL / 2,
            y1=box_origin[12].y + HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_EXPERIMENTAL
        )
    )

    text_data = Dict(
        :box1_line1 => (
            "<b>$(data[1, :box_lab])</b>"
        ),
        :box2_line1 => (
            "$(data[2, :box_lab])"
        ),
        :box2_line2 => (
            "<i>n</i> = $(data[2, :n])"
        ),
        :box3_line1 => (
            "<b>$(data[3, :box_lab])</b>"
        ),
        :box3_line2 => (
            "$(data[3, :box_var]) <i>n</i> = $(data[3, :n])"
        ),
        :box4_line1 => (
            "$(data[4, :box_lab])"
        ),
        :box4_line2 => (
            "<i>n</i> = $(data[4, :n])"
        ),
        :box5_line1 => (
            "<b>$(data[5, :box_lab])</b>"
        ),
        :box5_line2 => (
            "$(data[5, :box_var]) <i>n</i> = $(data[5, :n])"
        ),
        :box6_line1 => (
            "$(data[6, :box_lab])"
        ),
        :box6_line2 => (
            "<i>n</i> = $(data[6, :n])"
        ),
        :box7_line1 => (
            "<i>n</i> = $(data[7, :n]) $(data[7, :box_lab])"
        ),
        :box8_line1 => (
            "<i>n</i> = $(data[8, :n]) $(data[8, :box_lab])"
        ),
        :box9_line1 => (
            "<b>$(data[9, :box_lab])</b>"
        ),
        :box9_line2 => (
            "$(data[9, :box_var]) <i>n</i> = $(data[9, :n])"
        ),
        :box10_line1 => (
            "$(data[10, :box_lab])"
        ),
        :box10_line2 => (
            "<i>n</i> = $(data[10, :n])"
        ),
        :box11_line1 => (
            "<b>$(data[11, :box_lab])</b>"
        ),
        :box11_line2 => (
            "$(data[11, :box_var]) <i>n</i> = $(data[11, :n])"
        ),
        :box11_line3 => (
            "$(data[12, :box_var]) <i>n</i> = $(data[12, :n])"
        ),
        :box12_line1 => (
            "$(data[13, :box_lab])"
        ),
        :box12_line2 => (
            "<i>n</i> = $(data[13, :n])"
        )
    )

    text_coordinates = Dict(
        :box1_line1 => (
            x=box_origin[1].x + SHIFT_TEXT_RIGHT_BY_A_NUMBER_EXPERIMENTAL,
            y=box_origin[1].y + LINE1_TEXT_PADDING_BOTTOM_1LINED_BOX_EXPERIMENTAL
        ),
        :box2_line1 => (
            x=box_origin[2].x + SHIFT_TEXT_RIGHT_BY_A_NUMBER_EXPERIMENTAL,
            y=box_origin[2].y + LINE1_TEXT_PADDING_BOTTOM_2LINED_BOX_EXPERIMENTAL
        ),
        :box2_line2 => (
            x=box_origin[2].x + SHIFT_TEXT_RIGHT_BY_A_NUMBER_EXPERIMENTAL,
            y=box_origin[2].y + LINE2_TEXT_PADDING_BOTTOM_2LINED_BOX_EXPERIMENTAL
        ),
        :box3_line1 => (
            x=box_origin[3].x + SHIFT_TEXT_RIGHT_BY_A_NUMBER_EXPERIMENTAL,
            y=box_origin[3].y + LINE1_TEXT_PADDING_BOTTOM_2LINED_BOX_EXPERIMENTAL
        ),
        :box3_line2 => (
            x=box_origin[3].x + SHIFT_TEXT_RIGHT_BY_A_NUMBER_EXPERIMENTAL,
            y=box_origin[3].y + LINE2_TEXT_PADDING_BOTTOM_2LINED_BOX_EXPERIMENTAL
        ),
        :box4_line1 => (
            x=box_origin[4].x + SHIFT_TEXT_RIGHT_BY_A_NUMBER_EXPERIMENTAL,
            y=box_origin[4].y + LINE1_TEXT_PADDING_BOTTOM_2LINED_BOX_EXPERIMENTAL
        ),
        :box4_line2 => (
            x=box_origin[4].x + SHIFT_TEXT_RIGHT_BY_A_NUMBER_EXPERIMENTAL,
            y=box_origin[4].y + LINE2_TEXT_PADDING_BOTTOM_2LINED_BOX_EXPERIMENTAL
        ),
        :box5_line1 => (
            x=box_origin[5].x + SHIFT_TEXT_RIGHT_BY_A_NUMBER_EXPERIMENTAL,
            y=box_origin[5].y + LINE1_TEXT_PADDING_BOTTOM_2LINED_BOX_EXPERIMENTAL
        ),
        :box5_line2 => (
            x=box_origin[5].x + SHIFT_TEXT_RIGHT_BY_A_NUMBER_EXPERIMENTAL,
            y=box_origin[5].y + LINE2_TEXT_PADDING_BOTTOM_2LINED_BOX_EXPERIMENTAL
        ),
        :box6_line1 => (
            x=box_origin[6].x + SHIFT_TEXT_RIGHT_BY_A_NUMBER_EXPERIMENTAL,
            y=box_origin[6].y + LINE1_TEXT_PADDING_BOTTOM_2LINED_BOX_EXPERIMENTAL
        ),
        :box6_line2 => (
            x=box_origin[6].x + SHIFT_TEXT_RIGHT_BY_A_NUMBER_EXPERIMENTAL,
            y=box_origin[6].y + LINE2_TEXT_PADDING_BOTTOM_2LINED_BOX_EXPERIMENTAL
        ),
        :box7_line1 => (
            x=box_origin[7].x + SHIFT_TEXT_RIGHT_BY_A_NUMBER_EXPERIMENTAL,
            y=box_origin[7].y + BOXES_SEVEN_AND_EIGHT_TEXT_PADDING_BOTTOM_EXPERIMENTAL
        ),
        :box8_line1 => (
            x=box_origin[8].x + SHIFT_TEXT_RIGHT_BY_A_NUMBER_EXPERIMENTAL,
            y=box_origin[8].y + BOXES_SEVEN_AND_EIGHT_TEXT_PADDING_BOTTOM_EXPERIMENTAL
        ),
        :box9_line1 => (
            x=box_origin[9].x + SHIFT_TEXT_RIGHT_BY_A_NUMBER_EXPERIMENTAL,
            y=box_origin[9].y + LINE1_TEXT_PADDING_BOTTOM_2LINED_BOX_EXPERIMENTAL
        ),
        :box9_line2 => (
            x=box_origin[9].x + SHIFT_TEXT_RIGHT_BY_A_NUMBER_EXPERIMENTAL,
            y=box_origin[9].y + LINE2_TEXT_PADDING_BOTTOM_2LINED_BOX_EXPERIMENTAL
        ),
        :box10_line1 => (
            x=box_origin[10].x + SHIFT_TEXT_RIGHT_BY_A_NUMBER_EXPERIMENTAL,
            y=box_origin[10].y + LINE1_TEXT_PADDING_BOTTOM_2LINED_BOX_EXPERIMENTAL
        ),
        :box10_line2 => (
            x=box_origin[10].x + SHIFT_TEXT_RIGHT_BY_A_NUMBER_EXPERIMENTAL,
            y=box_origin[10].y + LINE2_TEXT_PADDING_BOTTOM_2LINED_BOX_EXPERIMENTAL
        ),
        :box11_line1 => (
            x=box_origin[11].x + SHIFT_TEXT_RIGHT_BY_A_NUMBER_EXPERIMENTAL,
            y=box_origin[11].y + LINE1_TEXT_PADDING_BOTTOM_3LINED_BOX_EXPERIMENTAL
        ),
        :box11_line2 => (
            x=box_origin[11].x + SHIFT_TEXT_RIGHT_BY_A_NUMBER_EXPERIMENTAL,
            y=box_origin[11].y + LINE2_TEXT_PADDING_BOTTOM_3LINED_BOX_EXPERIMENTAL
        ),
        :box11_line3 => (
            x=box_origin[11].x + SHIFT_TEXT_RIGHT_BY_A_NUMBER_EXPERIMENTAL,
            y=box_origin[11].y + LINE3_TEXT_PADDING_BOTTOM_3LINED_BOX_EXPERIMENTAL
        ),
        :box12_line1 => (
            x=box_origin[12].x + SHIFT_TEXT_RIGHT_BY_A_NUMBER_EXPERIMENTAL,
            y=box_origin[12].y + LINE1_TEXT_PADDING_BOTTOM_2LINED_BOX_EXPERIMENTAL
        ),
        :box12_line2 => (
            x=box_origin[12].x + SHIFT_TEXT_RIGHT_BY_A_NUMBER_EXPERIMENTAL,
            y=box_origin[12].y + LINE2_TEXT_PADDING_BOTTOM_2LINED_BOX_EXPERIMENTAL
        )
    )

    plot(
        scatter(
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
        ),
        Layout(
            xaxis=attr(
                range=[xMINIMUM_EXPERIMENTAL, xMAXIMUM_EXPERIMENTAL],
                showgrid=false,
                ticks=false,
                showticklabels=false
            ),
            yaxis=attr(
                range=[yMINIMUM_EXPERIMENTAL, yMAXIMUM_EXPERIMENTAL],
                showgrid=false,
                ticks=false,
                showticklabels=false
            ),
            width=xMAXIMUM_EXPERIMENTAL,
            height=yMAXIMUM_EXPERIMENTAL,
            margin=attr(t=0, r=0, b=0, l=0),
            plot_bgcolor=transparent_bg ? RGBA(0, 0, 0, 0) : RGBA(1, 1, 1, 1),
            shapes=[
                rect(
                    xref="x",
                    yref="y",
                    layer="below",
                    x0=box_coordinates[1].x0,
                    y0=box_coordinates[1].y0,
                    x1=box_coordinates[1].x1,
                    y1=box_coordinates[1].y1,
                    fillcolor=topboxcolor,
                    line=attr(
                        color="black",
                        width=1
                    )
                ),
                rect(
                    xref="x",
                    yref="y",
                    layer="below",
                    x0=box_coordinates[2].x0,
                    y0=box_coordinates[2].y0,
                    x1=box_coordinates[2].x1,
                    y1=box_coordinates[2].y1,
                    fillcolor=leftboxcolor,
                    line=attr(
                        color="black",
                        width=1
                    )
                ),
                rect(
                    xref="x",
                    yref="y",
                    layer="below",
                    x0=box_coordinates[3].x0,
                    y0=box_coordinates[3].y0,
                    x1=box_coordinates[3].x1,
                    y1=box_coordinates[3].y1,
                    fillcolor=rightboxcolor,
                    line=attr(
                        color="black",
                        width=1
                    )
                ),
                rect(
                    xref="x",
                    yref="y",
                    layer="below",
                    x0=box_coordinates[4].x0,
                    y0=box_coordinates[4].y0,
                    x1=box_coordinates[4].x1,
                    y1=box_coordinates[4].y1,
                    fillcolor=leftboxcolor,
                    line=attr(
                        color="black",
                        width=1
                    )
                ),
                rect(
                    xref="x",
                    yref="y",
                    layer="below",
                    x0=box_coordinates[5].x0,
                    y0=box_coordinates[5].y0,
                    x1=box_coordinates[5].x1,
                    y1=box_coordinates[5].y1,
                    fillcolor=rightboxcolor,
                    line=attr(
                        color="black",
                        width=1
                    )
                ),
                rect(
                    xref="x",
                    yref="y",
                    layer="below",
                    x0=box_coordinates[6].x0,
                    y0=box_coordinates[6].y0,
                    x1=box_coordinates[6].x1,
                    y1=box_coordinates[6].y1,
                    fillcolor=leftboxcolor,
                    line=attr(
                        color="black",
                        width=1
                    )
                ),
                rect(
                    xref="x",
                    yref="y",
                    layer="below",
                    x0=box_coordinates[7].x0,
                    y0=box_coordinates[7].y0,
                    x1=box_coordinates[7].x1,
                    y1=box_coordinates[7].y1,
                    fillcolor=leftboxcolor,
                    line=attr(
                        color="black",
                        width=1
                    )
                ),
                rect(
                    xref="x",
                    yref="y",
                    layer="below",
                    x0=box_coordinates[8].x0,
                    y0=box_coordinates[8].y0,
                    x1=box_coordinates[8].x1,
                    y1=box_coordinates[8].y1,
                    fillcolor=leftboxcolor,
                    line=attr(
                        color="black",
                        width=1
                    )
                ),
                rect(
                    xref="x",
                    yref="y",
                    layer="below",
                    x0=box_coordinates[9].x0,
                    y0=box_coordinates[9].y0,
                    x1=box_coordinates[9].x1,
                    y1=box_coordinates[9].y1,
                    fillcolor=rightboxcolor,
                    line=attr(
                        color="black",
                        width=1
                    )
                ),
                rect(
                    xref="x",
                    yref="y",
                    layer="below",
                    x0=box_coordinates[10].x0,
                    y0=box_coordinates[10].y0,
                    x1=box_coordinates[10].x1,
                    y1=box_coordinates[10].y1,
                    fillcolor=leftboxcolor,
                    line=attr(
                        color="black",
                        width=1
                    )
                ),
                rect(
                    xref="x",
                    yref="y",
                    layer="below",
                    x0=box_coordinates[11].x0,
                    y0=box_coordinates[11].y0,
                    x1=box_coordinates[11].x1,
                    y1=box_coordinates[11].y1,
                    fillcolor=rightboxcolor,
                    line=attr(
                        color="black",
                        width=1
                    )
                ),
                rect(
                    xref="x",
                    yref="y",
                    layer="below",
                    x0=box_coordinates[12].x0,
                    y0=box_coordinates[12].y0,
                    x1=box_coordinates[12].x1,
                    y1=box_coordinates[12].y1,
                    fillcolor=leftboxcolor,
                    line=attr(
                        color="black",
                        width=1
                    )
                )
            ],
            annotations=[
                attr(
                    axref="x",
                    ayref="y",
                    xref="x",
                    yref="y",
                    showarrow=true,
                    ax=arrow_coordinates[:two_to_three].x0,
                    ay=arrow_coordinates[:two_to_three].y0,
                    x=arrow_coordinates[:two_to_three].x1,
                    y=arrow_coordinates[:two_to_three].y1,
                    arrowwidth=2,
                    arrowside="end",
                    hovertext="two_to_three",
                    arrowhead=arrowheadshape,
                    arrowcolor=arrowcolor,
                    arrowsize=arrowheadsize
                ),
                attr(
                    axref="x",
                    ayref="y",
                    xref="x",
                    yref="y",
                    showarrow=true,
                    ax=arrow_coordinates[:two_to_four].x0,
                    ay=arrow_coordinates[:two_to_four].y0,
                    x=arrow_coordinates[:two_to_four].x1,
                    y=arrow_coordinates[:two_to_four].y1,
                    arrowwidth=2,
                    arrowside="end",
                    hovertext="two_to_four",
                    arrowhead=arrowheadshape,
                    arrowcolor=arrowcolor,
                    arrowsize=arrowheadsize
                ),
                attr(
                    axref="x",
                    ayref="y",
                    xref="x",
                    yref="y",
                    showarrow=true,
                    ax=arrow_coordinates[:four_to_five].x0,
                    ay=arrow_coordinates[:four_to_five].y0,
                    x=arrow_coordinates[:four_to_five].x1,
                    y=arrow_coordinates[:four_to_five].y1,
                    arrowwidth=2,
                    arrowside="end",
                    hovertext="four_to_five",
                    arrowhead=arrowheadshape,
                    arrowcolor=arrowcolor,
                    arrowsize=arrowheadsize
                ),
                attr(
                    axref="x",
                    ayref="y",
                    xref="x",
                    yref="y",
                    showarrow=true,
                    ax=arrow_coordinates[:four_to_six].x0,
                    ay=arrow_coordinates[:four_to_six].y0,
                    x=arrow_coordinates[:four_to_six].x1,
                    y=arrow_coordinates[:four_to_six].y1,
                    arrowwidth=2,
                    arrowside="end",
                    hovertext="four_to_six",
                    arrowhead=arrowheadshape,
                    arrowcolor=arrowcolor,
                    arrowsize=arrowheadsize
                ),
                attr(
                    axref="x",
                    ayref="y",
                    xref="x",
                    yref="y",
                    showarrow=true,
                    ax=arrow_coordinates[:six_to_seven].x0,
                    ay=arrow_coordinates[:six_to_seven].y0,
                    x=arrow_coordinates[:six_to_seven].x1,
                    y=arrow_coordinates[:six_to_seven].y1,
                    arrowwidth=2,
                    arrowside="end",
                    hovertext="six_to_seven",
                    arrowhead=arrowheadshape,
                    arrowcolor=arrowcolor,
                    arrowsize=arrowheadsize
                ),
                attr(
                    axref="x",
                    ayref="y",
                    xref="x",
                    yref="y",
                    showarrow=true,
                    ax=arrow_coordinates[:six_to_eight].x0,
                    ay=arrow_coordinates[:six_to_eight].y0,
                    x=arrow_coordinates[:six_to_eight].x1,
                    y=arrow_coordinates[:six_to_eight].y1,
                    arrowwidth=2,
                    arrowside="end",
                    hovertext="six_to_eight",
                    arrowhead=arrowheadshape,
                    arrowcolor=arrowcolor,
                    arrowsize=arrowheadsize
                ),
                attr(
                    axref="x",
                    ayref="y",
                    xref="x",
                    yref="y",
                    showarrow=true,
                    ax=arrow_coordinates[:seven_to_nine].x0,
                    ay=arrow_coordinates[:seven_to_nine].y0,
                    x=arrow_coordinates[:seven_to_nine].x1,
                    y=arrow_coordinates[:seven_to_nine].y1,
                    arrowwidth=2,
                    arrowside="end",
                    hovertext="seven_to_nine",
                    arrowhead=arrowheadshape,
                    arrowcolor=arrowcolor,
                    arrowsize=arrowheadsize
                ),
                attr(
                    axref="x",
                    ayref="y",
                    xref="x",
                    yref="y",
                    showarrow=true,
                    ax=arrow_coordinates[:seven_to_ten].x0,
                    ay=arrow_coordinates[:seven_to_ten].y0,
                    x=arrow_coordinates[:seven_to_ten].x1,
                    y=arrow_coordinates[:seven_to_ten].y1,
                    arrowwidth=2,
                    arrowside="end",
                    hovertext="seven_to_ten",
                    arrowhead=arrowheadshape,
                    arrowcolor=arrowcolor,
                    arrowsize=arrowheadsize
                ),
                attr(
                    axref="x",
                    ayref="y",
                    xref="x",
                    yref="y",
                    showarrow=true,
                    ax=arrow_coordinates[:eight_to_nine].x0,
                    ay=arrow_coordinates[:eight_to_nine].y0,
                    x=arrow_coordinates[:eight_to_nine].x1,
                    y=arrow_coordinates[:eight_to_nine].y1,
                    arrowwidth=2,
                    arrowside="end",
                    hovertext="eight_to_nine",
                    arrowhead=arrowheadshape,
                    arrowcolor=arrowcolor,
                    arrowsize=arrowheadsize
                ),
                attr(
                    axref="x",
                    ayref="y",
                    xref="x",
                    yref="y",
                    showarrow=true,
                    ax=arrow_coordinates[:eight_to_ten].x0,
                    ay=arrow_coordinates[:eight_to_ten].y0,
                    x=arrow_coordinates[:eight_to_ten].x1,
                    y=arrow_coordinates[:eight_to_ten].y1,
                    arrowwidth=2,
                    arrowside="end",
                    hovertext="eight_to_ten",
                    arrowhead=arrowheadshape,
                    arrowcolor=arrowcolor,
                    arrowsize=arrowheadsize
                ),
                attr(
                    axref="x",
                    ayref="y",
                    xref="x",
                    yref="y",
                    showarrow=true,
                    ax=arrow_coordinates[:ten_to_eleven].x0,
                    ay=arrow_coordinates[:ten_to_eleven].y0,
                    x=arrow_coordinates[:ten_to_eleven].x1,
                    y=arrow_coordinates[:ten_to_eleven].y1,
                    arrowwidth=2,
                    arrowside="end",
                    hovertext="ten_to_eleven",
                    arrowhead=arrowheadshape,
                    arrowcolor=arrowcolor,
                    arrowsize=arrowheadsize
                ),
                attr(
                    axref="x",
                    ayref="y",
                    xref="x",
                    yref="y",
                    showarrow=true,
                    ax=arrow_coordinates[:ten_to_twelve].x0,
                    ay=arrow_coordinates[:ten_to_twelve].y0,
                    x=arrow_coordinates[:ten_to_twelve].x1,
                    y=arrow_coordinates[:ten_to_twelve].y1,
                    arrowwidth=2,
                    arrowside="end",
                    hovertext="ten_to_twelve",
                    arrowhead=arrowheadshape,
                    arrowcolor=arrowcolor,
                    arrowsize=arrowheadsize
                )
            ]
        )
    )

end

experimental()