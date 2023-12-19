using PlotlyJS
using Colors
using CSV
using DataFrames

const xMINIMUM_OBSERVATIONAL::Int64 = 0
const xMAXIMUM_OBSERVATIONAL::Int64 = 800

const yMINIMUM_OBSERVATIONAL::Int64 = 0
const yMAXIMUM_OBSERVATIONAL::Int64 = 800

const BOXWIDTH_OBSERVATIONAL::Float64 = xMAXIMUM_OBSERVATIONAL / 2.5
const HEIGHT_FOR_BOXES_WITH_1_LINE_OF_TEXT_OBSERVATIONAL::Float64 = yMAXIMUM_OBSERVATIONAL * 0.05
const HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_OBSERVATIONAL::Float64 = HEIGHT_FOR_BOXES_WITH_1_LINE_OF_TEXT_OBSERVATIONAL * 1.5
const HEIGHT_FOR_BOXES_WITH_3_LINES_OF_TEXT_OBSERVATIONAL::Float64 = HEIGHT_FOR_BOXES_WITH_1_LINE_OF_TEXT_OBSERVATIONAL * 2

const x0_COLUMN1_OBSERVATIONAL::Float64 = 40
const x0_COLUMN2_OBSERVATIONAL::Float64 = x0_COLUMN1_OBSERVATIONAL + xMAXIMUM_OBSERVATIONAL / 2

const y0_ROW1_OBSERVATIONAL::Int64 = yMAXIMUM_OBSERVATIONAL - 125
const y0_ROW2_OBSERVATIONAL::Int64 = y0_ROW1_OBSERVATIONAL - 75
const y0_ROW3_OBSERVATIONAL::Int64 = y0_ROW2_OBSERVATIONAL - 125
const y0_ROW4_OBSERVATIONAL::Int64 = y0_ROW3_OBSERVATIONAL - 125
const y0_ROW5_OBSERVATIONAL::Int64 = y0_ROW4_OBSERVATIONAL - 125
const y0_ROW6_OBSERVATIONAL::Int64 = y0_ROW5_OBSERVATIONAL - 125

const SHIFT_TEXT_RIGHT_BY_A_NUMBER_OBSERVATIONAL::Int64 = 8

const LINE1_TEXT_PADDING_BOTTOM_1LINED_BOX_OBSERVATIONAL::Float64 = HEIGHT_FOR_BOXES_WITH_1_LINE_OF_TEXT_OBSERVATIONAL * 0.50

const LINE1_TEXT_PADDING_BOTTOM_2LINED_BOX_OBSERVATIONAL::Float64 = HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_OBSERVATIONAL * 0.66
const LINE2_TEXT_PADDING_BOTTOM_2LINED_BOX_OBSERVATIONAL::Float64 = HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_OBSERVATIONAL * 0.33

const LINE1_TEXT_PADDING_BOTTOM_3LINED_BOX_OBSERVATIONAL::Float64 = HEIGHT_FOR_BOXES_WITH_3_LINES_OF_TEXT_OBSERVATIONAL * 0.75
const LINE2_TEXT_PADDING_BOTTOM_3LINED_BOX_OBSERVATIONAL::Float64 = HEIGHT_FOR_BOXES_WITH_3_LINES_OF_TEXT_OBSERVATIONAL * 0.50
const LINE3_TEXT_PADDING_BOTTOM_3LINED_BOX_OBSERVATIONAL::Float64 = HEIGHT_FOR_BOXES_WITH_3_LINES_OF_TEXT_OBSERVATIONAL * 0.25

