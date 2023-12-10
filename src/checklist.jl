using PlotlyJS
using Colors

const xMINIMUM_PAPER_WIDTH::Int64 = 0
const xMAXIMUM_PAPER_WIDTH::Int64 = 850
const yMINIMUM_PAPER_HEIGHT::Int64 = 0
const yMAXIMUM_PAPER_HEIGHT::Int64 = 1100

function checklist(
    transparent_bg::Bool=false,
    textsize::Number=10,
    textfont::AbstractString="Helvetica",
    textcolor="black",
    #textalignment::AbstractString=["left", "center"],
    headertextsize::Number=17,
    headertextfont::AbstractString="Helvetica",
    headertextcolor="black",
    #headertextalignment::AbstractString=["left", "center"]
    celltextsize::Number=17,
    celltextfont::AbstractString="Helvetica",
    celltextcolor="black",
    #celltextalignment::AbstractString=["left", "center"]
)
    plot(
        table(
            header=attr(
                values=[
                    "<b>Number</b>", 
                    "<b>Item</b>", 
                    "<b>Recommendation</b>", 
                    "<b>Item Source</b>", 
                    "<b>Additonal Guidance</b>",
                    "<b>Yes/No/NA</b>", 
                    "<b>Comments or location in manuscript</b>"
                ],
                line_color=RGB(
                    0, 0, 0
                ),
                fill_color=RGB(
                    1, 1, 1
                ),
                align=[
                    "left", 
                    "center"
                ],
                font=attr(
                    color=textcolor,
                    font_family=textfont,
                    size=textsize
                )
            ),
            cells=attr(
                values=[
                    [
                        "<b>Abstract</b>", 
                        "1.0", 
                        "1.1", 
                        "1.2", 
                        "1.3", 
                        "<b>Introduction</b>",
                        "2.0",
                        "2.1",
                        "<b>Methods</b>",
                        "3.0",
                        "3.1",
                        "3.2",
                        "3.3",
                        "3.4",
                        "3.5",
                        "3.6",
                        "3.7",
                        "3.8",
                        "3.9",
                        "4.0",
                        "4.1",
                        "4.2",
                        "4.3",
                        "4.4",
                        "4.5",
                        "4.6",
                        "4.7",
                        "4.8",
                        "4.9",
                        "4.10",
                        "4.11",
                        "4.12",
                        "4.13",
                        "4.14",
                        "4.15",
                        "4.16",
                        "5.0",
                        "6.0",
                        "6.1",
                        "7.0",
                        "7.1",
                        "7.2",
                        "7.3",
                        "7.4",
                        "7.5",
                        "7.6",
                        "7.7",
                        "7.8",
                        "7.9",
                        "8.0",
                        "8.1",
                        "8.2",
                        "8.3",
                        "8.4",
                        "8.5",
                        "<b>Results</b>",
                        "9.0",
                        "10.0",
                        "10.1",
                        "10.2",
                        "10.3",
                        "10.4",
                        "<b>Discussion</b>",
                        "11.0",
                        "12.0",
                        "13.0",
                        "13.1",
                        "13.2",
                        "14.0",
                        "<b>Other Information</b>",
                        "15.0",
                        "15.1",
                        "15.2",
                        "16.0",
                        "17.0"
                    ],
                    [
                        "", 
                        "Structured or Unstructured Abstract", 
                        "Study Design", 
                        "Sequencing Methods", 
                        "Specimens",
                        "",
                        "Background and Rationale",
                        "",

                    ],
                    [
                        1300000, 20000, 70000, 2000, 130902000
                    ],
                    [
                        1300000, 20000, 120000, 2000, 131222000
                    ],
                    [
                        1400000, 20000, 90000, 2000, 14102000
                    ],
                    [
                        ""
                    ],
                    [
                        ""
                    ]
                ],
                line_color=RGB(
                    0, 0, 0
                ),
                fill_color=RGB(
                    1, 1, 1
                ),
                align=[
                    "left", 
                    "center"
                ],
                font=attr(
                    color=textcolor,
                    font_family=textfont,
                    size=textsize
                ),
              # format=[]
            )
        ),
        Layout(
            width=xMAXIMUM_PAPER_WIDTH,
            height=yMAXIMUM_PAPER_HEIGHT,
            xaxis=attr(
                range=[
                    xMINIMUM_PAPER_WIDTH, 
                    xMAXIMUM_PAPER_WIDTH
                ],
                showgrid=false
            ),
            yaxis=attr(
                range=[
                    yMINIMUM_PAPER_HEIGHT, 
                    yMAXIMUM_PAPER_HEIGHT
                ],
                showgrid=false
            ),
            margin=attr(
                t=0, l=0, r=0, b=0
            ),
            plot_bgcolor=plot_bgcolor = transparent_bg ? RGBA(0, 0, 0, 0) : RGBA(1, 1, 1, 1),
        )
    )
end

checklist()