using Dash

homeLayout = html_div(
    [
        dcc_link("Home", href="/Home"),
        html_h1(
            "STORMS.jl: Strengthening The Organization and Reporting of Microbiome Studies"
        ),
        html_p(
            "STORMS description"
        ),
        html_h2(
            "Checklist"
        ),
        html_p(
            "Checklist description"
        ),
        html_h2(
            "Flowcharts"
        ),
        html_p(
            "Flowchart description"
        ),
        html_h3(
            "Observational"
        ),
        html_p(
            "Observational description"
        ),
        html_h3(
            "Experimental"
        ),
        html_p(
            "Experimental description"
        )
    ]
)
