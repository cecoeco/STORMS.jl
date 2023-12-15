using DataFrames
using CSV

obeservational_data = DataFrame(
    box_num = [
        1, 
        2, 
        3, 
        4, 
        5, 
        6, 
        7, 
        8, 
        9, 
        9, 
        10
    ],
    box_lab = [
        "Observational",
        "Expression of interest",
        "Assessment for eligibility:",
        "Screened",
        "Excluded:",
        "Recruited",
        "Drop out:",
        "Data available for analysis",
        "Excluded:",
        "Excluded",
        "Total samples included in the analysis"
    ],
    box_var = [
        "",
        "",
        "xxxx",
        "",
        "xxxx",
        "",
        "xxxx",
        "",
        "Lack of sequencing",
        "Low number of reads",
        ""
    ],
    n = [
        "",
        "xx",
        "xx",
        "xx",
        "xx",
        "xx",
        "xx",
        "xx",
        "xx",
        "xx",
        "xx"
    ]
)

experimental_data = DataFrame(
    box_num = [
        1, 
        2, 
        3, 
        4, 
        5, 
        6, 
        7, 
        8, 
        9, 
        10, 
        11,
        11, 
        12
    ],
    box_lab = [
        "Experimental",
        "Expression of interest",
        "Assessment for eligibility:",
        "Screened",
        "Excluded:",
        "Recruited and randomized",
        "Group 1","Group 2",
        "Drop out:",
        "Completed trial",
        "Excluded:",
        "Excluded:",
        "Total samples included in the analysis"
    ],
    box_var = [
        "",
        "",
        "xxxx",
        "",
        "xxxx",
        "",
        "",
        "",
        "xxxx",
        "",
        "Lack of sequencing",
        "Low number of reads",
        ""
    ],
    n = [
        "",
        "xx",
        "xx",
        "xx",
        "xx",
        "xx",
        "xx",
        "xx",
        "xx",
        "xx",
        "xx",
        "xx",
        "xx"
    ]
)

function export_csv(
    obeservational_data=obeservational_data, 
    experimental_data=experimental_data,
    save_location=pwd()
)
    CSV.write(
        "$save_location/obeservational_data.csv", 
        obeservational_data
    )
    CSV.write(
        "$save_location/experimental_data.csv", 
        experimental_data
    )
end
