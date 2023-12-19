using PlotlyJS
using Colors
using CSV
using DataFrames

const xMINIMUM_WIDTH_CHECKLIST::Int64 = 0
const xMAXIMUM_WIDTH_CHECKLIST::Int64 = 1200
const yMINIMUM_HEIGHT_CHECKLIST::Int64 = 0
const yMAXIMUM_HEIGHT_CHECKLIST::Int64 = 600

function checklist(
    checklist_data="docs/checklist_data.csv",
    transparent_bg::Bool=false,
    textsize=nothing,
    textfont=nothing,
    textcolor=nothing,
    fillcolor=nothing,
    textalignment=[nothing, nothing],
    linecolor="black",
    headertextsize::Number=17,
    headertextfont::AbstractString="Helvetica",
    headertextcolor="black",
    headertextalignment::Vector{String}=["left", "center"],
    headerfillcolor="lightgray",
    celltextsize::Number=17,
    celltextfont::AbstractString="Helvetica",
    celltextcolor="black",
    cellfillcolor="white",
    celltextalignment::Vector{String}=["left", "center"]
)

    data = CSV.read(checklist_data, DataFrame)
    
    plot(
        table(
            header=attr(
                values=[
                    data[1, 1], # NUMBER
                    data[1, 2], # ITEM
                    data[1, 3], # RECOMMENDATION
                    data[1, 4], # ITEM SOURCE
                    data[1, 5], # ADDITIONAL GUIDANCE
                    data[1, 6], # YES/NO/NA
                    data[1, 7]  # COMMENTS OR LOCATION IN MANUSCRIPT
                ],
                line_color=linecolor,
                fill_color=if fillcolor === nothing 
                    headerfillcolor
                else
                    fillcolor
                end,
                align=if textalignment === nothing
                    headertextalignment
                else
                    textalignment
                end,
                font=attr(
                    color=if textcolor === nothing
                        headertextcolor
                    else
                        textcolor
                    end,
                    font_family=if textfont === nothing
                        headertextfont
                    else
                        textfont
                    end,
                    size=if textsize === nothing
                        headertextsize
                    else
                        textsize
                    end
                )
            ),
            cells=attr(
                values=[
                    data[2:end, 1], # NUMBER
                    data[2:end, 2], # ITEM
                    data[2:end, 3], # RECOMMENDATION
                    data[2:end, 4], # ITEM SOURCE
                    data[2:end, 5], # ADDITIONAL GUIDANCE
                    data[2:end, 6], # YES/NO/NA
                    data[2:end, 7]  # COMMENTS OR LOCATION IN MANUSCRIPT
                ],
                line_color=linecolor,
                fill_color=if fillcolor === nothing
                    cellfillcolor 
                else 
                    fillcolor 
                end,
                align=if textalignment === nothing
                    celltextalignment
                else
                    textalignment
                end,
                font=attr(
                    color=if textcolor === nothing
                        celltextcolor
                    else
                        textcolor
                    end,
                    font_family=if textfont === nothing
                        celltextfont
                    else
                        textfont
                    end,
                    size=if textsize === nothing
                        celltextsize
                    else
                        textsize
                    end
                )
            )
        ),
        Layout(
            xaxis=attr(
                range=[
                    xMINIMUM_WIDTH_CHECKLIST,
                    xMAXIMUM_WIDTH_CHECKLIST
                ],
                showgrid=false
            ),
            yaxis=attr(
                range=[
                    yMINIMUM_HEIGHT_CHECKLIST,
                    yMAXIMUM_HEIGHT_CHECKLIST
                ],
                showgrid=false
            ),
            plot_bgcolor=if transparent_bg == true
                RGBA(0, 0, 0, 0)
            else
                RGBA(1, 1, 1, 1)
            end
        )
    )
end

checklist()