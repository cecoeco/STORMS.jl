using Dash

homeLayout = html_div(
    [
        dcc_link("Home", href="/Home"),
        html_h1(
            "STORMS.jl: Strengthening The Organization and Reporting of Microbiome Studies"
        ),
        html_p(
            "STORMS description"
        )
    ]
)