function observational(
    observational_data="docs/observational_data.csv",
    transparent_bg::Bool=false,
    topboxcolor="white",
    leftboxcolor="white",
    rightboxcolor="white",
    textsize::Number=17,
    textfont::AbstractString="Helvetica",
    textcolor="black",
    arrowheadshape::Int64=2,
    arrowcolor="black",
    arrowheadsize::Number=1
)

    data = CSV.read(observational_data, DataFrame)

    box_origin = Dict(
        1 => (
            x=x0_COLUMN1_OBSERVATIONAL,
            y=y0_ROW1_OBSERVATIONAL
        ),
        2 => (
            x=x0_COLUMN1_OBSERVATIONAL,
            y=y0_ROW2_OBSERVATIONAL
        ),
        3 => (
            x=x0_COLUMN2_OBSERVATIONAL,
            y=(y0_ROW2_OBSERVATIONAL + y0_ROW3_OBSERVATIONAL) / 2
        ),
        4 => (
            x=x0_COLUMN1_OBSERVATIONAL,
            y=y0_ROW3_OBSERVATIONAL
        ),
        5 => (
            x=x0_COLUMN2_OBSERVATIONAL,
            y=(y0_ROW3_OBSERVATIONAL + y0_ROW4_OBSERVATIONAL) / 2
        ),
        6 => (
            x=x0_COLUMN1_OBSERVATIONAL,
            y=y0_ROW4_OBSERVATIONAL
        ),
        7 => (
            x=x0_COLUMN2_OBSERVATIONAL,
            y=(y0_ROW4_OBSERVATIONAL + y0_ROW5_OBSERVATIONAL) / 2
        ),
        8 => (
            x=x0_COLUMN1_OBSERVATIONAL,
            y=y0_ROW5_OBSERVATIONAL
        ),
        9 => (
            x=x0_COLUMN2_OBSERVATIONAL,
            y=(y0_ROW5_OBSERVATIONAL + y0_ROW6_OBSERVATIONAL) / 2.25
        ),
        10 => (
            x=x0_COLUMN1_OBSERVATIONAL,
            y=y0_ROW6_OBSERVATIONAL
        )
    )

    box_coordinates = Dict(
        1 => (
            x0=box_origin[1].x,
            y0=box_origin[1].y,
            x1=box_origin[1].x + (x0_COLUMN2_OBSERVATIONAL - x0_COLUMN1_OBSERVATIONAL) + BOXWIDTH_OBSERVATIONAL,
            y1=box_origin[1].y + HEIGHT_FOR_BOXES_WITH_1_LINE_OF_TEXT_OBSERVATIONAL
        ),
        2 => (
            x0=box_origin[2].x,
            y0=box_origin[2].y,
            x1=box_origin[2].x + BOXWIDTH_OBSERVATIONAL,
            y1=box_origin[2].y + HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_OBSERVATIONAL
        ),
        3 => (
            x0=box_origin[3].x,
            y0=box_origin[3].y,
            x1=box_origin[3].x + BOXWIDTH_OBSERVATIONAL,
            y1=box_origin[3].y + HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_OBSERVATIONAL
        ),
        4 => (
            x0=box_origin[4].x,
            y0=box_origin[4].y,
            x1=box_origin[4].x + BOXWIDTH_OBSERVATIONAL,
            y1=box_origin[4].y + HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_OBSERVATIONAL
        ),
        5 => (
            x0=box_origin[5].x,
            y0=box_origin[5].y,
            x1=box_origin[5].x + BOXWIDTH_OBSERVATIONAL,
            y1=box_origin[5].y + HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_OBSERVATIONAL
        ),
        6 => (
            x0=box_origin[6].x,
            y0=box_origin[6].y,
            x1=box_origin[6].x + BOXWIDTH_OBSERVATIONAL,
            y1=box_origin[6].y + HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_OBSERVATIONAL
        ),
        7 => (
            x0=box_origin[7].x,
            y0=box_origin[7].y,
            x1=box_origin[7].x + BOXWIDTH_OBSERVATIONAL,
            y1=box_origin[7].y + HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_OBSERVATIONAL
        ),
        8 => (
            x0=box_origin[8].x,
            y0=box_origin[8].y,
            x1=box_origin[8].x + BOXWIDTH_OBSERVATIONAL,
            y1=box_origin[8].y + HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_OBSERVATIONAL
        ),
        9 => (
            x0=box_origin[9].x,
            y0=box_origin[9].y,
            x1=box_origin[9].x + BOXWIDTH_OBSERVATIONAL,
            y1=box_origin[9].y + HEIGHT_FOR_BOXES_WITH_3_LINES_OF_TEXT_OBSERVATIONAL
        ),
        10 => (
            x0=box_origin[10].x,
            y0=box_origin[10].y,
            x1=box_origin[10].x + BOXWIDTH_OBSERVATIONAL,
            y1=box_origin[10].y + HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_OBSERVATIONAL
        )
    )

    arrow_coordinates = Dict(
        :two_to_three => (
            x0=box_origin[2].x + BOXWIDTH_OBSERVATIONAL / 2,
            y0=box_origin[3].y + HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_OBSERVATIONAL / 2,
            x1=box_origin[3].x,
            y1=box_origin[3].y + HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_OBSERVATIONAL / 2
        ),
        :two_to_four => (
            x0=box_origin[2].x + BOXWIDTH_OBSERVATIONAL / 2,
            y0=box_origin[2].y,
            x1=box_origin[2].x + BOXWIDTH_OBSERVATIONAL / 2,
            y1=box_origin[4].y + HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_OBSERVATIONAL
        ),
        :four_to_five => (
            x0=box_origin[4].x + BOXWIDTH_OBSERVATIONAL / 2,
            y0=box_origin[5].y + HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_OBSERVATIONAL / 2,
            x1=box_origin[5].x,
            y1=box_origin[5].y + HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_OBSERVATIONAL / 2
        ),
        :four_to_six => (
            x0=box_origin[4].x + BOXWIDTH_OBSERVATIONAL / 2,
            y0=box_origin[4].y,
            x1=box_origin[4].x + BOXWIDTH_OBSERVATIONAL / 2,
            y1=box_origin[6].y + HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_OBSERVATIONAL
        ),
        :six_to_seven => (
            x0=box_origin[6].x + BOXWIDTH_OBSERVATIONAL / 2,
            y0=box_origin[7].y + HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_OBSERVATIONAL / 2,
            x1=box_origin[7].x,
            y1=box_origin[7].y + HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_OBSERVATIONAL / 2
        ),
        :six_to_eight => (
            x0=box_origin[6].x + BOXWIDTH_OBSERVATIONAL / 2,
            y0=box_origin[6].y,
            x1=box_origin[6].x + BOXWIDTH_OBSERVATIONAL / 2,
            y1=box_origin[8].y + HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_OBSERVATIONAL
        ),
        :eight_to_nine => (
            x0=box_origin[8].x + BOXWIDTH_OBSERVATIONAL / 2,
            y0=box_origin[9].y + HEIGHT_FOR_BOXES_WITH_3_LINES_OF_TEXT_OBSERVATIONAL / 2,
            x1=box_origin[9].x,
            y1=box_origin[9].y + HEIGHT_FOR_BOXES_WITH_3_LINES_OF_TEXT_OBSERVATIONAL / 2
        ),
        :eight_to_ten => (
            x0=box_origin[8].x + BOXWIDTH_OBSERVATIONAL / 2,
            y0=box_origin[8].y,
            x1=box_origin[8].x + BOXWIDTH_OBSERVATIONAL / 2,
            y1=box_origin[10].y + HEIGHT_FOR_BOXES_WITH_2_LINES_OF_TEXT_OBSERVATIONAL
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
            "<b>$(data[7, :box_lab])</b>"
        ),
        :box7_line2 => (
            "$(data[7, :box_var]) <i>n</i> = $(data[7, :n])"
        ),
        :box8_line1 => (
            "$(data[8, :box_lab])"
        ),
        :box8_line2 => (
            "<i>n</i> = $(data[8, :n])"
        ),
        :box9_line1 => (
            "<b>$(data[9, :box_lab])</b>"
        ),
        :box9_line2 => (
            "$(data[9, :box_var]) <i>n</i> = $(data[9, :n])"
        ),
        :box9_line3 => (
            "$(data[10, :box_var]) <i>n</i> = $(data[10, :n])"
        ),
        :box10_line1 => (
            "$(data[11, :box_lab])"
        ),
        :box10_line2 => (
            "<i>n</i> = $(data[11, :n])"
        )
    )
    
    text_coordinates = Dict(
        :box1_line1 => (
            x=box_origin[1].x + SHIFT_TEXT_RIGHT_BY_A_NUMBER_OBSERVATIONAL,
            y=box_origin[1].y + LINE1_TEXT_PADDING_BOTTOM_1LINED_BOX_OBSERVATIONAL
        ),
        :box2_line1 => (
            x=box_origin[2].x + SHIFT_TEXT_RIGHT_BY_A_NUMBER_OBSERVATIONAL,
            y=box_origin[2].y + LINE1_TEXT_PADDING_BOTTOM_2LINED_BOX_OBSERVATIONAL
        ),
        :box2_line2 => (
            x=box_origin[2].x + SHIFT_TEXT_RIGHT_BY_A_NUMBER_OBSERVATIONAL,
            y=box_origin[2].y + LINE2_TEXT_PADDING_BOTTOM_2LINED_BOX_OBSERVATIONAL
        ),
        :box3_line1 => (
            x=box_origin[3].x + SHIFT_TEXT_RIGHT_BY_A_NUMBER_OBSERVATIONAL,
            y=box_origin[3].y + LINE1_TEXT_PADDING_BOTTOM_2LINED_BOX_OBSERVATIONAL
        ),
        :box3_line2 => (
            x=box_origin[3].x + SHIFT_TEXT_RIGHT_BY_A_NUMBER_OBSERVATIONAL,
            y=box_origin[3].y + LINE2_TEXT_PADDING_BOTTOM_2LINED_BOX_OBSERVATIONAL
        ),
        :box4_line1 => (
            x=box_origin[4].x + SHIFT_TEXT_RIGHT_BY_A_NUMBER_OBSERVATIONAL,
            y=box_origin[4].y + LINE1_TEXT_PADDING_BOTTOM_2LINED_BOX_OBSERVATIONAL
        ),
        :box4_line2 => (
            x=box_origin[4].x + SHIFT_TEXT_RIGHT_BY_A_NUMBER_OBSERVATIONAL,
            y=box_origin[4].y + LINE2_TEXT_PADDING_BOTTOM_2LINED_BOX_OBSERVATIONAL
        ),
        :box5_line1 => (
            x=box_origin[5].x + SHIFT_TEXT_RIGHT_BY_A_NUMBER_OBSERVATIONAL,
            y=box_origin[5].y + LINE1_TEXT_PADDING_BOTTOM_2LINED_BOX_OBSERVATIONAL
        ),
        :box5_line2 => (
            x=box_origin[5].x + SHIFT_TEXT_RIGHT_BY_A_NUMBER_OBSERVATIONAL,
            y=box_origin[5].y + LINE2_TEXT_PADDING_BOTTOM_2LINED_BOX_OBSERVATIONAL
        ),
        :box6_line1 => (
            x=box_origin[6].x + SHIFT_TEXT_RIGHT_BY_A_NUMBER_OBSERVATIONAL,
            y=box_origin[6].y + LINE1_TEXT_PADDING_BOTTOM_2LINED_BOX_OBSERVATIONAL
        ),
        :box6_line2 => (
            x=box_origin[6].x + SHIFT_TEXT_RIGHT_BY_A_NUMBER_OBSERVATIONAL,
            y=box_origin[6].y + LINE2_TEXT_PADDING_BOTTOM_2LINED_BOX_OBSERVATIONAL
        ),
        :box7_line1 => (
            x=box_origin[7].x + SHIFT_TEXT_RIGHT_BY_A_NUMBER_OBSERVATIONAL,
            y=box_origin[7].y + LINE1_TEXT_PADDING_BOTTOM_2LINED_BOX_OBSERVATIONAL
        ),
        :box7_line2 => (
            x=box_origin[7].x + SHIFT_TEXT_RIGHT_BY_A_NUMBER_OBSERVATIONAL,
            y=box_origin[7].y + LINE2_TEXT_PADDING_BOTTOM_2LINED_BOX_OBSERVATIONAL
        ),
        :box8_line1 => (
            x=box_origin[8].x + SHIFT_TEXT_RIGHT_BY_A_NUMBER_OBSERVATIONAL,
            y=box_origin[8].y + LINE1_TEXT_PADDING_BOTTOM_2LINED_BOX_OBSERVATIONAL
        ),
        :box8_line2 => (
            x=box_origin[8].x + SHIFT_TEXT_RIGHT_BY_A_NUMBER_OBSERVATIONAL,
            y=box_origin[8].y + LINE2_TEXT_PADDING_BOTTOM_2LINED_BOX_OBSERVATIONAL
        ),
        :box9_line1 => (
            x=box_origin[9].x + SHIFT_TEXT_RIGHT_BY_A_NUMBER_OBSERVATIONAL,
            y=box_origin[9].y + LINE1_TEXT_PADDING_BOTTOM_3LINED_BOX_OBSERVATIONAL
        ),
        :box9_line2 => (
            x=box_origin[9].x + SHIFT_TEXT_RIGHT_BY_A_NUMBER_OBSERVATIONAL,
            y=box_origin[9].y + LINE2_TEXT_PADDING_BOTTOM_3LINED_BOX_OBSERVATIONAL
        ),
        :box9_line3 => (
            x=box_origin[9].x + SHIFT_TEXT_RIGHT_BY_A_NUMBER_OBSERVATIONAL,
            y=box_origin[9].y + LINE3_TEXT_PADDING_BOTTOM_3LINED_BOX_OBSERVATIONAL
        ),
        :box10_line1 => (
            x=box_origin[10].x + SHIFT_TEXT_RIGHT_BY_A_NUMBER_OBSERVATIONAL,
            y=box_origin[10].y + LINE1_TEXT_PADDING_BOTTOM_2LINED_BOX_OBSERVATIONAL
        ),
        :box10_line2 => (
            x=box_origin[10].x + SHIFT_TEXT_RIGHT_BY_A_NUMBER_OBSERVATIONAL,
            y=box_origin[10].y + LINE2_TEXT_PADDING_BOTTOM_2LINED_BOX_OBSERVATIONAL
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
                range=[xMINIMUM_OBSERVATIONAL, xMAXIMUM_OBSERVATIONAL],
                showgrid=false,
                ticks=false,
                showticklabels=false
            ),
            yaxis=attr(
                range=[yMINIMUM_OBSERVATIONAL, yMAXIMUM_OBSERVATIONAL],
                showgrid=false,
                ticks=false,
                showticklabels=false
            ),
            width=xMAXIMUM_OBSERVATIONAL,
            height=yMAXIMUM_OBSERVATIONAL,
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
                )
            ]
        )
    )
    
end

observational()
