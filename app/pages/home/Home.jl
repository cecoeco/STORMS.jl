using Dash

homeLayout = html_div(
    children=[
        html_h1(
            "STORMS.jl: Strengthening The Organization and Reporting of Microbiome Studies"
        ),
        html_p(
            "Published in Nature Medicine, the STORMS guideline offers a comprehensive framework that addresses the challenges of interdisciplinary microbiome studies. The checklist is divided into six sections and consists of 17 items. It covers various aspects, such as study design, information about participants, laboratory methods, data sources, bioinformatics, statistical methods, and reproducibility."
        ),
        html_p(
            "During manuscript preparation and peer review, the checklist helps enhance the clarity and completeness of microbiome study reports. Item 3.6 in the checklist includes two optional flowcharts that showcase sample sizes. The flowchart provides a clear overview of the participant selection and exclusion process. This addition aims to enhance the transparency and comprehensibility of reporting for microbiome studies."
        ),
        html_p(
            children=[
                "For more information, check out, ",
                html_a(
                    "https://www.stormsmicrobiome.org.",
                    href = "https://www.stormsmicrobiome.org"
                )
            ]
        )
    ]
)